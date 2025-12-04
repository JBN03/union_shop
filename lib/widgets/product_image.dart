import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class ProductImage extends StatefulWidget {
  final Product? product;
  final double maxHeight;

  const ProductImage({Key? key, required this.product, required this.maxHeight}) : super(key: key);

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

  void _prev() {
    setState(() {
      _index = (_index - 1) < 0 ? (_images.length - 1) : _index - 1;
    });
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % (_images.isEmpty ? 1 : _images.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final images = _images;
    final hasImages = images.isNotEmpty;
    final current = hasImages ? images[_index.clamp(0, images.length - 1)] : '';

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
                if (hasImages && images.length > 1)
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
                if (hasImages && images.length > 1)
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
          if (hasImages)
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
                    onTap: () => setState(() => _index = i),
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
