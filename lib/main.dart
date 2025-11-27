import 'package:flutter/material.dart';
import 'package:union_shop/screens/product_page.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/screens/home_screen.dart';
import 'package:union_shop/screens/about_us_page.dart';
import 'package:union_shop/screens/collections_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}

