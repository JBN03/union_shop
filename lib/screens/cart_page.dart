import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/cart_items_list.dart';
import 'package:union_shop/widgets/cart_summary.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
   

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
        body: const Column(
          children: [
            Expanded(child: CartItemsList()),
            CartSummary(),
            Footer(),
          ],
        ),
      ),
    );
  }

}

