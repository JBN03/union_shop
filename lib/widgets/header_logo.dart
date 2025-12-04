import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final VoidCallback? onLogoTap;

  const HeaderLogo({Key? key, this.onLogoTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onLogoTap,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.network(
            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
            fit: BoxFit.contain,
            errorBuilder: (ctx, err, st) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
