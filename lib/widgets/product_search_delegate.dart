import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_card.dart';

class ProductSearchDelegate extends SearchDelegate<Product?> {
  ProductSearchDelegate() : super(searchFieldLabel: 'Search products');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ProductService.instance.searchProducts(query),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        final results = snap.data ?? [];
        if (results.isEmpty) return Center(child: Text('No results for "$query"'));
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.72),
          itemCount: results.length,
          itemBuilder: (context, i) {
            final p = results[i];
            return ProductCard(title: p.title, price: p.price, originalPrice: p.originalPrice, imageUrl: p.imageUrl ?? '', productId: p.id);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Try searching for T-shirt, postcard or stationery'));
    }
    return FutureBuilder<List<Product>>(
      future: ProductService.instance.searchProducts(query),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        final results = snap.data ?? [];
        if (results.isEmpty) return Center(child: Text('No suggestions for "$query"'));
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, i) {
            final p = results[i];
            return ListTile(
              leading: SizedBox(width: 48, height: 48, child: Image.network(p.imageUrl, fit: BoxFit.cover, errorBuilder: (c,e,s)=>const Icon(Icons.image_not_supported))),
              title: Text(p.title),
              subtitle: Text(p.price),
              onTap: () {
                close(context, p);
                Navigator.pushNamed(context, '/product/${p.id}', arguments: p);
              },
            );
          },
          separatorBuilder: (_,__)=>const Divider(),
          itemCount: results.length,
        );
      },
    );
  }
}
