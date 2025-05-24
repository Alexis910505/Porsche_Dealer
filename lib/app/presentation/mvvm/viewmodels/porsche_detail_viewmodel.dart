import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../domain/entities/porsche_model.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/repositories/favorite_repository.dart';
import '../base/base_viewmodel.dart';

class PorscheDetailViewModel extends BaseViewModel {
  final CartRepository _cartRepository;
  final FavoriteRepository _favoriteRepository;

  final Rx<PorscheModelEntity?> _model = Rx<PorscheModelEntity?>(null);
  final RxBool _isFavorite = false.obs;

  PorscheDetailViewModel(
    this._cartRepository,
    this._favoriteRepository,
  );

  PorscheModelEntity? get model => _model.value;
  bool get isFavorite => _isFavorite.value;

  @override
  void onInit() {
    super.onInit();
    try {
      final model = Get.arguments as PorscheModelEntity;
      _model.value = model;
      _checkFavoriteStatus(model.id);
    } catch (e) {
      setError('error_loading_model'.tr);
      Get.back();
    }
  }

  Future<void> _checkFavoriteStatus(String modelId) async {
    try {
      _isFavorite.value = await _favoriteRepository.isFavorite(modelId);
    } catch (e) {
      setError('error_checking_favorite'.tr);
    }
  }

  Future<void> shareModel() async {
    if (_model.value == null) return;

    try {
      final specs = _model.value!.specifications.entries
          .map((e) => '${e.key}: ${e.value}')
          .join('\n');

      final shareText = 'share_description'
          .tr
          .replaceAll('@name', _model.value!.name)
          .replaceAll('@description', _model.value!.description)
          .replaceAll('@specs', specs);

      await Share.share(
        shareText,
        subject: 'share_title'.tr.replaceAll('@name', _model.value!.name),
      );
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'share_error'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> toggleFavorite() async {
    if (_model.value == null) return;

    try {
      await withLoading(() async {
        if (_isFavorite.value) {
          await _favoriteRepository.removeFavorite(_model.value!.id);
        } else {
          await _favoriteRepository.addFavorite(_model.value!.id);
        }
        _isFavorite.value = !_isFavorite.value;
      });
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'favorite_error'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> addToCart() async {
    if (_model.value == null) return;

    try {
      await withLoading(() async {
        await _cartRepository.addItem(
          id: _model.value!.id,
          name: _model.value!.name,
          price: _model.value!.price,
          quantity: 1,
          imageUrl: _model.value!.imageUrl,
        );
        Get.snackbar(
          'success'.tr,
          'added_to_cart'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'cart_error'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Getters
  String get name => model?.name ?? '';
  String get description => model?.description ?? '';
  String get imageUrl => model?.imageUrl ?? '';
  String get category => model?.category.toLowerCase() ?? '';
  Map<String, dynamic> get specifications => model?.specifications ?? {};
  List<String> get features => model?.features ?? [];
  PorscheModelEntity get porscheModel =>
      model ??
      PorscheModelEntity(
          id: '',
          name: '',
          description: '',
          imageUrl: '',
          galleryImages: const [],
          category: '',
          specifications: {},
          features: const [],
          price: 0.0);
}
