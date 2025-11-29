import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends ChangeNotifier {
  CartService._internal();
  static final CartService instance = CartService._internal();

  final Map<String, CartItem> _itemsById = {}; // key: cartItem.id

  // Helper: find item by productId
  CartItem? _findByProductId(String productId) {
    try {
      return _itemsById.values.firstWhere((it) => it.productId == productId);
    } catch (_) {
      return null;
    }
  }

  num _parsePrice(String p) {
    final cleaned = p.replaceAll(RegExp(r'[^0-9\.-]'), '');
    return num.tryParse(cleaned) ?? 0;
  }

  // Public getters
  List<CartItem> get items => List.unmodifiable(_itemsById.values);

  int get totalItems => _itemsById.values.fold<int>(0, (s, it) => s + it.quantity);

  num get totalPrice => _itemsById.values.fold<num>(0, (s, it) => s + it.price * it.quantity);

  // Add item. If product already in cart, increase quantity.
  void addItem(Product product, {int qty = 1}) {
    if (qty <= 0) return;
    final productKey = product.title;
    final existing = _findByProductId(productKey);
    if (existing != null) {
      final updated = existing.copyWith(quantity: existing.quantity + qty);
      _itemsById[existing.id] = updated;
    } else {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final cartItem = CartItem(
        id: id,
        productId: productKey,
        title: product.title,
        price: _parsePrice(product.price),
        imageUrl: product.imageUrl,
        quantity: qty,
      );
      _itemsById[id] = cartItem;
    }
    notifyListeners();
  }

  // Remove by cart item id
  void removeItem(String cartItemId) {
    if (_itemsById.containsKey(cartItemId)) {
      _itemsById.remove(cartItemId);
      notifyListeners();
    }
  }

  // Update quantity (set). If qty <= 0 remove the item.
  void updateQuantity(String cartItemId, int qty) {
    if (!_itemsById.containsKey(cartItemId)) return;
    if (qty <= 0) {
      _itemsById.remove(cartItemId);
    } else {
      final existing = _itemsById[cartItemId]!;
      _itemsById[cartItemId] = existing.copyWith(quantity: qty);
    }
    notifyListeners();
  }

  // Clear cart
  void clear() {
    if (_itemsById.isNotEmpty) {
      _itemsById.clear();
      notifyListeners();
    }
  }

  // For convenience: find cartItemId for productId (or null)
  String? cartItemIdForProduct(String productId) {
    final found = _findByProductId(productId);
    return found?.id;
  }
}
