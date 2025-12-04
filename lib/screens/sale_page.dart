import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

class SalePage extends StatelessWidget {
	const SalePage({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final saleItems = [
			{'title': 'Discounted Product 1', 'price': '£8.00', 'orig': '£12.00', 'image': 'https://via.placeholder.com/400x400?text=Sale+1'},
			{'title': 'Discounted Product 2', 'price': '£10.00', 'orig': '£15.00', 'image': 'https://via.placeholder.com/400x400?text=Sale+2'},
			{'title': 'Discounted Product 3', 'price': '£7.50', 'orig': '£10.00', 'image': 'https://via.placeholder.com/400x400?text=Sale+3'},
		];

		return Scaffold(
			body: SingleChildScrollView(
				child: Column(
					children: [
						Header(
							onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
							onAccount: () {},
							onCart: () {},
							onMenu: () {},
						),
						Padding(
							padding: const EdgeInsets.all(24.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									const Text('Sale Items', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
									const SizedBox(height: 8),
									const Text('Limited time discounts and promotions. Prices shown are examples and static.'),
									const SizedBox(height: 20),
																		LayoutBuilder(builder: (context, constraints) {
																			final width = constraints.maxWidth;
																			const spacing = 12.0;

																			final desiredFourColWidth = (width - spacing * 3) / 4;
																			final targetCardWidth = desiredFourColWidth.clamp(140.0, 360.0);

																			final crossAxisCount = width > 800 ? 3 : (width > 400 ? 2 : 1);

																			return Center(
																				child: ConstrainedBox(
																					constraints: BoxConstraints(maxWidth: targetCardWidth * crossAxisCount + spacing * (crossAxisCount - 1)),
																					child: GridView.builder(
																						shrinkWrap: true,
																						physics: const NeverScrollableScrollPhysics(),
																						itemCount: saleItems.length,
																						gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
																							crossAxisCount: crossAxisCount,
																							crossAxisSpacing: spacing,
																							mainAxisSpacing: spacing,
																							childAspectRatio: 0.85,
																						),
																						itemBuilder: (context, index) {
																							final item = saleItems[index];
																							return Center(
																								child: SizedBox(
																									width: targetCardWidth,
																									child: ProductCard(
																										title: item['title']!,
																										price: item['price']!,
																										imageUrl: item['image']!,
																										productId: item['title']!.hashCode.toString(),
																									),
																								),
																							);
																						},
																					),
																				),
																			);
																		}),
								],
							),
						),
						const Footer(),
					],
				),
			),
		);
	}
}
