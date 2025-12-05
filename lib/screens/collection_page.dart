import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/widgets/collection_filters.dart';
import 'package:union_shop/widgets/collection_grid.dart';

class CollectionPage extends StatefulWidget {
  final String? collectionId;
  
  const CollectionPage({Key? key, this.collectionId}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late String collectionId;
  late String title;
  late Future<List<Product>> _productsFuture;
  
  int _page = 0;
  final int _pageSize = 9;
  String _sortValue = 'Featured';
  String _filterValue = 'All products';

  void _goToPage(int page, int pageCount) {
    final next = page < 0 ? 0 : (page >= pageCount ? pageCount - 1 : page);
    setState(() => _page = next);
  }

  List<Product> _applyFiltersAndSort(List<Product> products) {
    var result = List<Product>.from(products);
    
    switch (_sortValue) {
      case 'Price: Low to High':
        result.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        result.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'A-Z':
        result.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z-A':
        result.sort((a, b) => b.title.compareTo(a.title));
        break;
    }
    
    return result;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    collectionId = widget.collectionId ?? (args != null && args['id'] is String ? args['id'] as String : 'new');
    title = args != null && args['title'] is String ? args['title'] as String : 'Collection';
    _productsFuture = ProductService.instance.getProductsForCollection(collectionId);

    
    if ((args == null || args['title'] == null) && collectionId.isNotEmpty) {
      ProductService.instance.getCollections().then((cols) {
        try {
          final Collection? match = cols.isNotEmpty
              ? cols.firstWhere((c) => c.id == collectionId, orElse: () => cols.first)
              : null;
          if (match != null && mounted) {
            setState(() {
              title = match.title;
            });
          }
        } catch (_) {
          
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWithFooter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              onLogoTap: () => context.go('/'),
              onAccount: () {},
              onCart: () => context.push('/cart'),
              onMenu: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 8),

                  
                  CollectionFilters(
                    sortValue: _sortValue,
                    onSortChanged: (val) => setState(() { _sortValue = val ?? 'Featured'; _page = 0; }),
                    filterValue: _filterValue,
                    onFilterChanged: (val) => setState(() { _filterValue = val ?? 'All products'; _page = 0; }),
                  ),

                  const SizedBox(height: 16),

                  FutureBuilder<List<Product>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(height: 240, child: Center(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                      var products = snapshot.data ?? [];
                      if (collectionId == 'new') {
                        products = products.where((p) => p.id == 'pen').toList();
                      }
                      products = _applyFiltersAndSort(products);

                      return CollectionGrid(
                        products: products,
                        page: _page,
                        pageSize: _pageSize,
                        onPage: (p) => _goToPage(p, (products.isEmpty ? 0 : (products.length / _pageSize).ceil())),
                        onProductTap: (product, collectionSlug) => context.push(
                          '/collection/$collectionSlug/product/${product.slug}',
                        ),
                        collectionSlug: collectionId,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
