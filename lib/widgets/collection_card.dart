import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';

class CollectionCard extends StatelessWidget {
  final Collection collection;
  final double width;
  final VoidCallback? onTap;

  const CollectionCard({Key? key, required this.collection, required this.width, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: collection.imageUrl.isNotEmpty
                      ? Image.network(collection.imageUrl, fit: BoxFit.cover)
                      : Container(color: Colors.grey[200]),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Text(collection.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
