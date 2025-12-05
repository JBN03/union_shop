import 'dart:async';

import 'package:flutter/material.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';

class HeaderSearchModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<Product> products = [];
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  void onChanged(String v) {
    _debounce?.cancel();
    final q = v.trim();
    if (q.isEmpty) {
      products.clear();
      notifyListeners();
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 280), () async {
      await performSearch(q);
    });
  }

  Future<void> performSearch(String q) async {
    final results = await ProductService.instance.searchProducts(q);
    products
      ..clear()
      ..addAll(results);
    notifyListeners();
  }

  void clearResults() {
    products.clear();
    notifyListeners();
  }
}

class HeaderSearchField extends StatelessWidget {
  final HeaderSearchModel model;
  final bool inline;

  const HeaderSearchField({Key? key, required this.model, this.inline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final field = TextField(
      controller: model.controller,
      decoration: InputDecoration(
        hintText: 'Search products',
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(inline ? 6 : 8)),
        prefixIcon: inline ? null : const Icon(Icons.search),
      ),
      onChanged: model.onChanged,
      onSubmitted: (v) => model.performSearch(v.trim()),
    );

    if (inline) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 160),
        child: SizedBox(height: 36, child: field),
      );
    }

    return SizedBox(height: 40, child: field);
  }
}

class HeaderSearchResults extends StatelessWidget {
  final HeaderSearchModel model;

  const HeaderSearchResults({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
      builder: (context, _) {
        if (model.products.isEmpty) return const SizedBox.shrink();
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.separated(
              itemCount: model.products.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final p = model.products[i];
                return ListTile(
                  leading: SizedBox(width: 48, height: 48, child: p.imageUrl.isNotEmpty ? Image.network(p.imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported)) : const Icon(Icons.image_not_supported)),
                  title: Text(p.title),
                  subtitle: Text(p.price),
                  onTap: () {
                    model.clearResults();
                    Navigator.pushNamed(context, '/product/${p.id}', arguments: p);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
