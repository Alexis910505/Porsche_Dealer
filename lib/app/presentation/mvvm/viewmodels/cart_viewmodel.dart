import '../../../domain/entities/cart_item.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../data/repositories/cart_repository_impl.dart';
import '../base/base_viewmodel.dart';

class CartViewModel extends BaseViewModel {
  final CartRepository _cartRepository;

  CartViewModel(this._cartRepository);

  // Getters que usan los observables del repositorio
  List<CartItem> get items => (_cartRepository as CartRepositoryImpl).cartItems;
  double get total => (_cartRepository as CartRepositoryImpl).total.value;
  int get itemCount => (_cartRepository as CartRepositoryImpl).itemCount.value;

  Future<void> addItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl,
  }) async {
    await withLoading(() async {
      await _cartRepository.addItem(
        id: id,
        name: name,
        price: price,
        quantity: quantity,
        imageUrl: imageUrl,
      );
    });
  }

  Future<void> removeItem(String id) async {
    await withLoading(() async {
      await _cartRepository.removeItem(id);
    });
  }

  Future<void> updateQuantity(String id, int quantity) async {
    await withLoading(() async {
      await _cartRepository.updateQuantity(id, quantity);
    });
  }

  Future<void> clearCart() async {
    await withLoading(() async {
      await _cartRepository.clearCart();
    });
  }
}
