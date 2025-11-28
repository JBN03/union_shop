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
    final calculated = screenHeight * 0.12;
    final height = calculated.clamp(56.0, 100.0).toDouble();

    return Container(
      height: height,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'PLACEHOLDER HEADER TEXT',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Main header
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onLogoTap,
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 24,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 24,
                          height: 24,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, size: 20, color: Colors.grey),
                          onPressed: onSearch ?? () {
                            // Default behaviour: open a search modal and navigate to /collections with the query
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (ctx) {
                                final controller = TextEditingController();
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(ctx).viewInsets.bottom,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        const Text('Search products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 8),
                                        TextField(
                                          controller: controller,
                                          decoration: const InputDecoration(
                                            hintText: 'Search...',
                                            border: OutlineInputBorder(),
                                          ),
                                          autofocus: true,
                                          onSubmitted: (value) {
                                            Navigator.of(ctx).pop();
                                            if (value.trim().isNotEmpty) {
                                              Navigator.of(context).pushNamed('/collections', arguments: {'query': value.trim()});
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        ElevatedButton(
                                          onPressed: () {
                                            final q = controller.text.trim();
                                            Navigator.of(ctx).pop();
                                            if (q.isNotEmpty) Navigator.of(context).pushNamed('/collections', arguments: {'query': q});
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                                          child: const Text('Search'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_outline, size: 20, color: Colors.grey),
                          onPressed: onAccount,
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.grey),
                          onPressed: onCart,
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu, size: 20, color: Colors.grey),
                          onPressed: onMenu,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

