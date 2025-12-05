import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

class BodyWithFooter extends StatelessWidget {
  final Widget child;

  const BodyWithFooter({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            child,
            const Footer(),
          ],
        ),
      ),
    );
  }
}
