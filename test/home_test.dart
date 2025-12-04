import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'test_helpers.dart';

void main() {
  group('Home Page Tests', () {
    setUpAll(() {
      installTestHttpOverrides();
    });

    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();

      // Basic hero and products section are present
      expect(find.text('Placeholder Hero Title'), findsOneWidget);
      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();

      // Check that product cards from the 'new' collection are displayed
      expect(find.text('Portsmouth City Postcard'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('Portsmouth City Bookmark'), findsOneWidget);
      expect(find.text('Portsmouth City Keyring'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();

      // Check that header icons are present (search, account, cart)
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();

      // Check that footer is present
      expect(find.text('© 2025 Union Shop — All rights reserved'), findsOneWidget);
    });
  });
}
