import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 600;

          Widget linkColumn(String title, List<Widget> children) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  ...children,
                ],
              ),
            );
          }

          final quickLinks = [
            TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false), child: const Text('Home')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/collections'), child: const Text('Collections')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About Us')),
          ];

          final customerLinks = [
            TextButton(onPressed: () {}, child: const Text('Contact')),
            TextButton(onPressed: () {}, child: const Text('FAQ')),
            TextButton(onPressed: () {}, child: const Text('Shipping')),
          ];

          final contactInfo = [
            const Text('Union Shop', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text('123 Example St.'),
            const Text('City, Country'),
            const SizedBox(height: 6),
            const Text('Email: info@example.com'),
            const Text('Phone: +44 1234 567890'),
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isNarrow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...quickLinks,
                        const SizedBox(height: 12),
                        ...customerLinks,
                        const SizedBox(height: 12),
                        ...contactInfo,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        linkColumn('Quick Links', quickLinks),
                        linkColumn('Customer', customerLinks),
                        linkColumn('Contact', contactInfo.map((w) => Padding(padding: const EdgeInsets.only(bottom:6), child: w)).toList()),
                      ],
                    ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 12),
              const Text('© 2025 Union Shop — All rights reserved', style: TextStyle(color: Colors.grey)),
            ],
          );
        },
      ),
    );
  }
}
