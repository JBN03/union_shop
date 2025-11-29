import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onSearch;
  final VoidCallback? onAccount;
  final VoidCallback? onCart;
  final VoidCallback? onMenu;

  const Header({
    super.key,
    this.onLogoTap,
    this.onSearch,
    this.onAccount,
    this.onCart,
    this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final calculated = screenHeight * 0.10;
    final height = calculated.clamp(56.0, 88.0).toDouble();

    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          final showLinks = constraints.maxWidth >= 800;
          return Row(
            children: [
              // Logo
              GestureDetector(
                onTap: onLogoTap,
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    fit: BoxFit.contain,
                    errorBuilder: (ctx, err, st) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Desktop: show nav links; Mobile: hide and use menu button
              if (showLinks) ...[
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Home', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600))),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: const Text('Collections', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600))),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: const Text('Sale', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600))),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () {}, child: const Text('About', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600))),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: const Icon(Icons.search, size: 20, color: Colors.grey), onPressed: onSearch),
                    IconButton(icon: const Icon(Icons.person_outline, size: 20, color: Colors.grey), onPressed: onAccount),
                    IconButton(icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.grey), onPressed: onCart),
                  ],
                ),
              ] else ...[
                const Spacer(),
                IconButton(icon: const Icon(Icons.menu, size: 24, color: Colors.grey), onPressed: onMenu),
              ],
            ],
          );
        }),
      ),
    );
  }
}

