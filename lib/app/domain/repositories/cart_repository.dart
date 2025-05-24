import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getItems();
  Future<void> addItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl,
  });
  Future<void> removeItem(String id);
  Future<void> updateQuantity(String id, int quantity);
  Future<void> clearCart();
  Future<Map<String, dynamic>> getCart();
  Future<double> getTotal();
  Future<int> getItemCount();
}
