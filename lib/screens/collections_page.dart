import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/collection.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  _CollectionsPageState createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  late Future<List<Collection>> _collectionsFuture;

  @override
  void initState() {
    super.initState();
    _collectionsFuture = ProductService.instance.getCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
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
                  FutureBuilder<List<Collection>>(
                    future: _collectionsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(height: 240, child: Center(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      final collections = snapshot.data ?? [];
                      return GridView.builder(
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
                              Navigator.pushNamed(context, '/collection', arguments: {'id': c.id, 'title': c.title});
                            },
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(c.imageUrl, fit: BoxFit.cover),
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
                                    child: Text(c.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
