import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';

class Header extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onSearch;
  final VoidCallback? onAccount;
  final VoidCallback? onCart;
  final VoidCallback? onMenu;
  final String? id;

  const Header({
    super.key,
    this.id,
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
    final cart = CartService.instance;

    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          final showLinks = constraints.maxWidth >= 800;
          return Row(
            children: [

              if (showLinks) ...[
                
                
              ],
              
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onLogoTap,
                  child: SizedBox(
                    width: 200,
                    height: 200,
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
              ),

              const SizedBox(width: 16),

              const SizedBox(width: 0),

              
              if (showLinks) ...[
                
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/'),
                          child: const Text('Home', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/collections'),
                          child: const Text('Collections', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/sale'),
                          child: const Text('Sale', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/about'),
                          child: const Text('About', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Row(
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
                        Builder(builder: (ctx) {
                          final platform = defaultTargetPlatform;
                          final isDesktopPlatform = platform == TargetPlatform.windows || platform == TargetPlatform.linux || platform == TargetPlatform.macOS;
                          if (isDesktopPlatform) {
                            return IconButton(
                              icon: const Icon(Icons.menu_rounded, size: 20, color: Colors.grey),
                              onPressed: () {
                                if (onMenu != null) onMenu!();
                                Navigator.pushNamed(context, '/collections');
                              },
                              tooltip: 'Menu',
                            );
                          }
                          return PopupMenuButton<int>(
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
                          );
                        }),
                                      shape: BoxShape.circle,
                                    ),
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
                      IconButton(
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: () {
                          if (onMenu != null) onMenu!();
                          Navigator.pushNamed(context, '/collections');
                        },
                        tooltip: 'Menu',
                      ),
                    ],
                ),
              ] else ...[
                const Spacer(),
                Row(
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
                ),
              ],
            ],
          );
        }),
      ),
    );
  }
}

