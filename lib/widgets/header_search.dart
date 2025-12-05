import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';

class HeaderSearchModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<Product> products = [];
  final List<Collection> collections = [];
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
      collections.clear();
      notifyListeners();
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 280), () async {
      await performSearch(q);
    });
  }

  Future<void> performSearch(String q) async {
    final productResults = await ProductService.instance.searchProducts(q);
    final collectionResults = await ProductService.instance.searchCollections(q);
    products
      ..clear()
      ..addAll(productResults);
    collections
      ..clear()
      ..addAll(collectionResults);
    notifyListeners();
  }

  void clearResults() {
    products.clear();
    collections.clear();
    notifyListeners();
  }

  bool get hasResults => products.isNotEmpty || collections.isNotEmpty;
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
        hintText: 'Search products & collections',
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
        if (!model.hasResults) return const SizedBox.shrink();
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 350),
            child: ListView(
              shrinkWrap: true,
              children: [
                if (model.collections.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Collections', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
                  ),
                  ...model.collections.map((c) => ListTile(
                    leading: SizedBox(
                      width: 48,
                      height: 48,
                      child: c.imageUrl.isNotEmpty
                          ? Image.network(c.imageUrl, fit: BoxFit.cover, errorBuilder: (ctx, e, s) => const Icon(Icons.folder_outlined))
                          : const Icon(Icons.folder_outlined),
                    ),
                    title: Text(c.title),
                    subtitle: const Text('Collection'),
                    onTap: () {
                      model.clearResults();
                      model.controller.clear();
                      context.push('/collection/${c.id}');
                    },
                  )),
                  if (model.products.isNotEmpty) const Divider(),
                ],
                if (model.products.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
                  ),
                  ...model.products.map((p) => ListTile(
                    leading: SizedBox(
                      width: 48,
                      height: 48,
                      child: p.imageUrl.isNotEmpty
                          ? Image.network(p.imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported))
                          : const Icon(Icons.image_not_supported),
                    ),
                    title: Text(p.title),
                    subtitle: Text(p.price),
                    onTap: () {
                      model.clearResults();
                      model.controller.clear();
                      context.push('/product/${p.id}');
                    },
                  )),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
