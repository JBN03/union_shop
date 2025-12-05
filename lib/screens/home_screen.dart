import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/home_hero.dart';
import 'package:union_shop/widgets/products_grid.dart';
import 'package:union_shop/widgets/footer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 650));
    _fade = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.02), end: Offset.zero).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    // start entrance animation
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: Column(
              children: [
                Header(
                  onLogoTap: () => navigateToHome(context),
                  onSearch: placeholderCallbackForButtons,
                  onAccount: placeholderCallbackForButtons,
                  onCart: placeholderCallbackForButtons,
                  onMenu: placeholderCallbackForButtons,
                ),

                // HomeHero restored to original (full width) placement
                HomeHero(onBrowseCollections: placeholderCallbackForButtons),

                const ProductsGrid(showHeader: false),

                const SizedBox(height: 56),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
