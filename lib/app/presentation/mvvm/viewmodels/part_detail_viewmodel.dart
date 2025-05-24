// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import '../../../domain/entities/part_entity.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../base/base_viewmodel.dart';
import 'package:flutter/material.dart';

class PartDetailViewModel extends BaseViewModel {
  final PartRepository _partRepository;
  final CartRepository _cartRepository;
  final Rx<PartEntity?> _part = Rx<PartEntity?>(null);
  final RxInt _quantity = 1.obs;
  final RxBool _isValid = true.obs;

  PartDetailViewModel(this._partRepository, this._cartRepository);

  @override
  void onInit() {
    super.onInit();
    final String id = Get.parameters['id'] ?? '';
    if (id.isEmpty) {
      _isValid.value = false;
      return;
    }
    loadPart(id);
  }

  Future<void> loadPart(String id) async {
    await withLoading(() async {
      final part = await _partRepository.getPartById(id);
      if (part != null) {
        _part.value = part;
      } else {
        _isValid.value = false;
        Get.snackbar(
          'error'.tr,
          'part_not_found'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  void incrementQuantity() {
    if (_quantity.value < (_part.value?.stockQuantity ?? 0)) {
      _quantity.value++;
    }
  }

  void decrementQuantity() {
    if (_quantity.value > 1) {
      _quantity.value--;
    }
  }

  Future<void> addToCart() async {
    if (_part.value == null) return;

    await withLoading(() async {
      try {
        if (!_part.value!.inStock) {
          Get.snackbar(
            'error'.tr,
            'out_of_stock'.tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red[700],
            icon: const Icon(Icons.error_outline, color: Colors.red),
          );
          return;
        }

        await _cartRepository.addItem(
          id: _part.value!.id,
          name: _part.value!.name,
          price: _part.value!.price,
          quantity: _quantity.value,
          imageUrl: _part.value!.imageUrl,
        );

        Get.snackbar(
          'success'.tr,
          'added_to_cart'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green[700],
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          duration: const Duration(seconds: 2),
        );

        // Actualizar el stock después de agregar al carrito
        await _partRepository.updateStock(_part.value!.id, -_quantity.value);

        // Recargar la parte para actualizar el stock
        await loadPart(_part.value!.id);
      } catch (e) {
        Get.snackbar(
          'error'.tr,
          'error_adding_to_cart'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red[700],
          icon: const Icon(Icons.error_outline, color: Colors.red),
        );
      }
    });
  }

  // Getters computados
  PartEntity? get part => _part.value;
  int get quantity => _quantity.value;
  double get totalPrice => (_part.value?.price ?? 0) * _quantity.value;
  bool get canIncrement => _quantity.value < (_part.value?.stockQuantity ?? 0);
  bool get canDecrement => _quantity.value > 1;
  bool get isInStock => _part.value?.inStock ?? false;
  int get stockQuantity => _part.value?.stockQuantity ?? 0;
  bool get hasPart => _part.value != null;
  bool get isValid => _isValid.value;
}
