import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/product_service.dart';

void main() {
  group('ProductService unit tests', () {
    test('getCollections returns a list', () async {
      final cols = await ProductService.instance.getCollections(delay: Duration.zero);
      expect(cols, isNotNull);
    });

    test('getProductsForCollection and lookups', () async {
      final cols = await ProductService.instance.getCollections(delay: Duration.zero);
      if (cols.isNotEmpty) {
        final id = cols.first.id;
        final prods = await ProductService.instance.getProductsForCollection(id, delay: Duration.zero);
        expect(prods, isNotNull);
        if (prods.isNotEmpty) {
          final p = prods.first;
          final byId = await ProductService.instance.getProductById(p.id, delay: Duration.zero);
          expect(byId, isNotNull);
          final byTitle = await ProductService.instance.getProductByTitle(p.title, delay: Duration.zero);
          expect(byTitle, isNotNull);
        }
      } else {
        expect(cols, isEmpty);
      }
    });
  });
}
