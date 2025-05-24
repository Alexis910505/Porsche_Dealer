import 'package:get/get.dart';
import '../../../domain/entities/porsche_model.dart';
import '../../../domain/repositories/porsche_repository.dart';
import '../base/base_viewmodel.dart';

class PorscheListViewModel extends BaseViewModel {
  final PorscheRepository _repository;
  final RxList<PorscheModelEntity> _models = <PorscheModelEntity>[].obs;
  final RxString _selectedCategory = ''.obs;

  PorscheListViewModel(this._repository);

  @override
  void onInit() {
    super.onInit();
    loadModels();
  }

  Future<void> loadModels() async {
    await withLoading(() async {
      final models = await _repository.getModels();
      _models.value = models;
    });
  }

  Future<void> loadModelsByCategory(String category) async {
    await withLoading(() async {
      _selectedCategory.value = category;
      final models = await _repository.getModelsByCategory(category);
      _models.value = models;
    });
  }

  Future<void> selectModel(String id) async {
    await withLoading(() async {
      final model = await _repository.getModelById(id);
      if (model != null) {
        await Get.toNamed('/model/$id', arguments: model);
      } else {
        Get.snackbar(
          'Error',
          'Selected model not found',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  // Getters computados
  List<PorscheModelEntity> get models => _models;
  List<String> get categories =>
      _models.map((m) => m.category).toSet().toList();
  bool get hasModels => _models.isNotEmpty;
  bool get hasCategorySelected => _selectedCategory.isNotEmpty;
  String get selectedCategory => _selectedCategory.value;
}
