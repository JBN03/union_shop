import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart' as model;
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';


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

            
            Builder(builder: (context) {
              final heroHeight = math.min(400, MediaQuery.of(context).size.height * 0.45).toDouble();
              return SizedBox(
                height: heroHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      right: 24,
                      top: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Placeholder Hero Title',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "This is placeholder text for the hero section.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(
                              'BROWSE PRODUCTS',
                              style: TextStyle(fontSize: 14, letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

            
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'PRODUCTS SECTION',
                    style: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 1),
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;

                      
                      final crossAxisCount = width < 600 ? 1 : 2;
                      final spacing = width < 600 ? 16.0 : 32.0;
                      final containerMaxWidth = math.min(width, 1100.0);
                      final itemWidth = (containerMaxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;
                      const targetCardHeight = 380.0;
                      final childAspectRatio = itemWidth / targetCardHeight;

                      return Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: containerMaxWidth),
                          child: FutureBuilder<List<model.Product>>(
                            future: ProductService.instance.getProductsForCollection('new'),
                            builder: (context, snapshot) {
                              final products = snapshot.data ?? [];

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: products.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: spacing,
                                  mainAxisSpacing: spacing,
                                  childAspectRatio: childAspectRatio,
                                ),
                                itemBuilder: (context, index) {
                                  final model.Product product = products[index];
                                  return SizedBox(
                                    height: targetCardHeight,
                                    child: ProductCard(
                                      productId: product.id,
                                      title: product.title,
                                      price: product.price,
                                      imageUrl: product.imageUrl,
                                      onTap: () {
                                        // push with the product object as argument
                                        Navigator.pushNamed(context, '/product/${product.id}', arguments: product);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          
            const SizedBox(height: 56),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
