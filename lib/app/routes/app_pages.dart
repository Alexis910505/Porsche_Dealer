import 'package:get/get.dart';
import '../presentation/mvvm/views/home_view.dart';
import '../presentation/mvvm/views/porsche_detail_view.dart';
import '../presentation/mvvm/views/part_detail_view.dart';
import '../presentation/mvvm/views/cart_view.dart';
import '../domain/repositories/part_repository.dart';
import '../domain/repositories/cart_repository.dart';
import '../presentation/mvvm/viewmodels/part_detail_viewmodel.dart';
import '../presentation/mvvm/bindings/home_binding.dart';
import '../presentation/mvvm/bindings/porsche_detail_binding.dart';

abstract class Routes {
  static const String home = '/';
  static const String porscheDetail = '/model/:id';
  static const String partDetail = '/part/:id';
  static const String cart = '/cart';
}

class AppPages {
  static const String initial = Routes.home;

  static final List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.porscheDetail,
      page: () => const PorscheDetailView(),
      binding: PorscheDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.partDetail,
      page: () => const PartDetailView(),
      binding: BindingsBuilder(() {
        Get.put(PartDetailViewModel(
          Get.find<PartRepository>(),
          Get.find<CartRepository>(),
        ));
      }),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartView(),
      transition: Transition.rightToLeft,
    ),
  ];
}
