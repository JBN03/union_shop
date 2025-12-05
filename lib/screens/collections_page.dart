import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/widgets/collections_body.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  _CollectionsPageState createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  late Future<List<Collection>> _collectionsFuture;
  List<Collection> _allCollections = [];
  final String _search = '';
  String _sort = 'Title A→Z';
  

  @override
  void initState() {
    super.initState();
    _collectionsFuture = ProductService.instance.getCollections();
  }

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
              onCart: () {},
              onMenu: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text('Collections', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
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
                      _allCollections = snapshot.data ?? [];

                      return CollectionsBody(
                        collections: _allCollections,
                        search: _search,
                        sort: _sort,
                        onSortChanged: (v) => setState(() { _sort = v ?? _sort; }),
                      );
                    },
                  ),
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
