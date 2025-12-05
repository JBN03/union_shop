import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/widgets/product_details_view.dart';

class ProductDetails extends StatefulWidget {
  final Product? product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = 'XS';
  String selectedColor = 'Purple';
  int quantity = 1;

  void _increase() => setState(() => quantity += 1);
  void _decrease() => setState(() {
        if (quantity > 1) quantity -= 1;
      });

  void _onAddToCart() {
    final prod = widget.product;
    if (prod == null) return;
    CartService.instance.addItem(prod, qty: quantity, attributes: {'Size': selectedSize, 'Color': selectedColor});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added $quantity × ${prod.title} to cart')));
  }

  @override
  Widget build(BuildContext context) {
    return ProductDetailsView(
      product: widget.product,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
      quantity: quantity,
      onSizeChanged: (v) => setState(() => selectedSize = v ?? 'XS'),
      onColorChanged: (v) => setState(() => selectedColor = v ?? 'Purple'),
      onIncrease: _increase,
      onDecrease: _decrease,
      onAddToCart: _onAddToCart,
    );
  }
}

