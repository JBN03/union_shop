import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../services/cart_service.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Header(
          onLogoTap: () => Navigator.pushNamed(context, '/'),
          onCart: () => Navigator.pushNamed(context, '/cart'),
          onSearch: () {},
          onAccount: () => Navigator.pushNamed(context, '/login'),
          onMenu: () {},
        ),
      ),
      body: AnimatedBuilder(
        animation: cart,
        builder: (context, _) {
          final items = cart.items;
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your cart is empty', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/collections'),
                      child: const Text('Browse Collections'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final it = items[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 96,
                          height: 96,
                          child: it.imageUrl != null && it.imageUrl!.isNotEmpty
                              ? Image.network(it.imageUrl!, fit: BoxFit.cover)
                              : Container(color: Colors.grey[200]),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(it.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 6),
                              Text('£${it.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.black87)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () {
                                      final newQty = it.quantity - 1;
                                      cart.updateQuantity(it.id, newQty);
                                    },
                                  ),
                                  Text('${it.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      cart.updateQuantity(it.id, it.quantity + 1);
                                    },
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    onPressed: () => cart.removeItem(it.id),
                                    child: const Text('Remove', style: TextStyle(color: Colors.redAccent)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal', style: TextStyle(fontSize: 16)),
                        Text('£${cart.totalPrice.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Tax (est)', style: TextStyle(fontSize: 14, color: Colors.black54)),
                        Text('£0.00', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        Text('£${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        final orderId = DateTime.now().millisecondsSinceEpoch.toString();
                        final total = cart.totalPrice;
                        cart.clear();
                        Navigator.pushNamed(context, '/checkout-success', arguments: {'orderId': orderId, 'total': total});
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
