import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/product_image.dart';
import 'package:union_shop/widgets/product_details.dart';

class ProductPage extends StatefulWidget {
  final Product? product;
  final String? productId;
  final bool isFavorite;


  const ProductPage({
  Key? key,
  this.product,
  this.productId,
  this.isFavorite = false,
}) : super(key: key);




  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product? _loadedProduct;
  bool _loadingProduct = false;

  @override
  Widget build(BuildContext context) {
    final product = _loadedProduct ?? widget.product;
    if (product == null && !_loadingProduct && widget.productId != null) {
      _loadingProduct = true;
      ProductService.instance.getProductById(widget.productId!).then((p) {
        if (!mounted) return;
        setState(() {
          _loadedProduct = p;
          _loadingProduct = false;
        });
      });
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = screenWidth > 800;

    final maxImageHeight = isDesktop ? screenHeight * 0.6 : screenHeight * 0.4;

    return Scaffold(
      body: BodyWithFooter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              onLogoTap: () => Navigator.pushNamed(context, '/'),
              onSearch: () {},
              onAccount: () {},
              onCart: () => Navigator.pushNamed(context, '/cart'),
              onMenu: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 800;
                  if (isWide) {
                    const double imageMaxWidth = 480.0;
                    const double detailsMaxWidth = 520.0;
                    const double spacing = 24.0;

                    const double shift = (detailsMaxWidth - imageMaxWidth) / 2.0;
                    const double groupMaxWidth = imageMaxWidth + spacing + detailsMaxWidth;

                    return Center(
                      child: Transform.translate(
                        offset: const Offset(shift, 0),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: groupMaxWidth),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: imageMaxWidth, maxHeight: constraints.maxHeight * 0.8),
                                      child: AspectRatio(
                                        aspectRatio: 4 / 3,
                                        child: ProductImage(product: widget.product ?? _loadedProduct, maxHeight: constraints.maxHeight * 0.8),
                                      ),
                                    ),

                                    const SizedBox(width: spacing),

                                    ConstrainedBox(
                                      constraints: const BoxConstraints(maxWidth: detailsMaxWidth),
                                      child: ProductDetails(product: widget.product ?? _loadedProduct),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImage(product: widget.product ?? _loadedProduct, maxHeight: maxImageHeight),
                        const SizedBox(height: 24),
                        ProductDetails(product: widget.product ?? _loadedProduct),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
