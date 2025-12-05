import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/screens/print_shack_content.dart';

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWithFooter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                onAccount: () {},
                onCart: () => Navigator.pushNamed(context, '/cart'),
                onMenu: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: PrintShackContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  