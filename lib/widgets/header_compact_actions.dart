import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';

class HeaderCompactActions extends StatelessWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onAccount;
  final VoidCallback? onCart;
  final VoidCallback? onMenu;

  const HeaderCompactActions({Key? key, this.onSearch, this.onAccount, this.onCart, this.onMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.search, size: 20, color: Colors.grey),
          onPressed: () {
            if (onSearch != null) onSearch!();
            Navigator.pushNamed(context, '/collections');
          },
          tooltip: 'Search',
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, size: 20, color: Colors.grey),
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
                  icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.grey),
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
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        PopupMenuButton<int>(
          icon: const Icon(Icons.menu_rounded, size: 20, color: Colors.grey),
          onSelected: (v) {
            if (onMenu != null) onMenu!();
            switch (v) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/collections');
                break;
              case 2:
                Navigator.pushNamed(context, '/sale');
                break;
              case 3:
                Navigator.pushNamed(context, '/about');
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 0, child: Text('Home')),
            PopupMenuItem(value: 1, child: Text('Collections')),
            PopupMenuItem(value: 2, child: Text('Sale')),
            PopupMenuItem(value: 3, child: Text('About')),
          ],
        ),
      ],
    );
  }
}
