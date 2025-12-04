import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';

class HeaderActions extends StatelessWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onAccount;
  final VoidCallback? onCart;

  const HeaderActions({Key? key, this.onSearch, this.onAccount, this.onCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (onSearch != null) onSearch!();
            Navigator.pushNamed(context, '/collections');
          },
          tooltip: 'Search',
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () {
            if (onAccount != null) onAccount!();
            Navigator.pushNamed(context, '/login');
          },
          tooltip: 'Account',
        ),
        AnimatedBuilder(
          animation: cart,
          builder: (context, _) {
            final count = cart.totalItems;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    if (onCart != null) onCart!();
                    Navigator.pushNamed(context, '/cart');
                  },
                  tooltip: 'Cart',
                ),
                if (count > 0)
                  Positioned(
                    right: 4,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Center(
                        child: Text(
                          count.toString(),
                          style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
