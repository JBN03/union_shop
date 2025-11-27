import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = [
      {'title': 'New Arrivals', 'image': 'https://via.placeholder.com/300x200?text=New+Arrivals'},
      {'title': 'Summer Collection', 'image': 'https://via.placeholder.com/300x200?text=Summer'},
      {'title': 'Print Shack', 'image': 'https://via.placeholder.com/300x200?text=Print+Shack'},
      {'title': 'Sale', 'image': 'https://via.placeholder.com/300x200?text=Sale'},
    ];

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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Collections', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: collections.length,
                    itemBuilder: (context, index) {
                      final c = collections[index];
                      return GestureDetector(
                        onTap: () {
                          // placeholder: navigate to collection page in future
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(c['image']!, fit: BoxFit.cover),
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                                  ),
                                ),
                                child: Text(c['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
