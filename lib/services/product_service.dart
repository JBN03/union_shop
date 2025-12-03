import 'dart:async';

import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/product_data.dart';

/// Lightweight in-memory product service for demo / coursework.
class ProductService {
  ProductService._internal();
  static final ProductService instance = ProductService._internal();

  Future<List<Collection>> getCollections({Duration delay = const Duration(milliseconds: 300)}) async {
    await Future.delayed(delay);
    return List.unmodifiable(collections);
  }

  Future<List<Product>> getProductsForCollection(String id, {Duration delay = const Duration(milliseconds: 300)}) async {
    await Future.delayed(delay);
    return List.unmodifiable(productsByCollection[id] ?? []);
  }

  Future<Product?> getProductByTitle(String title, {Duration delay = const Duration(milliseconds: 200)}) async {
    await Future.delayed(delay);
    for (var list in productsByCollection.values) {
      for (var p in list) {
        if (p.title == title) return p;
      }
    }
    return null;
  }

  Future<Product?> getProductById(String id, {Duration delay = const Duration(milliseconds: 200)}) async {
    await Future.delayed(delay);
    for (var list in productsByCollection.values) {
      for (var p in list) {
        if (p.id == id) return p;
      }
    }
    return null;
  }
}
