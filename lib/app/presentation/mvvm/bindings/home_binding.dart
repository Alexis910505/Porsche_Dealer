import 'package:get/get.dart';
import '../../../domain/repositories/porsche_repository.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../viewmodels/home_viewmodel.dart';
import '../viewmodels/porsche_list_viewmodel.dart';
import '../viewmodels/part_list_viewmodel.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Los repositorios ya están registrados por InitialBinding
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
  }
}
