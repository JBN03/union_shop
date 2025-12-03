import 'package:flutter/material.dart';

class CollectionPagination extends StatelessWidget {
  final int pageCount;
  final int page;
  final ValueChanged<int> onPage;

  const CollectionPagination({Key? key, required this.pageCount, required this.page, required this.onPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: (pageCount > 1 && page > 0) ? () => onPage(page - 1) : null,
          ),
          Wrap(
            spacing: 6,
            children: List.generate(pageCount > 0 ? pageCount : 1, (i) {
              final pageIndex = i;
              final disabled = pageCount <= 1 || page == pageIndex;
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: page == pageIndex ? Colors.grey[200] : null,
                  minimumSize: const Size(36, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                onPressed: disabled ? null : () => onPage(pageIndex),
                child: Text('${pageIndex + 1}'),
              );
            }),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: (pageCount > 1 && page < pageCount - 1) ? () => onPage(page + 1) : null,
          ),
        ],
      ),
    );
  }
}
