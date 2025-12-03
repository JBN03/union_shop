import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/widgets/collection_card.dart';

class CollectionsBody extends StatelessWidget {
  final List<Collection> collections;
  final String search;
  final String sort;
  final ValueChanged<String?> onSortChanged;

  const CollectionsBody({
    Key? key,
    required this.collections,
    required this.search,
    required this.sort,
    required this.onSortChanged,
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

      final cross = width >= 900 ? 3 : 2;
      final desiredCardWidth = (width - spacing * (cross - 1)) / cross;
      final targetCardWidth = desiredCardWidth.clamp(140.0, 360.0);
      final pageItems = filtered;

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
        ],
      );
    });
  }
}
