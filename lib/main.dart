import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/screens/product_page.dart';
import 'package:union_shop/screens/home_screen.dart';
import 'package:union_shop/screens/about_us_page.dart';
import 'package:union_shop/screens/collections_page.dart';
import 'package:union_shop/screens/collection_page.dart';
import 'package:union_shop/screens/sale_page.dart';
import 'package:union_shop/screens/print_shack_page.dart';
import 'package:union_shop/screens/login_page.dart';
import 'package:union_shop/screens/signup_page.dart';
import 'package:union_shop/screens/cart_page.dart';
import 'package:union_shop/screens/checkout_success_page.dart';
import 'package:union_shop/services/cart_service.dart';

/// Global router instance for navigation
final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutUsPage(),
    ),
    GoRoute(
      path: '/The Print Shack',
      builder: (context, state) => const PrintShackPage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/checkout-success',
      builder: (context, state) => const CheckoutSuccessPage(),
    ),
    GoRoute(
      path: '/collections',
      builder: (context, state) => const CollectionsPage(),
    ),
    GoRoute(
      path: '/collection/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return CollectionPage(collectionId: id);
      },
    ),
    GoRoute(
      path: '/sale',
      builder: (context, state) => const SalePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ProductPage(productId: id);
      },
    ),
    // Handle /collection/:collectionId/product/:productId
    GoRoute(
      path: '/collection/:collectionId/product/:productId',
      builder: (context, state) {
        final productId = state.pathParameters['productId'] ?? '';
        return ProductPage(productId: productId);
      },
    ),
  ],
);

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      notifier: CartService.instance,
      child: MaterialApp.router(
        title: 'Union Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        ),
        routerConfig: router,
      ),
    );
  }
}


class CartProvider extends InheritedNotifier<CartService> {
  const CartProvider({super.key, required CartService notifier, required Widget child}) : super(notifier: notifier, child: child);

  static CartService of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartProvider>();
    return provider!.notifier!;
  }
}