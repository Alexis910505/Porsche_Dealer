import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/cart_repository_impl.dart';
import '../../../data/repositories/favorite_repository_impl.dart';
import '../../../data/repositories/porsche_repository_impl.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/repositories/favorite_repository.dart';
import '../../../domain/repositories/porsche_repository.dart';
import '../viewmodels/cart_viewmodel.dart';
import '../viewmodels/porsche_list_viewmodel.dart';

class PorscheBinding extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.lazyPut<PorscheRepository>(
      () => PorscheRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<FavoriteRepository>(
      () => FavoriteRepositoryImpl(Get.find<SharedPreferences>()),
      fenix: true,
    );

    Get.lazyPut<CartRepository>(
      () => CartRepositoryImpl(Get.find<SharedPreferences>()),
      fenix: true,
    );

    // ViewModels
    Get.lazyPut<PorscheListViewModel>(
      () => PorscheListViewModel(Get.find<PorscheRepository>()),
      fenix: true,
    );

    Get.lazyPut<CartViewModel>(
      () => CartViewModel(Get.find<CartRepository>()),
      fenix: true,
    );
  }
}
