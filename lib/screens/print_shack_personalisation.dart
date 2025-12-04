import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/screens/print_shack_personalisation_view.dart';

class PrintShackPersonalisation extends StatefulWidget {
  const PrintShackPersonalisation({Key? key}) : super(key: key);

  @override
  State<PrintShackPersonalisation> createState() => _PrintShackPersonalisationState();
}

class _PrintShackPersonalisationState extends State<PrintShackPersonalisation> {
  String _lines = 'One line of text';
  int _qty = 1;

  String getPriceFor(String lines) {
    switch (lines) {
      case 'One line of text':
        return '£3.00';
      case 'Two lines of text':
        return '£5.00';
      case 'Three lines of text':
        return '£7.00';
      default:
        return '£0.00';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrintShackPersonalisationView(
      lines: _lines,
      qty: _qty,
      priceLabel: getPriceFor(_lines),
      onLinesChanged: (v) => setState(() => _lines = v ?? _lines),
      onIncrease: () => setState(() => _qty += 1),
      onDecrease: () => setState(() { if (_qty > 1) _qty -= 1; }),
      onAddToCart: () {
        final product = Product(
          id: 'printshack-sample',
          title: 'Custom Print Sample',
          price: getPriceFor(_lines),
          imageUrl: 'https://i.ibb.co/N2f5Yd1J/Gemini-Generated-Image-wpxvgewpxvgewpxv-1.png',
        );
        CartService.instance.addItem(product, qty: _qty, attributes: {'lines': _lines});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added $_qty to cart')));
      },
    );
  }
}
