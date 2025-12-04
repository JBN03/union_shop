import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

class BodyWithFooter extends StatelessWidget {
  final Widget child;

  const BodyWithFooter({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        const Footer(),
      ],
    );
  }
}
