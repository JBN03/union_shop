import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/home_hero.dart';
import 'package:union_shop/widgets/products_grid.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Header(
              onLogoTap: () => navigateToHome(context),
              onSearch: placeholderCallbackForButtons,
              onAccount: placeholderCallbackForButtons,
              onCart: placeholderCallbackForButtons,
              onMenu: placeholderCallbackForButtons,
            ),

            
            HomeHero(onBrowseCollections: placeholderCallbackForButtons),

            
            const ProductsGrid(),
          
            const SizedBox(height: 56),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
