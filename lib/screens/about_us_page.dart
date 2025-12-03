import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
              onSearch: () {},
              onAccount: () {},
              onCart: () {},
              onMenu: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Union Shop', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text(
                    'Union Shop is a demo store built for coursework. We sell a curated selection of products and provide a simple, responsive UI for browsing and purchasing items.\n\nThis About page is static content used to fulfil the coursework requirement for a static About Us page.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text('Our Mission', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  Text('To provide quality merchandise and an excellent user experience.'),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
