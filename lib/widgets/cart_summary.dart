import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/services/cart_service.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return AnimatedBuilder(
      animation: cart,
      builder: (context, _) {
        if (cart.items.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _summaryRow('Subtotal', '£${cart.totalPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 6),
              _summaryRow('Tax (est)', '£0.00', isSubtle: true),
              const Divider(height: 24),
              _summaryRow('Total', '£${cart.totalPrice.toStringAsFixed(2)}', bold: true),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _checkout(context, cart),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Checkout'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _summaryRow(String label, String value, {bool isSubtle = false, bool bold = false}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: bold ? 18 : 14,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
                  color: isSubtle ? Colors.black54 : Colors.black)),
          Text(value,
              style: TextStyle(
                  fontSize: bold ? 18 : 14,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
                  color: isSubtle ? Colors.black54 : Colors.black)),
        ],
      );

  void _checkout(BuildContext context, CartService cart) {
    final orderId = DateTime.now().millisecondsSinceEpoch.toString();
    final total = cart.totalPrice;
    final orderItems = cart.items
        .map((it) => {
              'title': it.title,
              'qty': it.quantity,
              'unitPrice': it.price,
              'lineTotal': it.price * it.quantity,
            })
        .toList();

    cart.clear();

    context.go('/checkout-success');
  }
}
