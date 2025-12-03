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
  List<Collection> _allCollections = [];
  String _search = '';
  String _sort = 'Title A→Z';
  int _page = 0;
  int _pageSize = 4;

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
                      _allCollections = snapshot.data ?? [];

                      
                      final filtered = _allCollections.where((c) => c.title.toLowerCase().contains(_search.toLowerCase())).toList();

                      if (_sort == 'Title A→Z') {
                        filtered.sort((a, b) => a.title.compareTo(b.title));
                      } else if (_sort == 'Title Z→A') {
                        filtered.sort((a, b) => b.title.compareTo(a.title));
                      }

                      return LayoutBuilder(builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final spacing = 16.0;

                        final desiredFourColWidth = (width - spacing * 3) / 4;
                        final targetCardWidth = (desiredFourColWidth.clamp(140.0, 360.0));

                        final cross = width >= 1000 ? 3 : (width >= 600 ? 2 : 1);

                        
                        final rows = 2;
                        final visiblePageSize = cross * rows;

                        final total = filtered.length;
                        final pageCount = (total / visiblePageSize).ceil().clamp(1, total);
                        if (_page >= pageCount) _page = (pageCount - 1).clamp(0, pageCount - 1);

                        final start = _page * visiblePageSize;
                        final end = (start + visiblePageSize).clamp(0, total);
                        final pageItems = (start < end) ? filtered.sublist(start, end) : <Collection>[];

                        final controls = Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            DropdownButton<String>(
                              value: _sort,
                              items: const [
                                DropdownMenuItem(value: 'Title A→Z', child: Text('Title A→Z')),
                                DropdownMenuItem(value: 'Title Z→A', child: Text('Title Z→A')),
                              ],
                              onChanged: (v) => setState(() { _sort = v ?? _sort; }),
                            ),
                          ],
                        );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controls,
                            const SizedBox(height: 12),
                            Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: targetCardWidth * cross + spacing * (cross - 1)),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: pageItems.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: cross,
                                    crossAxisSpacing: spacing,
                                    mainAxisSpacing: spacing,
                                    childAspectRatio: 0.85,
                                  ),
                                  itemBuilder: (context, index) {
                                    final c = pageItems[index];
                                    return Center(
                                      child: SizedBox(
                                        width: targetCardWidth,
                                        child: GestureDetector(
                                          onTap: () => Navigator.pushNamed(context, '/collection/${c.id}'),
                                          child: Card(
                                            clipBehavior: Clip.hardEdge,
                                            child: Stack(
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 1,
                                                  child: c.imageUrl.isNotEmpty ? Image.network(c.imageUrl, fit: BoxFit.cover) : Container(color: Colors.grey[200]),
                                                ),
                                                Positioned(
                                                  left: 12,
                                                  right: 12,
                                                  bottom: 12,
                                                  child: Text(c.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),
                            if (pageCount > 1)
                              Center(
                                child: Wrap(
                                  spacing: 8,
                                  children: List.generate(pageCount, (i) {
                                    final pageIndex = i;
                                    return OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: _page == pageIndex ? Colors.grey[200] : null,
                                      ),
                                      onPressed: () => setState(() => _page = pageIndex),
                                      child: Text('${pageIndex + 1}'),
                                    );
                                  }),
                                ),
                              ),
                          ],
                        );
                      });
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
