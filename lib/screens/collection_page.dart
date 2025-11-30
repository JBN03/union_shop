import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/screens/product_page.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late String collectionId;
  late String title;
  late Future<List<Product>> _productsFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    collectionId = args != null && args['id'] is String ? args['id'] as String : 'new';
    title = args != null && args['title'] is String ? args['title'] as String : 'Collection';
    _productsFuture = ProductService.instance.getProductsForCollection(collectionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
              onAccount: () {},
              onCart: () {},
              onMenu: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  // Filters (non-functional)
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Sort by', border: OutlineInputBorder()),
                          items: const [
                            DropdownMenuItem(value: 'popular', child: Text('Most popular')),
                            DropdownMenuItem(value: 'latest', child: Text('Latest')),
                            DropdownMenuItem(value: 'price_low', child: Text('Price: low to high')),
                          ],
                          onChanged: (_) {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Filter', border: OutlineInputBorder()),
                          items: const [
                            DropdownMenuItem(value: 'all', child: Text('All')),
                            DropdownMenuItem(value: 'in_stock', child: Text('In stock')),
                            DropdownMenuItem(value: 'sale', child: Text('On sale')),
                          ],
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  FutureBuilder<List<Product>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(height: 240, child: Center(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                      final products = snapshot.data ?? [];

                      return LayoutBuilder(builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final spacing = 16.0;

                        // compute a target card width similar to HomeScreen logic
                        final desiredFourColWidth = (width - spacing * 3) / 4;
                        final targetCardWidth = desiredFourColWidth.clamp(140.0, 360.0);

                        final crossAxisCount = width > 800 ? 3 : (width > 400 ? 2 : 1);

                        return Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: targetCardWidth * crossAxisCount + spacing * (crossAxisCount - 1)),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: products.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: spacing,
                                mainAxisSpacing: spacing,
                                childAspectRatio: 0.85,
                              ),
                              itemBuilder: (context, index) {
                                final p = products[index];
                                return Center(
                                  child: SizedBox(
                                    width: targetCardWidth,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (ctx) => ProductPage(product: p)),
                                      ),
                                      child: ProductCard(
                                        title: p.title,
                                        price: p.price,
                                        imageUrl: p.imageUrl,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
