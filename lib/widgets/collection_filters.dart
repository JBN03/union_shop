import 'package:flutter/material.dart';

class CollectionFilters extends StatelessWidget {
  final String? sortValue;
  final void Function(String?)? onSortChanged;
  final String? filterValue;
  final void Function(String?)? onFilterChanged;

  const CollectionFilters({
    Key? key,
    this.sortValue,
    this.onSortChanged,
    this.filterValue,
    this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Sort by', border: OutlineInputBorder()),
            value: sortValue,
            items: const [
              DropdownMenuItem(value: 'popular', child: Text('Most popular')),
              DropdownMenuItem(value: 'latest', child: Text('Latest')),
              DropdownMenuItem(value: 'price_low', child: Text('Price: low to high')),
            ],
            onChanged: onSortChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Filter', border: OutlineInputBorder()),
            value: filterValue,
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All')),
              DropdownMenuItem(value: 'in_stock', child: Text('In stock')),
              DropdownMenuItem(value: 'sale', child: Text('On sale')),
            ],
            onChanged: onFilterChanged,
          ),
        ),
      ],
    );
  }
}
