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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Personalisation', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(priceLabel, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        const Text('Lines of text', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        DropdownButton<String>(
          value: lines,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 'One line of text', child: Text('One line of text')),
            DropdownMenuItem(value: 'Two lines of text', child: Text('Two lines of text')),
            DropdownMenuItem(value: 'Three lines of text', child: Text('Three lines of text')),
          ],
          onChanged: onLinesChanged,
        ),
        const SizedBox(height: 16),
        const Text('Preview', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)),
          child: Text(lines, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.remove, size: 18), padding: const EdgeInsets.all(8), onPressed: onDecrease),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text('$qty', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
                  IconButton(icon: const Icon(Icons.add, size: 18), padding: const EdgeInsets.all(8), onPressed: onIncrease),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                child: Padding(padding: const EdgeInsets.symmetric(vertical: 14.0), child: Text('Add to cart${qty > 1 ? ' ($qty)' : ''}')),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(onPressed: () {}, child: const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Buy now'))),
            ),
          ],
        ),
      ],
    );
  }
}
