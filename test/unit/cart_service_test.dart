import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

/// Unit tests for the CartService.
/// 
/// Tests the shopping cart functionality including adding items,
/// updating quantities, calculating totals, and clearing the cart.
void main() {
  group('CartService', () {
    late CartService cart;

    setUp(() {
      cart = CartService.instance;
      cart.clear();
    });

    tearDown(() {
      cart.clear();
    });

    group('Adding Items', () {
      test('adds a single item to cart', () {
        final product = Product(
          id: 'test-1',
          title: 'Test Shirt',
          price: '£25.00',
          imageUrl: '',
          description: 'A test product',
        );

        cart.addItem(product);

        expect(cart.totalItems, equals(1));
        expect(cart.items.length, equals(1));
        expect(cart.items.first.title, equals('Test Shirt'));
      });

      test('adds multiple quantities of same item', () {
        final product = Product(
          id: 'test-2',
          title: 'Test Hoodie',
          price: '£45.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 3);

        expect(cart.totalItems, equals(3));
        expect(cart.items.length, equals(1));
      });

      test('merges quantities when adding same product with same attributes', () {
        final product = Product(
          id: 'test-3',
          title: 'Test Cap',
          price: '£15.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 1, attributes: {'Size': 'M', 'Color': 'Blue'});
        cart.addItem(product, qty: 2, attributes: {'Size': 'M', 'Color': 'Blue'});

        expect(cart.totalItems, equals(3));
        expect(cart.items.length, equals(1));
      });

      test('creates separate entries for same product with different attributes', () {
        final product = Product(
          id: 'test-4',
          title: 'Test Mug',
          price: '£10.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 1, attributes: {'Size': 'Small'});
        cart.addItem(product, qty: 1, attributes: {'Size': 'Large'});

        expect(cart.totalItems, equals(2));
        expect(cart.items.length, equals(2));
      });
    });

    group('Calculating Totals', () {
      test('calculates correct total price for single item', () {
        final product = Product(
          id: 'price-1',
          title: 'Priced Item',
          price: '£10.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 2);

        expect(cart.totalPrice, equals(20.0));
      });

      test('calculates correct total for multiple different items', () {
        final product1 = Product(
          id: 'price-2',
          title: 'Item A',
          price: '£5.00',
          imageUrl: '',
          description: '',
        );
        final product2 = Product(
          id: 'price-3',
          title: 'Item B',
          price: '£15.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product1, qty: 2); // £10
        cart.addItem(product2, qty: 1); // £15

        expect(cart.totalPrice, equals(25.0));
      });

      test('returns zero for empty cart', () {
        expect(cart.totalItems, equals(0));
        expect(cart.totalPrice, equals(0.0));
      });
    });

    group('Updating Quantities', () {
      test('updates quantity of existing item', () {
        final product = Product(
          id: 'update-1',
          title: 'Update Test',
          price: '£20.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 1);
        final cartItemId = cart.cartItemIdForProduct('update-1');

        expect(cartItemId, isNotNull);

        cart.updateQuantity(cartItemId!, 5);

        expect(cart.totalItems, equals(5));
      });

      test('removes item when quantity set to zero', () {
        final product = Product(
          id: 'remove-1',
          title: 'Remove Test',
          price: '£30.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product, qty: 2);
        final cartItemId = cart.cartItemIdForProduct('remove-1');

        cart.updateQuantity(cartItemId!, 0);

        expect(cart.totalItems, equals(0));
        expect(cart.items.isEmpty, isTrue);
      });
    });

    group('Clearing Cart', () {
      test('removes all items from cart', () {
        final product1 = Product(id: 'clear-1', title: 'A', price: '£5.00', imageUrl: '', description: '');
        final product2 = Product(id: 'clear-2', title: 'B', price: '£10.00', imageUrl: '', description: '');

        cart.addItem(product1, qty: 2);
        cart.addItem(product2, qty: 3);

        expect(cart.totalItems, equals(5));

        cart.clear();

        expect(cart.totalItems, equals(0));
        expect(cart.items.isEmpty, isTrue);
        expect(cart.totalPrice, equals(0.0));
      });
    });

    group('Finding Items', () {
      test('finds cart item ID by product ID', () {
        final product = Product(
          id: 'find-1',
          title: 'Findable Item',
          price: '£12.00',
          imageUrl: '',
          description: '',
        );

        cart.addItem(product);
        final cartItemId = cart.cartItemIdForProduct('find-1');

        expect(cartItemId, isNotNull);
      });

      test('returns null for non-existent product', () {
        final cartItemId = cart.cartItemIdForProduct('non-existent');

        expect(cartItemId, isNull);
      });
    });
  });
}
