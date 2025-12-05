import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/footer.dart';

class OrderSummaryPage extends StatelessWidget {
  final String orderId;
  final double total;
  final List<Map<String, dynamic>> items;

  const OrderSummaryPage({
    super.key,
    required this.orderId,
    required this.total,
    required this.items,
  });

  Widget _itemRow(Map<String, dynamic> it) {
    final title = it['title'] as String? ?? '';
    final qty = it['qty'] as int? ?? 1;
    final lineTotal = it['lineTotal'] as num? ?? 0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 15))),
          SizedBox(width: 60, child: Text('× $qty', textAlign: TextAlign.center)),
          SizedBox(width: 100, child: Text('£${lineTotal.toStringAsFixed(2)}', textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, size: 40, color: Colors.green.shade600),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Order Confirmed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              Text('Order #$orderId', style: TextStyle(color: Colors.grey.shade600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                          ),
                          child: const Text('Order Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                          ),
                          child: const Row(
                            children: [
                              Expanded(child: Text('Item', style: TextStyle(fontWeight: FontWeight.w600))),
                              SizedBox(width: 60, child: Text('Qty', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600))),
                              SizedBox(width: 100, child: Text('Price', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w600))),
                            ],
                          ),
                        ),
                        
                        ...items.map((item) => _itemRow(item)),
                        
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(7)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Subtotal'),
                                  Text('£${total.toStringAsFixed(2)}'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Shipping', style: TextStyle(color: Colors.grey.shade600)),
                                  Text('Free', style: TextStyle(color: Colors.green.shade600)),
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                  Text('£${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.email_outlined, color: Colors.blue.shade600),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text('A confirmation email will be sent to your registered email address.', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  ElevatedButton(
                    onPressed: () => context.go('/'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Continue Shopping'),
                  ),
                  
                  const SizedBox(height: 40),
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

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 88, color: Colors.green),
            const SizedBox(height: 16),
            const Text('Thank you for your order!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Text('Continue Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
