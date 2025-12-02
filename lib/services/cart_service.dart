import 'package:flutter/foundation.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

class CartService extends ChangeNotifier {
  CartService._internal();
  static final CartService instance = CartService._internal();

  final List<CartItem> _items = [];

  
  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold<int>(0, (s, it) => s + it.quantity);

  double get totalPrice => _items.fold<double>(0.0, (s, it) => s + (it.price.toDouble() * it.quantity));

  double _parsePrice(String p) {
    final cleaned = p.replaceAll(RegExp(r'[^0-9\.-]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  void addItem(Product product, {int qty = 1, Map<String, String>? attributes}) {
    if (qty <= 0) return;
    final productKey = product.id;

    final idx = _items.indexWhere((it) => it.productId == productKey && mapEquals(it.attributes ?? {}, attributes ?? {}));
    if (idx != -1) {
      final existing = _items[idx];
      _items[idx] = existing.copyWith(quantity: existing.quantity + qty);
    } else {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final item = CartItem(
        id: id,
        productId: productKey,
        title: product.title,
        price: _parsePrice(product.price),
        imageUrl: product.imageUrl,
        quantity: qty,
        attributes: attributes,
      );
      _items.add(item);
    }

    
    notifyListeners();
  }

  void removeItem(String id) {
    final initialLength = _items.length;
    _items.removeWhere((it) => it.id == id);
    if (_items.length != initialLength) notifyListeners();
  }

  void updateQuantity(String id, int qty) {
    final idx = _items.indexWhere((it) => it.id == id);
    if (idx == -1) return;
    if (qty <= 0) {
      _items.removeAt(idx);
    } else {
      final existing = _items[idx];
      _items[idx] = existing.copyWith(quantity: qty);
    }
    notifyListeners();
  }

  void clear() {
    if (_items.isNotEmpty) {
      _items.clear();
      notifyListeners();
    }
  }

  
  String? cartItemIdForProduct(String productId, [Map<String, String>? attributes]) {
    final idx = _items.indexWhere((it) => it.productId == productId && mapEquals(it.attributes ?? {}, attributes ?? {}));
    return idx == -1 ? null : _items[idx].id;
  }
}
