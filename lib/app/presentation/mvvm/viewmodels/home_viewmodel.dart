import 'package:get/get.dart';
import '../../../domain/repositories/porsche_repository.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../routes/app_pages.dart';
import '../base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final PorscheRepository _porscheRepository;
  final PartRepository _partRepository;
  final CartRepository _cartRepository;
  final RxInt _currentIndex = 0.obs;
  final RxBool _isInitialized = false.obs;
  final RxString _error = ''.obs;

  HomeViewModel(
    this._porscheRepository,
    this._partRepository,
    this._cartRepository,
  );

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await withLoading(() async {
        // Inicializar datos necesarios
        await Future.wait([
          _porscheRepository.getModels(),
          _partRepository.getAllParts(),
          _cartRepository.getItemCount(),
        ]);
        _isInitialized.value = true;
      });
    } catch (e) {
      _error.value = 'error_initializing_app'.tr;
    }
  }

  int get currentIndex => _currentIndex.value;
  bool get isInitialized => _isInitialized.value;
  @override
  String get error => _error.value;

  void navigateToTab(int index) {
    if (index >= 0 && index <= 1) {
      _currentIndex.value = index;
    }
  }

  void navigateToCart() {
    Get.toNamed(Routes.cart);
  }

  Future<void> retryInitialization() async {
    await _initialize();
  }
}
