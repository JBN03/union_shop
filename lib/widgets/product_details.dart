import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class ProductDetails extends StatelessWidget {
  final Product? product;
  final String selectedSize;
  final String selectedColor;
  final int quantity;
  final ValueChanged<String?> onSizeChanged;
  final ValueChanged<String?> onColorChanged;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onAddToCart;

  const ProductDetails({
    Key? key,
    required this.product,
    required this.selectedSize,
    required this.selectedColor,
    required this.quantity,
    required this.onSizeChanged,
    required this.onColorChanged,
    required this.onIncrease,
    required this.onDecrease,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.title ?? 'Placeholder Product Name',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Text(
          product?.price ?? '£15.00',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Size', border: OutlineInputBorder()),
                initialValue: selectedSize,
                items: const [
                  DropdownMenuItem(value: 'S', child: Text('S')),
                  DropdownMenuItem(value: 'M', child: Text('M')),
                  DropdownMenuItem(value: 'L', child: Text('L')),
                  DropdownMenuItem(value: 'XL', child: Text('XL')),
                ],
                onChanged: onSizeChanged,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Color', border: OutlineInputBorder()),
                initialValue: selectedColor,
                items: const [
                  DropdownMenuItem(value: 'Red', child: Text('Red')),
                  DropdownMenuItem(value: 'Blue', child: Text('Blue')),
                  DropdownMenuItem(value: 'Green', child: Text('Green')),
                ],
                onChanged: onColorChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
        const SizedBox(height: 8),
        Text(
          product?.description ?? 'This is a placeholder description for the product. Students should replace this with real product information and implement proper data management.',
          style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.remove, size: 18), padding: const EdgeInsets.all(8), onPressed: onDecrease),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
                  IconButton(icon: const Icon(Icons.add, size: 18), padding: const EdgeInsets.all(8), onPressed: onIncrease),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                child: Padding(padding: const EdgeInsets.symmetric(vertical: 14.0), child: Text('Add to cart${quantity > 1 ? ' ($quantity)' : ''}')),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(onPressed: () {}, child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Buy now'))),
            ),
          ],
        ),
      ],
    );
  }
}
