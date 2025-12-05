import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';

void main() {
  testWidgets('Header shows icons', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Header())));
    await tester.pumpAndSettle();

    // Debug: ensure some IconButtons are present
    expect(find.byType(IconButton), findsWidgets);
    // Then check specific icons
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });
}
