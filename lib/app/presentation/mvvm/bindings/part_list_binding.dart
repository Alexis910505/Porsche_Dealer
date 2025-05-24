import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zweck/app/data/repositories/cart_repository_impl.dart';
import 'package:zweck/app/data/repositories/part_repository_impl.dart';
import 'package:zweck/app/domain/repositories/cart_repository.dart';
import 'package:zweck/app/domain/repositories/part_repository.dart';
import 'package:zweck/app/presentation/mvvm/viewmodels/part_list_viewmodel.dart';

class PartListBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Inicializar SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs);

    Get.lazyPut<PartRepository>(
      () => PartRepositoryImpl(),
    );
    Get.lazyPut<CartRepository>(
      () => CartRepositoryImpl(prefs),
    );
    Get.lazyPut<PartListViewModel>(
      () => PartListViewModel(
        Get.find<PartRepository>(),
        Get.find<CartRepository>(),
      ),
    );
  }
}
