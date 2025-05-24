import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/part_entity.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../routes/app_pages.dart';
import '../base/base_viewmodel.dart';

class PartListViewModel extends BaseViewModel {
  final PartRepository _partRepository;
  final CartRepository _cartRepository;
  final RxList<PartEntity> _parts = <PartEntity>[].obs;
  final RxString _selectedCategory = ''.obs;
  final RxString _selectedModel = ''.obs;

  PartListViewModel(
    this._partRepository,
    this._cartRepository,
  );

  @override
  void onInit() {
    super.onInit();
    loadParts();
  }

  Future<void> loadParts() async {
    await withLoading(() async {
      _selectedCategory.value = '';
      _selectedModel.value = '';
      final parts = await _partRepository.getAllParts();
      _parts.value = parts;
    });
  }

  Future<void> loadPartsByCategory(String category) async {
    await withLoading(() async {
      if (category == _selectedCategory.value) {
        await loadParts();
      } else {
        _selectedCategory.value = category;
        _selectedModel.value = '';
        final parts = await _partRepository.getPartsByCategory(category);
        _parts.value = parts;
      }
    });
  }

  Future<void> loadPartsByModel(String model) async {
    await withLoading(() async {
      if (model == _selectedModel.value) {
        await loadParts();
      } else {
        _selectedModel.value = model;
        _selectedCategory.value = '';
        final parts = await _partRepository.getPartsByModel(model);
        _parts.value = parts;
      }
    });
  }

  Future<void> selectPart(String id) async {
    try {
      final part = await _partRepository.getPartById(id);
      if (part != null) {
        await Get.toNamed(Routes.partDetail.replaceAll(':id', id));
      } else {
        Get.snackbar(
          'error'.tr,
          'part_not_found'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'error_loading_part'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> addToCart(String id) async {
    await withLoading(() async {
      try {
        final part = await _partRepository.getPartById(id);
        if (part != null) {
          await _cartRepository.addItem(
            id: part.id,
            name: part.name,
            price: part.price,
            quantity: 1,
            imageUrl: part.imageUrl,
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
        } else {
          Get.snackbar(
            'error'.tr,
            'part_not_found'.tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red[700],
            icon: const Icon(Icons.error_outline, color: Colors.red),
          );
        }
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
  List<PartEntity> get parts => _parts;
  List<String> get categories => _parts.map((p) => p.category).toSet().toList();
  List<String> get compatibleModels =>
      _parts.map((p) => p.compatibleModel).toSet().toList();
  bool get hasParts => _parts.isNotEmpty;
  bool get hasCategorySelected => _selectedCategory.isNotEmpty;
  bool get hasModelSelected => _selectedModel.isNotEmpty;
  String get selectedCategory => _selectedCategory.value;
  String get selectedModel => _selectedModel.value;
}
