import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/collection_pagination.dart';

class CollectionGrid extends StatelessWidget {
  final List<Product> products;
  final int page;
  final int pageSize;
  final void Function(int page) onPage;
  final void Function(Product product, String collectionSlug) onProductTap;
  final String collectionSlug;

  const CollectionGrid({
    Key? key,
    required this.products,
    required this.page,
    required this.pageSize,
    required this.onPage,
    required this.onProductTap,
    required this.collectionSlug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      const spacing = 16.0;

      final desiredFourColWidth = (width - spacing * 3) / 4;
      final targetCardWidth = desiredFourColWidth.clamp(140.0, 360.0);

      final crossAxisCount = width > 800 ? 3 : (width > 400 ? 2 : 1);

      final total = products.length;
      final pageCount = total == 0 ? 0 : (total / pageSize).ceil();
      var currentPage = page;
      if (pageCount > 0 && currentPage >= pageCount) currentPage = pageCount - 1;

      final start = (currentPage * pageSize).clamp(0, total);
      final end = (start + pageSize).clamp(0, total);
      final pageItems = (start < end) ? products.sublist(start, end) : <Product>[];

      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: targetCardWidth * crossAxisCount + spacing * (crossAxisCount - 1)),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final p = pageItems[index];
                  return Center(
                    child: SizedBox(
                      width: targetCardWidth,
                      child: ProductCard(
                        title: p.title,
                        price: p.price,
                        originalPrice: p.originalPrice,
                        imageUrl: p.imageUrl,
                        productId: p.id,
                        onTap: () => onProductTap(p, collectionSlug),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),
              CollectionPagination(
                pageCount: pageCount,
                page: currentPage,
                onPage: onPage,
              ),
            ],
          ),
        ),
      );
    });
  }
}
