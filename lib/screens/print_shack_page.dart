import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/screens/print_shack_content.dart';

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWithFooter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              onLogoTap: () => context.go('/'),
              onAccount: () {},
              onCart: () => context.push('/cart'),
              onMenu: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: PrintShackContent(),
            ),
          ],
        ),
      ),
    );
  }
}