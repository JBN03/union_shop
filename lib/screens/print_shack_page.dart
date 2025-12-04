import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';

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
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('The Print Shack', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
