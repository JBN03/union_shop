import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';

class ProductPage extends StatelessWidget {
  final Product? product;

  const ProductPage({Key? key, this.product}) : super(key: key);

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // Placeholder for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = screenWidth > 800;

    // Max image height for desktop to prevent it from being too tall
    final maxImageHeight = isDesktop ? screenHeight * 0.6 : screenHeight * 0.4;

    final productImage = Container(
      constraints: BoxConstraints(maxHeight: maxImageHeight),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          product?.imageUrl ??
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_not_supported,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Image unavailable',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    final productDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.title ?? 'Placeholder Product Name',
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Text(
          product?.price ?? '£15.00',
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
        ),
        const SizedBox(height: 18),

        // Options (non-functional dropdowns)
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Size', border: OutlineInputBorder()),
                value: 'M',
                items: const [
                  DropdownMenuItem(value: 'S', child: Text('S')),
                  DropdownMenuItem(value: 'M', child: Text('M')),
                  DropdownMenuItem(value: 'L', child: Text('L')),
                  DropdownMenuItem(value: 'XL', child: Text('XL')),
                ],
                onChanged: (_) {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Color', border: OutlineInputBorder()),
                value: 'Red',
                items: const [
                  DropdownMenuItem(value: 'Red', child: Text('Red')),
                  DropdownMenuItem(value: 'Blue', child: Text('Blue')),
                  DropdownMenuItem(value: 'Green', child: Text('Green')),
                ],
                onChanged: (_) {},
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        const Text(
          'Description',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          product?.description ??
              'This is a placeholder description for the product. Students should replace this with real product information and implement proper data management.',
          style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
        ),

        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final prod = product;
                  if (prod == null) return;
                  CartService.instance.addItem(prod, qty: 1);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added 1 × ${prod.title} to cart')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('Add to cart'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('Buy now'),
                ),
              ),
            ),
          ],
        ),
      ],
    );

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
            Padding(
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 800;
                  if (isWide) {
                    // layout parameters for desktop
                    const double imageMaxWidth = 480.0;
                    const double detailsMaxWidth = 520.0;
                    const double spacing = 24.0;

                    // compute shift so the CENTER of the gap aligns with the screen center
                    final double shift = (detailsMaxWidth - imageMaxWidth) / 2.0;
                    final double groupMaxWidth = imageMaxWidth + spacing + detailsMaxWidth;

                    return Center(
                      child: Transform.translate(
                        offset: Offset(shift, 0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: groupMaxWidth),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // image on the left (constrained)
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: imageMaxWidth,
                                  maxHeight: constraints.maxHeight * 0.8,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product?.imageUrl ??
                                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                      fit: BoxFit.contain,
                                      errorBuilder: (c, e, s) => Container(color: Colors.grey[300]),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: spacing),

                              // details on the right with a max width
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: detailsMaxWidth),
                                child: SingleChildScrollView(
                                  child: productDetails,
                                ),
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
                        productImage,
                        const SizedBox(height: 24),
                        productDetails,
                      ],
                    );
                  }
                },
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
