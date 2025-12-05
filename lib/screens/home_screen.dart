import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/home_hero.dart';
import 'package:union_shop/widgets/products_grid.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: viewportHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Header(
                      onLogoTap: () {},
                      onSearch: placeholderCallbackForButtons,
                      onAccount: () => context.push('/login'),
                      onCart: () => context.push('/cart'),
                      onMenu: placeholderCallbackForButtons,
                    ),
                    HomeHero(onBrowseCollections: () => context.push('/collections')),
                    const ProductsGrid(showHeader: false),
                    const SizedBox(height: 56),
                  ],
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
