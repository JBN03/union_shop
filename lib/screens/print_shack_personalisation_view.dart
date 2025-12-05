import 'package:flutter/material.dart';

class PrintShackPersonalisationView extends StatelessWidget {
  final String lines;
  final int qty;
  final String priceLabel;
  final ValueChanged<String?> onLinesChanged;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onAddToCart;

  const PrintShackPersonalisationView({
    Key? key,
    required this.lines,
    required this.qty,
    required this.priceLabel,
    required this.onLinesChanged,
    required this.onIncrease,
    required this.onDecrease,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lineOptions = ['One line of text', 'Two lines of text', 'Three lines of text'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personalisation',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Text(
          priceLabel,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
        ),
        const SizedBox(height: 24),

        _buildDropdown(
          label: 'Lines of text',
          value: lines,
          items: lineOptions,
          onChanged: onLinesChanged,
        ),
        const SizedBox(height: 20),

        const Text('Quantity', style: TextStyle(fontSize: 14, color: Colors.black87)),
        const SizedBox(height: 8),
        Container(
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onDecrease,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.remove, size: 16, color: Colors.black54),
                ),
              ),
              Text(
                '$qty',
                style: const TextStyle(fontSize: 16),
              ),
              InkWell(
                onTap: onIncrease,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add, size: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onAddToCart,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFF4d2963), width: 1.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4d2963),
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5A31F4),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Buy with ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                  'shop',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:  $value',
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Container(
          width: 280,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                items: items.map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                )).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
