import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

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
									GridView.builder(
										shrinkWrap: true,
										physics: const NeverScrollableScrollPhysics(),
										gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
											crossAxisCount: 2,
											crossAxisSpacing: 12,
											mainAxisSpacing: 12,
											childAspectRatio: 0.78,
										),
										itemCount: saleItems.length,
										itemBuilder: (context, index) {
											final item = saleItems[index];
											return Card(
												clipBehavior: Clip.hardEdge,
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.stretch,
													children: [
														Expanded(
															child: Image.network(item['image']!, fit: BoxFit.cover),
														),
														Padding(
															padding: const EdgeInsets.all(8.0),
															child: Column(
																crossAxisAlignment: CrossAxisAlignment.start,
																children: [
																	Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.w700)),
																	const SizedBox(height: 6),
																	Row(
																		children: [
																			Text(item['price']!, style: const TextStyle(color: Color(0xFF4d2963), fontWeight: FontWeight.bold)),
																			const SizedBox(width: 8),
																			Text(item['orig']!, style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
																		],
																	),
																	const SizedBox(height: 8),
																	ElevatedButton(
																		onPressed: () {},
																		style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
																		child: const Text('Shop now'),
																	),
																],
															),
														)
													],
												),
											);
										},
									),
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
