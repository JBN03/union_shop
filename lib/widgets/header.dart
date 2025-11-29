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
    final baseHeight = calculated.clamp(56.0, 88.0).toDouble();

  
    const double logoSlotSize = 64.0;
    const double logoVisualSize = 200.0;
    final double height = baseHeight;

    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          final showLinks = constraints.maxWidth >= 800;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  // reserved small slot so spacing stays the same
                  SizedBox(width: logoSlotSize, height: logoSlotSize),

                  const SizedBox(width: 16),

                  // Desktop: center nav links; Mobile: hide links and use menu button
                  if (showLinks) ...[
                    // center the nav links between logo and the icons
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
                    // icons remain aligned to the right
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
              ),

              // Overlay the larger logo so the hover/click area covers the full image.
              Positioned(
                left: 16, // match the horizontal padding
                top: (height - logoVisualSize) / 2,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onLogoTap,
                    child: SizedBox(
                      width: logoVisualSize,
                      height: logoVisualSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
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
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

