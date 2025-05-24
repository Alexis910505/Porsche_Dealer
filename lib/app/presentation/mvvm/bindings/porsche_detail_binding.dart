import 'package:get/get.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/repositories/favorite_repository.dart';
import '../viewmodels/porsche_detail_viewmodel.dart';

class PorscheDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PorscheDetailViewModel>(
      () => PorscheDetailViewModel(
        Get.find<CartRepository>(),
        Get.find<FavoriteRepository>(),
      ),
      fenix: true,
    );
  }
}
