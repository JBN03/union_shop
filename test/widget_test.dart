import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';
import 'test_helpers.dart';

/// Widget tests for the Union Shop application.
/// 
/// These tests verify that the UI components render correctly and
/// that basic user interactions work as expected.
void main() {
  // Install test HTTP overrides to prevent network image errors
  setUpAll(() {
    installTestHttpOverrides();
  });

  group('Header Widget', () {
    testWidgets('renders search and cart icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsWidgets);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('contains logo image', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('renders action buttons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      // Should have multiple icon buttons for various actions
      expect(find.byType(IconButton), findsWidgets);
    });
  });

  group('Cart Integration', () {
    setUp(() {
      CartService.instance.clear();
    });

    tearDown(() {
      CartService.instance.clear();
    });

    testWidgets('cart badge shows when items are added', (tester) async {
      // Add an item to cart
      final product = Product(
        id: 'test-widget-item',
        title: 'Widget Test Product',
        price: '£15.00',
        imageUrl: '',
        description: 'Test description',
      );
      CartService.instance.addItem(product, qty: 2);

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      // The cart count should be shown somewhere (as text "2")
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('cart badge hidden when cart is empty', (tester) async {
      // Ensure cart is empty
      CartService.instance.clear();

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      // No badge count should be visible when cart is empty
      expect(find.text('0'), findsNothing);
    });
  });

  group('Navigation & Layout', () {
    testWidgets('header maintains layout on different screen sizes', (tester) async {
      // Test narrow screen
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Header())),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Header), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      // Reset
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    testWidgets('snackbar displays correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item added to cart')),
                  );
                },
                child: const Text('Add Item'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Add Item'));
      await tester.pump();
      expect(find.text('Item added to cart'), findsOneWidget);
    });
  });
}
