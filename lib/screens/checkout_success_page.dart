import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  Widget _itemRow(Map<String, dynamic> it) {
    final title = it['title'] as String? ?? '';
    final qty = it['qty'] as int? ?? 1;
    final lineTotal = it['lineTotal'] as num? ?? 0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Expanded(child: Text('$title × $qty')),
          SizedBox(width: 120, child: Text('£${lineTotal.toStringAsFixed(2)}', textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final orderId = args?['orderId'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString();
    final total = args?['total'] as num? ?? 0;
    final items = (args?['items'] as List<dynamic>?) ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  const Icon(Icons.check_circle_outline, size: 88, color: Colors.green),
                  const SizedBox(height: 16),
                  const Text('Thank you — your order is placed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Text('Order ID: $orderId', style: const TextStyle(color: Colors.black54), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Total: £${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                  const SizedBox(height: 24),

                  Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(6)), child: const Row(children: [Expanded(child: Text('Item', style: TextStyle(fontWeight: FontWeight.w700))), SizedBox(width: 120, child: Text('Price', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700)))])),
                  const SizedBox(height: 8),

                  ...items.map((raw) => _itemRow(Map<String, dynamic>.from(raw as Map))).toList(),

                  const Divider(),

                  Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), Text('£${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))])),

                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), child: const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), child: Text('Continue Shopping'))),
                  const SizedBox(height: 24),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
