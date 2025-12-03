import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class ProductImage extends StatelessWidget {
  final Product? product;
  final double maxHeight;

  const ProductImage({Key? key, required this.product, required this.maxHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          product?.imageUrl ?? 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Image unavailable', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
