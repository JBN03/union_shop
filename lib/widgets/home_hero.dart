import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
	final VoidCallback? onBrowseCollections;

	const HomeHero({Key? key, this.onBrowseCollections}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return LayoutBuilder(
			builder: (context, constraints) {
				final height = (constraints.maxHeight == double.infinity) ? 320.0 : constraints.maxHeight;
				return SizedBox(
					height: height,
					width: double.infinity,
					child: Stack(
						children: [
							Positioned.fill(
								child: Image.network(
									'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
									fit: BoxFit.cover,
								),
							),
							Positioned.fill(
								child: Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
							),
							Positioned(
								left: 24,
								right: 24,
								top: 80,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.center,
									children: [
										const Text(
											'Placeholder Hero Title',
											style: TextStyle(
												fontSize: 32,
												fontWeight: FontWeight.bold,
												color: Colors.white,
												height: 1.2,
											),
										),
										const SizedBox(height: 16),
										const Text(
											"This is placeholder text for the hero section.",
											style: TextStyle(
												fontSize: 20,
												color: Colors.white,
												height: 1.5,
											),
											textAlign: TextAlign.center,
										),
										const SizedBox(height: 32),
										ElevatedButton(
											onPressed: onBrowseCollections ?? () {},
											style: ElevatedButton.styleFrom(
												backgroundColor: const Color(0xFF4d2963),
												foregroundColor: Colors.white,
												shape: const RoundedRectangleBorder(
													borderRadius: BorderRadius.zero,
												),
											),
											child: const Text(
												'BROWSE PRODUCTS',
												style: TextStyle(fontSize: 14, letterSpacing: 1),
											),
										),
									],
								),
							),
						],
					),
				);
			},
		);
	}
}
