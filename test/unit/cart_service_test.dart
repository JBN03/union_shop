import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartService unit tests', () {
    final cart = CartService.instance;

    setUp(() {
      cart.clear();
    });

    test('addItem and totalItems/totalPrice', () {
      final p = Product(id: 'p1', title: 'T1', price: '£10.00', imageUrl: '', description: '');
      cart.addItem(p, qty: 2);
      expect(cart.totalItems, 2);
      expect(cart.totalPrice, greaterThan(0));
    });

    test('addItem with same attributes merges quantities', () {
      final p = Product(id: 'p2', title: 'T2', price: '£5.00', imageUrl: '', description: '');
      cart.addItem(p, qty: 1, attributes: {'Size': 'M'});
      cart.addItem(p, qty: 2, attributes: {'Size': 'M'});
      expect(cart.totalItems, 3);
    });

    test('removeItem and updateQuantity', () {
      final p = Product(id: 'p3', title: 'T3', price: '£7.00', imageUrl: '', description: '');
      cart.addItem(p, qty: 1);
      final id = cart.cartItemIdForProduct('p3');
      expect(id, isNotNull);
      cart.updateQuantity(id!, 0);
      expect(cart.totalItems, 0);
    });
  });
}
