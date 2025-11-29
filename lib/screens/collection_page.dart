import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionPage extends StatelessWidget {
  final String title;
  const CollectionPage({Key? key, this.title = 'Collection'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = List.generate(6, (i) => {
          'title': 'Product ${i + 1}',
          'price': (10 + i * 5) == 0 ? '£10.00' : '£${10 + i * 5}.00',
          'image': 'https://via.placeholder.com/400x400?text=Product+${i + 1}',
        });

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
                  const SizedBox(height: 20),

                  LayoutBuilder(builder: (context, constraints) {
                    final columns = constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 400 ? 2 : 1);
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final p = products[index];
                        return ProductCard(
                          title: p['title']!,
                          price: p['price']!,
                          imageUrl: p['image']!,
                        );
                      },
                    );
                  }),
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
