import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final orderId = args?['orderId'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString();
    final total = args?['total'] as num? ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmed'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline, size: 88, color: Colors.green),
              const SizedBox(height: 16),
              const Text('Thank you — your order is placed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Text('Order ID: $orderId', style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 8),
              Text('Total: £${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
