import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';

/// Unit tests for the ProductService.
/// 
/// Tests the product data service including fetching collections,
/// products, and searching functionality.
void main() {
  group('ProductService', () {
    final service = ProductService.instance;

    group('Collections', () {
      test('getCollections returns a non-empty list', () async {
        final collections = await service.getCollections(delay: Duration.zero);

        expect(collections, isA<List<Collection>>());
        expect(collections, isNotEmpty);
      });

      test('each collection has required properties', () async {
        final collections = await service.getCollections(delay: Duration.zero);

        for (final collection in collections) {
          expect(collection.id, isNotEmpty);
          expect(collection.title, isNotEmpty);
        }
      });
    });

    group('Products', () {
      test('getProductsForCollection returns products', () async {
        final collections = await service.getCollections(delay: Duration.zero);
        
        if (collections.isNotEmpty) {
          final products = await service.getProductsForCollection(
            collections.first.id,
            delay: Duration.zero,
          );

          expect(products, isA<List<Product>>());
        }
      });

      test('each product has required properties', () async {
        final collections = await service.getCollections(delay: Duration.zero);
        
        if (collections.isNotEmpty) {
          final products = await service.getProductsForCollection(
            collections.first.id,
            delay: Duration.zero,
          );

          for (final product in products) {
            expect(product.id, isNotEmpty);
            expect(product.title, isNotEmpty);
            expect(product.price, isNotNull);
          }
        }
      });

      test('getProductById returns correct product', () async {
        final collections = await service.getCollections(delay: Duration.zero);
        
        if (collections.isNotEmpty) {
          final products = await service.getProductsForCollection(
            collections.first.id,
            delay: Duration.zero,
          );

          if (products.isNotEmpty) {
            final originalProduct = products.first;
            final fetchedProduct = await service.getProductById(
              originalProduct.id,
              delay: Duration.zero,
            );

            expect(fetchedProduct, isNotNull);
            expect(fetchedProduct!.id, equals(originalProduct.id));
            expect(fetchedProduct.title, equals(originalProduct.title));
          }
        }
      });

      test('getProductById returns null for non-existent product', () async {
        final product = await service.getProductById(
          'non-existent-product-id-12345',
          delay: Duration.zero,
        );

        expect(product, isNull);
      });
    });

    group('Search', () {
      test('getProductByTitle finds product by exact title', () async {
        final collections = await service.getCollections(delay: Duration.zero);
        
        if (collections.isNotEmpty) {
          final products = await service.getProductsForCollection(
            collections.first.id,
            delay: Duration.zero,
          );

          if (products.isNotEmpty) {
            final originalProduct = products.first;
            final fetchedProduct = await service.getProductByTitle(
              originalProduct.title,
              delay: Duration.zero,
            );

            expect(fetchedProduct, isNotNull);
            expect(fetchedProduct!.title, equals(originalProduct.title));
          }
        }
      });

      test('getProductByTitle returns null for non-existent title', () async {
        final product = await service.getProductByTitle(
          'This Product Does Not Exist 12345',
          delay: Duration.zero,
        );

        expect(product, isNull);
      });
    });
  });
}
