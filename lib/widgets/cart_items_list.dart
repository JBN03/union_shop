import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/cart_item.dart';

class CartItemsList extends StatefulWidget {
  final bool shrinkWrap;

  const CartItemsList({super.key, this.shrinkWrap = false});

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  final cart = CartService.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) => _CartItemRow(item: items[index]),
        );
      },
    );
  }
}

class _CartItemRow extends StatelessWidget {
  final CartItem item;
  const _CartItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: (item.imageUrl != null && item.imageUrl!.isNotEmpty)
              ? Image.network(item.imageUrl!, fit: BoxFit.cover)
              : Container(color: Colors.grey[200]),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text('SKU: ${item.id}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(width: 12),
                  Text('Product: ${item.productId}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
              const SizedBox(height: 6),
              if (item.attributes != null && item.attributes!.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: item.attributes!.entries.map<Widget>((e) => Chip(label: Text('${e.key}: ${e.value}'))).toList(),
                ),
                const SizedBox(height: 6),
              ],
              Text('£${item.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.black87)),
              const SizedBox(height: 6),
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () => cart.updateQuantity(item.id, item.quantity - 1)),
                  Text('${item.quantity}'),
                  IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () => cart.updateQuantity(item.id, item.quantity + 1)),
                  const SizedBox(width: 12),
                  TextButton(onPressed: () => cart.removeItem(item.id), child: const Text('Remove', style: TextStyle(color: Colors.redAccent))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
