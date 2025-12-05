class Product {
  final String id;
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;
  final String description;
  final List<String> images;
  final Map<String, String> colorImages;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.description = '',
    List<String>? images,
    Map<String, String>? colorImages,
  }) : images = images ?? const [],
       colorImages = colorImages ?? const {};
  String get slug {
    final s = title.toLowerCase();
    final replaced = s.replaceAll(RegExp(r"[^a-z0-9]+"), '-');
    return replaced.replaceAll(RegExp(r'(^-+|-+\$)'), '');
  }
}
