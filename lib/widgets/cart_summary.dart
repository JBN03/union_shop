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
    final orderId = DateTime.now().millisecondsSinceEpoch.toString().substring(7);
    final total = cart.totalPrice;
    final items = cart.items.toList();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 28),
            const SizedBox(width: 8),
            const Text('Order Confirmed!'),
          ],
        ),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order #$orderId', style: const TextStyle(color: Colors.black54)),
              const Divider(height: 20),
              const Text('Items:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('${item.title} × ${item.quantity}')),
                    Text('£${(item.price * item.quantity).toStringAsFixed(2)}'),
                  ],
                ),
              )),
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('£${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.go('/');
            },
            child: const Text('Continue Shopping'),
          ),
        ],
      ),
    );

    cart.clear();
  }
}
