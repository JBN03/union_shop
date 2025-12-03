import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/widgets/collection_card.dart';
import 'package:union_shop/widgets/collections_pagination.dart';

class CollectionsBody extends StatelessWidget {
  final List<Collection> collections;
  final String search;
  final String sort;
  final ValueChanged<String?> onSortChanged;
  final int page;
  final void Function(int page, int pageCount) onPage;

  const CollectionsBody({
    Key? key,
    required this.collections,
    required this.search,
    required this.sort,
    required this.onSortChanged,
    required this.page,
    required this.onPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtered = collections.where((c) => c.title.toLowerCase().contains(search.toLowerCase())).toList();

    if (sort == 'Title A→Z') {
      filtered.sort((a, b) => a.title.compareTo(b.title));
    } else if (sort == 'Title Z→A') {
      filtered.sort((a, b) => b.title.compareTo(a.title));
    }

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      const spacing = 16.0;

      final desiredFourColWidth = (width - spacing * 3) / 4;
      final targetCardWidth = (desiredFourColWidth.clamp(140.0, 360.0));

      final cross = width >= 1000 ? 3 : (width >= 600 ? 2 : 1);

      const rows = 2;
      final visiblePageSize = cross * rows;

      final total = filtered.length;
      final pageCount = (total / visiblePageSize).ceil().clamp(1, total);
      var currentPage = page;
      if (currentPage >= pageCount) currentPage = (pageCount - 1).clamp(0, pageCount - 1);

      final start = currentPage * visiblePageSize;
      final end = (start + visiblePageSize).clamp(0, total);
      final pageItems = (start < end) ? filtered.sublist(start, end) : <Collection>[];

      final controls = Row(
        children: [
          const Expanded(child: SizedBox()),
          DropdownButton<String>(
            value: sort,
            items: const [
              DropdownMenuItem(value: 'Title A→Z', child: Text('Title A→Z')),
              DropdownMenuItem(value: 'Title Z→A', child: Text('Title Z→A')),
            ],
            onChanged: onSortChanged,
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
                  return CollectionCard(
                    collection: c,
                    width: targetCardWidth,
                    onTap: () => Navigator.pushNamed(context, '/collection/${c.id}'),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 12),
          CollectionsPagination(
            pageCount: pageCount,
            page: currentPage,
            onPage: (p) => onPage(p, pageCount),
          ),
        ],
      );
    });
  }
}
