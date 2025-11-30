// No Flutter foundation imports required here

class CartItem {
  final String id;
  final String productId;
  final String title;
  final num price;
  final String? imageUrl;
  final int quantity;
  final Map<String, String>? attributes;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    this.imageUrl,
    required this.quantity,
    this.attributes,
  });

  CartItem copyWith({
    String? id,
    String? productId,
    String? title,
    num? price,
    String? imageUrl,
    int? quantity,
    Map<String, String>? attributes,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      attributes: attributes ?? this.attributes,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      attributes: json['attributes'] == null ? null : Map<String, String>.from(json['attributes'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'attributes': attributes,
    };
  }

  @override
  String toString() {
    return 'CartItem(id: $id, productId: $productId, title: $title, price: $price, quantity: $quantity, attributes: $attributes)';
  }
}
