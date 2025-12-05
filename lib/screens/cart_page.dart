import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
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
    final viewportHeight = MediaQuery.of(context).size.height;
    
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          if (context.canPop()) context.pop();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: viewportHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Header(
                      onLogoTap: () => context.go('/'),
                      onCart: () {},
                      onSearch: () {},
                      onAccount: () => context.push('/login'),
                      onMenu: () {},
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Your Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const CartItemsList(),
                    const SizedBox(height: 16),
                    const CartSummary(),
                    const SizedBox(height: 32),
                  ],
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

