import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends GetxController implements CartRepository {
  static const String _cartKey = 'cart';
  final SharedPreferences _prefs;

  // Observable para la lista del carrito
  final RxList<CartItem> _cartItems = <CartItem>[].obs;

  // Getters observables
  RxList<CartItem> get cartItems => _cartItems;
  RxDouble get total => _calculateTotal().obs;
  RxInt get itemCount => _calculateItemCount().obs;

  CartRepositoryImpl(this._prefs) {
    // Cargar items al inicializar
    _loadCartItems();
  }

  void _loadCartItems() {
    _cartItems.value = _getCartItems();
  }

  List<CartItem> _getCartItems() {
    final cartJson = _prefs.getString(_cartKey);
    if (cartJson == null) return [];

    try {
      final dynamic decoded = json.decode(cartJson);

      // Si es una lista, la convertimos directamente
      if (decoded is List) {
        return decoded
            .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      // Si es un mapa (formato antiguo), lo convertimos a lista
      if (decoded is Map) {
        final List<CartItem> items = [];
        decoded.forEach((key, value) {
          if (value is Map) {
            items.add(CartItem.fromJson(Map<String, dynamic>.from(value)));
          }
        });
        // Guardamos en el nuevo formato
        _saveCartItems(items);
        return items;
      }

      return [];
    } catch (e) {
      // Si hay algún error, limpiamos el carrito
      _prefs.remove(_cartKey);
      return [];
    }
  }

  Future<void> _saveCartItems(List<CartItem> items) async {
    final cartJson = json.encode(items.map((item) => item.toJson()).toList());
    await _prefs.setString(_cartKey, cartJson);
    // Actualizar la lista observable
    _cartItems.value = items;
  }

  double _calculateTotal() {
    double total = 0.0;
    for (final item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  int _calculateItemCount() {
    int count = 0;
    for (final item in _cartItems) {
      count += item.quantity;
    }
    return count;
  }

  @override
  Future<void> addItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl,
  }) async {
    final items = List<CartItem>.from(_cartItems);
    final existingItemIndex = items.indexWhere((item) => item.id == id);

    if (existingItemIndex != -1) {
      // Si el item ya existe, actualizamos su cantidad
      final existingItem = items[existingItemIndex];
      items[existingItemIndex] = CartItem(
        id: existingItem.id,
        name: existingItem.name,
        price: existingItem.price,
        quantity: existingItem.quantity + quantity,
        imageUrl: existingItem.imageUrl,
      );
    } else {
      // Si es un item nuevo, lo agregamos a la lista
      items.add(CartItem(
        id: id,
        name: name,
        price: price,
        quantity: quantity,
        imageUrl: imageUrl,
      ));
    }

    await _saveCartItems(items);
  }

  @override
  Future<void> removeItem(String id) async {
    final items = List<CartItem>.from(_cartItems);
    items.removeWhere((item) => item.id == id);
    await _saveCartItems(items);
  }

  @override
  Future<void> updateQuantity(String id, int quantity) async {
    final items = List<CartItem>.from(_cartItems);
    final index = items.indexWhere((item) => item.id == id);

    if (index != -1) {
      items[index] = CartItem(
        id: items[index].id,
        name: items[index].name,
        price: items[index].price,
        quantity: quantity,
        imageUrl: items[index].imageUrl,
      );
      await _saveCartItems(items);
    }
  }

  @override
  Future<void> clearCart() async {
    await _prefs.remove(_cartKey);
    _cartItems.clear();
  }

  @override
  Future<List<CartItem>> getItems() async {
    return _cartItems;
  }

  @override
  Future<double> getTotal() async {
    return _calculateTotal();
  }

  @override
  Future<int> getItemCount() async {
    return _calculateItemCount();
  }

  @override
  Future<Map<String, dynamic>> getCart() async {
    return {
      'items': _cartItems.map((item) => item.toJson()).toList(),
      'total': _calculateTotal(),
      'itemCount': _calculateItemCount(),
    };
  }
}
