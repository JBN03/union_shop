class Product {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.description = '',
    List<String>? images,
  }) : images = images ?? const [];
  String get slug {
    final s = title.toLowerCase();
    final replaced = s.replaceAll(RegExp(r"[^a-z0-9]+"), '-');
    return replaced.replaceAll(RegExp(r'(^-+|-+\$)'), '');
  }
}
