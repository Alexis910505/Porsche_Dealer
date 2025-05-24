import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/porsche_repository_impl.dart';
import '../../../data/repositories/part_repository_impl.dart';
import '../../../data/repositories/cart_repository_impl.dart';
import '../../../data/repositories/favorite_repository_impl.dart';
import '../../../domain/repositories/porsche_repository.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/repositories/favorite_repository.dart';
import '../viewmodels/home_viewmodel.dart';
import '../viewmodels/porsche_list_viewmodel.dart';
import '../viewmodels/part_list_viewmodel.dart';
import '../viewmodels/cart_viewmodel.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Inicializar SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs, permanent: true);

    // Inicializar repositorios
    Get.put<PorscheRepository>(
      PorscheRepositoryImpl(),
      permanent: true,
    );

    Get.put<PartRepository>(
      PartRepositoryImpl(),
      permanent: true,
    );

    Get.put<CartRepository>(
      CartRepositoryImpl(prefs),
      permanent: true,
    );

    Get.put<FavoriteRepository>(
      FavoriteRepositoryImpl(prefs),
      permanent: true,
    );

    // Inicializar ViewModels
    Get.put<HomeViewModel>(
      HomeViewModel(
        Get.find<PorscheRepository>(),
        Get.find<PartRepository>(),
        Get.find<CartRepository>(),
      ),
      permanent: true,
    );

    Get.put<PorscheListViewModel>(
      PorscheListViewModel(Get.find<PorscheRepository>()),
      permanent: true,
    );

    Get.put<PartListViewModel>(
      PartListViewModel(
        Get.find<PartRepository>(),
        Get.find<CartRepository>(),
      ),
      permanent: true,
    );

    Get.put<CartViewModel>(
      CartViewModel(Get.find<CartRepository>()),
      permanent: true,
    );
  }
}
