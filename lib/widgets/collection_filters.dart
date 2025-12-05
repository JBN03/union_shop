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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'SORT BY',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(width: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: sortValue ?? 'Featured',
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            items: const [
              DropdownMenuItem(value: 'Featured', child: Text('Featured')),
              DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
              DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
              DropdownMenuItem(value: 'A-Z', child: Text('A-Z')),
              DropdownMenuItem(value: 'Z-A', child: Text('Z-A')),
            ],
            onChanged: onSortChanged,
          ),
        ),
      ],
    );
  }
}
