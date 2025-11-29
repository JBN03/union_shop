import 'dart:async';

import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';

/// Lightweight in-memory product service for demo / coursework.
class ProductService {
  ProductService._internal();
  static final ProductService instance = ProductService._internal();

  final List<Collection> _collections = [
    Collection(id: 'new', title: 'New Arrivals', imageUrl: 'https://via.placeholder.com/300x200?text=New+Arrivals'),
    Collection(id: 'summer', title: 'Summer Collection', imageUrl: 'https://via.placeholder.com/300x200?text=Summer'),
    Collection(id: 'print', title: 'Print Shack', imageUrl: 'https://via.placeholder.com/300x200?text=Print+Shack'),
    Collection(id: 'sale', title: 'Sale', imageUrl: 'https://via.placeholder.com/300x200?text=Sale'),
  ];

  final Map<String, List<Product>> _productsByCollection = {
    'new': List.generate(
      6,
      (i) => Product(
        title: 'New Product ${i + 1}',
        price: '£${12 + i}',
        imageUrl: 'https://via.placeholder.com/400x400?text=New+${i + 1}',
        description: 'Description for new product ${i + 1}',
      ),
    ),
    'summer': List.generate(
      6,
      (i) => Product(
        title: 'Summer Product ${i + 1}',
        price: '£${10 + i}',
        imageUrl: 'https://via.placeholder.com/400x400?text=Summer+${i + 1}',
        description: 'Description for summer product ${i + 1}',
      ),
    ),
    'print': List.generate(
      4,
      (i) => Product(
        title: 'Print Product ${i + 1}',
        price: '£${8 + i}',
        imageUrl: 'https://via.placeholder.com/400x400?text=Print+${i + 1}',
        description: 'Description for print product ${i + 1}',
      ),
    ),
    'sale': List.generate(
      3,
      (i) => Product(
        title: 'Sale Product ${i + 1}',
        price: '£${5 + i}',
        imageUrl: 'https://via.placeholder.com/400x400?text=Sale+${i + 1}',
        description: 'Sale product ${i + 1}',
      ),
    ),
  };

  Future<List<Collection>> getCollections({Duration delay = const Duration(milliseconds: 300)}) async {
    await Future.delayed(delay);
    return List.unmodifiable(_collections);
  }

  Future<List<Product>> getProductsForCollection(String id, {Duration delay = const Duration(milliseconds: 300)}) async {
    await Future.delayed(delay);
    return List.unmodifiable(_productsByCollection[id] ?? []);
  }

  Future<Product?> getProductByTitle(String title, {Duration delay = const Duration(milliseconds: 200)}) async {
    await Future.delayed(delay);
    for (var list in _productsByCollection.values) {
      for (var p in list) {
        if (p.title == title) return p;
      }
    }
    return null;
  }
}
