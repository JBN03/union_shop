import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/home_hero.dart';
import 'package:union_shop/widgets/products_grid.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _productsKey = GlobalKey();

  void placeholderCallbackForButtons() {}

  void _scrollToProducts() {
    final context = _productsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                    HomeHero(onBrowseProducts: _scrollToProducts),
                    ProductsGrid(key: _productsKey, showHeader: false),
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
