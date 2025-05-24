// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../viewmodels/part_list_viewmodel.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/error_view.dart';
import '../../widgets/part_card.dart';

class PartListView extends GetView<PartListViewModel> {
  const PartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parts),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.toNamed('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(l10n),
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return const LoadingIndicator();
              }

              if (controller.hasError) {
                return ErrorView(
                  message: controller.error,
                  onRetry: controller.loadParts,
                );
              }

              if (!controller.hasParts) {
                return Center(
                  child: Text(
                    l10n.noPartsAvailable,
                    style: Get.textTheme.titleLarge,
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.parts.length,
                itemBuilder: (context, index) {
                  final part = controller.parts[index];
                  return PartCard(
                    part: part,
                    onTap: () => controller.selectPart(part.id),
                    onAddToCart: () => controller.addToCart(part.id),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.filters,
            style: Get.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          _buildCategoryFilters(l10n),
          const SizedBox(height: 16),
          _buildModelFilters(l10n),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters(AppLocalizations l10n) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip(
                label: l10n.allCategories,
                isSelected: !controller.hasCategorySelected,
                onSelected: (_) => controller.loadParts(),
              ),
              ...controller.categories.map((category) => _buildFilterChip(
                    label: category,
                    isSelected: controller.selectedCategory == category,
                    onSelected: (_) {
                      if (controller.selectedCategory == category) {
                        controller.loadParts();
                      } else {
                        controller.loadPartsByCategory(category);
                      }
                    },
                  )),
            ],
          ),
        ));
  }

  Widget _buildModelFilters(AppLocalizations l10n) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip(
                label: l10n.allModels,
                isSelected: !controller.hasModelSelected,
                onSelected: (_) => controller.loadParts(),
              ),
              ...controller.compatibleModels.map((model) => _buildFilterChip(
                    label: model,
                    isSelected: controller.selectedModel == model,
                    onSelected: (_) {
                      if (controller.selectedModel == model) {
                        controller.loadParts();
                      } else {
                        controller.loadPartsByModel(model);
                      }
                    },
                  )),
            ],
          ),
        ));
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required ValueChanged<bool> onSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        backgroundColor: Get.theme.cardColor,
        selectedColor: AppTheme.primaryColor.withOpacity(0.2),
        checkmarkColor: AppTheme.primaryColor,
        labelStyle: TextStyle(
          color: isSelected ? AppTheme.primaryColor : null,
        ),
      ),
    );
  }
}
