import 'package:flutter/material.dart';
import 'package:union_shop/widgets/product_image.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/screens/print_shack_personalisation.dart';

class PrintShackContent extends StatefulWidget {
  const PrintShackContent({Key? key}) : super(key: key);

  @override
  State<PrintShackContent> createState() => _PrintShackContentState();
}

class _PrintShackContentState extends State<PrintShackContent> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('The Print Shack', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),

        LayoutBuilder(builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 800;
          if (isWide) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 360,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.basic,
                          child: IgnorePointer(
                            child: ProductImage(
                              product: Product(
                                id: 'printshack-sample',
                                title: 'Custom Print Sample',
                                price: '£5.00',
                                imageUrl: 'https://i.ibb.co/N2f5Yd1J/Gemini-Generated-Image-wpxvgewpxvgewpxv-1.png',
                              ),
                              maxHeight: 360,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),

                    
                    const SizedBox(
                      width: 320,
                      child: PrintShackPersonalisation(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 360,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.basic,
                    child: IgnorePointer(
                      child: ProductImage(
                        product: Product(
                          id: 'printshack-sample',
                          title: 'Custom Print Sample',
                          price: '£5.00',
                          imageUrl: 'https://i.ibb.co/N2f5Yd1J/Gemini-Generated-Image-wpxvgewpxvgewpxv-1.png',
                        ),
                        maxHeight: 360,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const PrintShackPersonalisation(),
              ],
            );
          }
        }),
      ],
    );
  }
}
