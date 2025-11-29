import 'package:flutter/material.dart';
import 'package:union_shop/screens/product_page.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/screens/home_screen.dart';
import 'package:union_shop/screens/about_us_page.dart';
import 'package:union_shop/screens/collections_page.dart';
import 'package:union_shop/screens/collection_page.dart';
import 'package:union_shop/screens/sale_page.dart';
import 'package:union_shop/screens/login_page.dart';
import 'package:union_shop/screens/signup_page.dart';
import 'package:union_shop/services/cart_service.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      notifier: CartService.instance,
      child: MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product' or '/about', build and return the pages
      // In your browser, try these links: http://localhost:49856/#/product and http://localhost:49856/#/about
      routes: { 
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/sale': (context) => const SalePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    ),
    );
  }
}

/// Simple InheritedNotifier to expose the CartService throughout the widget tree
class CartProvider extends InheritedNotifier<CartService> {
  const CartProvider({super.key, required CartService notifier, required Widget child}) : super(notifier: notifier, child: child);

  static CartService of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartProvider>();
    return provider!.notifier!;
  }
}

