import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          try {
            final isNarrow = constraints.maxWidth < 600;

          Widget sectionTitle(String text) => Text(text, style: const TextStyle(fontWeight: FontWeight.w700));

          final openingLines = [
            sectionTitle('Opening Hours'),
            const SizedBox(height: 8),
            const Text('❄️ Winter Break Closure Dates ❄️', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text('Closing 4pm 19/12/2025'),
            const Text('Reopening 10am 05/01/2026'),
            const Text('Last post date: 12pm on 18/12/2025'),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            const Text('(Term Time)', style: TextStyle(fontWeight: FontWeight.w600)),
            const Text('Monday - Friday 10am - 4pm'),
            const SizedBox(height: 6),
            const Text('(Outside of Term Time / Consolidation Weeks)', style: TextStyle(fontWeight: FontWeight.w600)),
            const Text('Monday - Friday 10am - 3pm'),
            const SizedBox(height: 12),
            const Text('Purchase online 24/7', style: TextStyle(fontWeight: FontWeight.w600)),
          ];

          final helpLines = [
            sectionTitle('Help and Information'),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('Search')),
            TextButton(onPressed: () {}, child: const Text('Terms & Conditions of Sale Policy')),
          ];

          Widget latestOffers() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('Latest Offers'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 220,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          hintText: 'Email address',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey.shade400)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          final email = _emailController.text.trim();
                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your email')));
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Subscribed $email')));
                        _emailController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4B2356),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      child: const Text('SUBSCRIBE', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ],
            );
          }

          return isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...openingLines,
                    const SizedBox(height: 14),
                    ...helpLines,
                    const SizedBox(height: 18),
                    const Center(
                      child: Text(
                        '© 2025 Union Shop — All rights reserved',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: openingLines,
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: helpLines,
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.33,
                      child: latestOffers(),
                    ),
                  ],
                );
          } catch (e, st) {
            
            debugPrint('Footer build error: $e');
            debugPrintStack(stackTrace: st);
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
