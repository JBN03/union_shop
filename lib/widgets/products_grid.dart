import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart' as model;

class ProductsGrid extends StatelessWidget {
  final String collectionId;
  final bool showHeader;

  const ProductsGrid({Key? key, this.collectionId = 'new', this.showHeader = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
          children: [
          if (showHeader) ...[
            const Text(
              'PRODUCTS SECTION',
              style: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 1),
            ),
            const SizedBox(height: 24),
          ],
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
                    future: ProductService.instance.getProductsForCollection(collectionId),
                    builder: (context, snapshot) {
                      final products = snapshot.data ?? [];
                      final displayProducts = showHeader ? products : products.where((p) => p.id != 'pen' && p.id != 'notebook').toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: displayProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          final model.Product product = displayProducts[index];
                          return SizedBox(
                            height: targetCardHeight,
                            child: ProductCard(
                              productId: product.id,
                              title: product.title,
                              price: product.price,
                              originalPrice: product.originalPrice,
                              imageUrl: product.imageUrl,
                              onTap: () {
                                context.push('/product/${product.id}');
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
    );
  }
}
