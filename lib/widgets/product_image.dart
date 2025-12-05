import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class ProductImage extends StatefulWidget {
  final Product? product;
  final double maxHeight;
  final String? selectedColor;
  final ValueChanged<String?>? onColorChanged;

  const ProductImage({Key? key, required this.product, required this.maxHeight, this.selectedColor, this.onColorChanged}) : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int _index = 0;

  List<String> get _images {
    final p = widget.product;
    if (p == null) return [];
    if (p.images.isNotEmpty) return p.images;
    if (p.imageUrl.isNotEmpty) return [p.imageUrl];
    return [];
  }

  String? _getColorForImage(String imageUrl) {
    final p = widget.product;
    if (p == null || p.colorImages.isEmpty) return null;
    for (final entry in p.colorImages.entries) {
      if (entry.value == imageUrl) return entry.key;
    }
    return null;
  }

  int _getIndexForColor(String? color) {
    if (color == null) return 0;
    final p = widget.product;
    if (p == null || p.colorImages.isEmpty) return 0;
    final imageUrl = p.colorImages[color];
    if (imageUrl == null) return 0;
    final images = _images;
    final idx = images.indexOf(imageUrl);
    return idx >= 0 ? idx : 0;
  }

  @override
  void didUpdateWidget(ProductImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedColor != oldWidget.selectedColor) {
      final newIndex = _getIndexForColor(widget.selectedColor);
      if (newIndex != _index) {
        setState(() => _index = newIndex);
      }
    }
  }

  void _goToIndex(int newIndex) {
    setState(() => _index = newIndex);
    final images = _images;
    if (newIndex >= 0 && newIndex < images.length) {
      final color = _getColorForImage(images[newIndex]);
      if (color != null && widget.onColorChanged != null) {
        widget.onColorChanged!(color);
      }
    }
  }

  void _prev() {
    final images = _images;
    final newIndex = (_index - 1) < 0 ? (images.length - 1) : _index - 1;
    _goToIndex(newIndex);
  }

  void _next() {
    final images = _images;
    final newIndex = (_index + 1) % (images.isEmpty ? 1 : images.length);
    _goToIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final images = _images;
    final hasImages = images.isNotEmpty;
    final current = hasImages ? images[_index.clamp(0, images.length - 1)] : '';
    final showCarousel = hasImages && images.length > 1;

    return Container(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: hasImages
                        ? Image.network(
                            current,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                            ),
                          ),
                  ),
                ),
                if (showCarousel)
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left, size: 36, color: Colors.white),
                        onPressed: _prev,
                        splashRadius: 24,
                      ),
                    ),
                  ),
                if (showCarousel)
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right, size: 36, color: Colors.white),
                        onPressed: _next,
                        splashRadius: 24,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (showCarousel)
            SizedBox(
              height: 56,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, i) {
                  final src = images[i];
                  final selected = i == _index;
                  return GestureDetector(
                    onTap: () => _goToIndex(i),
                    child: Container(
                      width: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: selected ? Colors.blueAccent : Colors.grey.shade300, width: selected ? 2 : 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.network(src, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[200])),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
