import 'dart:async';

import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';

/// Lightweight in-memory product service for demo / coursework.
class ProductService {
  ProductService._internal();
  static final ProductService instance = ProductService._internal();

  final List<Collection> _collections = [
    Collection(id: 'new', title: 'New Arrivals', imageUrl: ''),
    Collection(id: 'summer', title: 'Summer Collection', imageUrl: ''),
    Collection(id: 'print', title: 'Print Shack', imageUrl: ''),
    Collection(id: 'sale', title: 'Sale', imageUrl: ''),
  ];

  final Map<String, List<Product>> _productsByCollection = {
    'new': List.generate(
      6,
      (i) => Product(
        id: 'new-${i + 1}',
        title: 'New Product ${i + 1}',
        price: '£${12 + i}',
        imageUrl: '',
        description: 'Description for new product ${i + 1}',
      ),
    ),
    'summer': List.generate(
      6,
      (i) => Product(
        id: 'summer-${i + 1}',
        title: 'Summer Product ${i + 1}',
        price: '£${10 + i}',
        imageUrl: '',
        description: 'Description for summer product ${i + 1}',
      ),
    ),
    'print': List.generate(
      4,
      (i) => Product(
        id: 'print-${i + 1}',
        title: 'Print Product ${i + 1}',
        price: '£${8 + i}',
        imageUrl: '',
        description: 'Description for print product ${i + 1}',
      ),
    ),
    'sale': List.generate(
      3,
      (i) => Product(
        id: 'sale-${i + 1}',
        title: 'Sale Product ${i + 1}',
        price: '£${5 + i}',
        imageUrl: '',
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

  Future<Product?> getProductById(String id, {Duration delay = const Duration(milliseconds: 200)}) async {
    await Future.delayed(delay);
    for (var list in _productsByCollection.values) {
      for (var p in list) {
        if (p.id == id) return p;
      }
    }
    return null;
  }
}
