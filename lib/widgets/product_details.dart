import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/widgets/product_details_view.dart';

class ProductDetails extends StatefulWidget {
  final Product? product;
  final String? selectedColor;
  final ValueChanged<String?>? onColorChanged;

  const ProductDetails({Key? key, required this.product, this.selectedColor, this.onColorChanged}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = 'XS';
  late String _internalColor;
  int quantity = 1;

  String _getDefaultColor() {
    final p = widget.product;
    if (p == null) return 'Blue';
    if (p.id == 'joggers') return 'Grey';
    if (p.id == 'small-logo-tshirt') return 'Blue';
    if (p.id == 'essential-tshirt') return 'Pink';
    if (p.id == 'essentials-hoodie' || p.id == 'essentials-hoodie-hoodies') return 'Blue';
    return 'Blue';
  }

  @override
  void initState() {
    super.initState();
    _internalColor = widget.selectedColor ?? _getDefaultColor();
  }

  String get selectedColor => widget.selectedColor ?? _internalColor;

  void _increase() => setState(() => quantity += 1);
  void _decrease() => setState(() {
        if (quantity > 1) quantity -= 1;
      });

  void _onColorChange(String? v) {
    final newColor = v ?? 'Blue';
    if (widget.onColorChanged != null) {
      widget.onColorChanged!(newColor);
    } else {
      setState(() => _internalColor = newColor);
    }
  }

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
      onColorChanged: _onColorChange,
      onIncrease: _increase,
      onDecrease: _decrease,
      onAddToCart: _onAddToCart,
    );
  }
}

