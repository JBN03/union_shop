import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return Focus(
      autofocus: true,
      onKey: (node, event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
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
            if (items.isEmpty) return _emptyCart(context);

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) =>
                        _cartItem(items[index], cart),
                  ),
                ),
                _cartSummary(context, cart),
                const Footer(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _emptyCart(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Your cart is empty',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/collections'),
                  child: const Text('Browse Collections')),
            ],
          ),
        ),
      );

  Widget _cartItem(dynamic item, CartService cart) => Row(
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
                Text(item.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('SKU: ${item.id}',
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54)),
                    const SizedBox(width: 12),
                    Text('Product: ${item.productId}',
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 6),
                if (item.attributes != null && item.attributes!.isNotEmpty) ...[
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: item.attributes!.entries
                        .map<Widget>((e) =>
                            Chip(label: Text('${e.key}: ${e.value}')))
                        .toList(),
                  ),
                  const SizedBox(height: 6),
                ],
                Text('£${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () =>
                            cart.updateQuantity(item.id, item.quantity - 1)),
                    Text('${item.quantity}'),
                    IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () =>
                            cart.updateQuantity(item.id, item.quantity + 1)),
                    const SizedBox(width: 12),
                    TextButton(
                        onPressed: () => cart.removeItem(item.id),
                        child: const Text('Remove',
                            style: TextStyle(color: Colors.redAccent))),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget _cartSummary(BuildContext context, CartService cart) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _summaryRow('Subtotal', '£${cart.totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 6),
            _summaryRow('Tax (est)', '£0.00', isSubtle: true),
            const Divider(height: 24),
            _summaryRow('Total', '£${cart.totalPrice.toStringAsFixed(2)}',
                bold: true),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () => _checkout(context, cart),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Checkout'),
                )),
          ],
        ),
      );

  Widget _summaryRow(String label, String value,
          {bool isSubtle = false, bool bold = false}) =>
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

    Navigator.pushNamed(context, '/checkout-success', arguments: {
      'orderId': orderId,
      'total': total,
      'items': orderItems,
    });
  }
}

