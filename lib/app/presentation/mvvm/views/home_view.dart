import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../viewmodels/home_viewmodel.dart';
import 'porsche_list_view.dart';
import 'part_list_view.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/error_view.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading) {
          return const LoadingIndicator();
        }

        if (!controller.isInitialized) {
          return ErrorView(
            message: controller.error,
            onRetry: controller.retryInitialization,
          );
        }

        return IndexedStack(
          index: controller.currentIndex,
          children: const [
            PorscheListView(),
            PartListView(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() => NavigationBar(
            selectedIndex: controller.currentIndex,
            onDestinationSelected: controller.navigateToTab,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.directions_car_outlined),
                selectedIcon: const Icon(Icons.directions_car),
                label: l10n.porscheModels,
              ),
              NavigationDestination(
                icon: const Icon(Icons.build_outlined),
                selectedIcon: const Icon(Icons.build),
                label: l10n.parts,
              ),
            ],
          )),
    );
  }
}
