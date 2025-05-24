import 'package:get/get.dart';
import '../../../domain/repositories/part_repository.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../viewmodels/part_detail_viewmodel.dart';

class PartDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PartDetailViewModel>(
      PartDetailViewModel(
        Get.find<PartRepository>(),
        Get.find<CartRepository>(),
      ),
      permanent: true,
    );
  }
}
