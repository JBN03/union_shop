import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/product.dart';

class SalePage extends StatelessWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWithFooter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              onLogoTap: () => Navigator.pushNamed(context, '/'),
              onAccount: () {},
              onCart: () => Navigator.pushNamed(context, '/cart'),
              onMenu: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text('Sale', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 8),
                  const Center(child: Text('Limited time discounts and promotions.')),
                  const SizedBox(height: 20),
                  FutureBuilder<List<Product>>(
                    future: ProductService.instance.getProductsForCollection('sale'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final saleItems = snapshot.data ?? [];
                      if (saleItems.isEmpty) {
                        return const Center(child: Text('No sale items available.'));
                      }
                      return LayoutBuilder(builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        const spacing = 12.0;

                        final desiredFourColWidth = (width - spacing * 3) / 4;
                        final targetCardWidth = desiredFourColWidth.clamp(140.0, 360.0);

                        final crossAxisCount = width > 800 ? 3 : (width > 400 ? 2 : 1);

                        return Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: targetCardWidth * crossAxisCount + spacing * (crossAxisCount - 1)),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: saleItems.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: spacing,
                                mainAxisSpacing: spacing,
                                childAspectRatio: 0.85,
                              ),
                              itemBuilder: (context, index) {
                                final item = saleItems[index];
                                return Center(
                                  child: SizedBox(
                                    width: targetCardWidth,
                                    child: ProductCard(
                                      title: item.title,
                                      price: item.price,
                                      originalPrice: item.originalPrice,
                                      imageUrl: item.imageUrl,
                                      productId: item.id,
                                      onTap: () => Navigator.pushNamed(context, '/product/${item.id}', arguments: item),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
