import 'package:flutter/material.dart';

import 'header_logo.dart';
import 'header_links.dart';
import 'header_actions.dart';
import 'header_compact_actions.dart';

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

    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          final showLinks = constraints.maxWidth >= 800;
          return Row(
            children: [
              if (showLinks) ...[],

              HeaderLogo(onLogoTap: onLogoTap),

              const SizedBox(width: 16),

              const SizedBox(width: 0),

              if (showLinks) ...[
                const HeaderLinks(),
                HeaderActions(onSearch: onSearch, onAccount: onAccount, onCart: onCart),
              ] else ...[
                const Spacer(),
                HeaderCompactActions(onSearch: onSearch, onAccount: onAccount, onCart: onCart, onMenu: onMenu),
              ],
            ],
          );
        }),
      ),
    );
  }
}

