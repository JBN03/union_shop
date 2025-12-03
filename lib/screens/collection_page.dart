import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/collection_filters.dart';
import 'package:union_shop/widgets/collection_grid.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late String collectionId;
  late String title;
  late Future<List<Product>> _productsFuture;
  
  int _page = 0;
  final int _pageSize = 12;

  void _goToPage(int page, int pageCount) {
    final next = page < 0 ? 0 : (page >= pageCount ? pageCount - 1 : page);
    setState(() => _page = next);
  }

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

                  
                  CollectionFilters(
                    sortValue: null,
                    onSortChanged: (_) {},
                    filterValue: null,
                    onFilterChanged: (_) {},
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

                      return CollectionGrid(
                        products: products,
                        page: _page,
                        pageSize: _pageSize,
                        onPage: (p) => _goToPage(p, (products.isEmpty ? 0 : (products.length / _pageSize).ceil())),
                        onProductTap: (product, collectionSlug) => Navigator.pushNamed(
                          context,
                          '/collection/$collectionSlug/product/${product.slug}',
                          arguments: product,
                        ),
                        collectionSlug: collectionId,
                      );
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
