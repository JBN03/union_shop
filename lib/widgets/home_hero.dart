import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
	final VoidCallback? onBrowseProducts;

	const HomeHero({Key? key, this.onBrowseProducts}) : super(key: key);

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
								top: 20,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.center,
									children: [
										// Union logo in center
										Image.network(
											'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
											width: 220,
											height: 220,
											fit: BoxFit.contain,
											errorBuilder: (ctx, err, st) => Container(
												width: 220,
												height: 220,
												color: Colors.grey[300],
												child: const Icon(Icons.image_not_supported, color: Colors.grey),
											),
										),
										const SizedBox(height: 24),
										ElevatedButton(
											onPressed: onBrowseProducts ?? () {},
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
