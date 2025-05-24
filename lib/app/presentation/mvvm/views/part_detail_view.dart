import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/part_detail_viewmodel.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PartDetailView extends GetView<PartDetailViewModel> {
  const PartDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return WillPopScope(
      onWillPop: () async {
        if (!controller.isValid) {
          Get.offAllNamed('/home');
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(controller.part?.name ?? '')),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Get.toNamed('/cart'),
            ),
          ],
        ),
        body: Obx(() {
          if (!controller.isValid) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.partNotFound,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.offAllNamed('/home'),
                    child: const Text('Volver al inicio'),
                  ),
                ],
              ),
            );
          }

          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final part = controller.part;
          if (part == null) {
            return Center(
              child: Text(
                l10n.partNotFound,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageGallery(context, part),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, part, l10n),
                      const SizedBox(height: 24),
                      _buildDescription(context, part, l10n),
                      const SizedBox(height: 24),
                      _buildSpecifications(context, part, l10n),
                      const SizedBox(height: 24),
                      _buildCompatibility(context, part, l10n),
                      const SizedBox(height: 32),
                      _buildAddToCartButton(context, l10n),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildImageGallery(BuildContext context, dynamic part) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.black,
      child: Image.network(
        part.imageUrl,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 48,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, dynamic part, dynamic l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          part.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Chip(
              label: Text(part.category),
              backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
            ),
            const SizedBox(width: 8),
            Chip(
              label: Text(part.compatibleModel),
              backgroundColor: AppTheme.secondaryColor.withOpacity(0.1),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${part.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: part.inStock ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                part.inStock
                    ? '${l10n.inStock}: ${part.stockQuantity}'
                    : l10n.outOfStock,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, dynamic part, dynamic l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.description,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          part.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildSpecifications(
      BuildContext context, dynamic part, dynamic l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.specifications,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ...part.specifications.entries.map((spec) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    '${spec.key}: ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      spec.value.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildCompatibility(BuildContext context, dynamic part, dynamic l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.compatibleModels,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              label: Text(part.compatibleModel),
              backgroundColor: AppTheme.secondaryColor.withOpacity(0.1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context, dynamic l10n) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed:
                  controller.canDecrement ? controller.decrementQuantity : null,
              icon: const Icon(Icons.remove_circle_outline),
              color:
                  controller.canDecrement ? AppTheme.primaryColor : Colors.grey,
            ),
            Obx(() => Text(
                  '${controller.quantity}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            IconButton(
              onPressed:
                  controller.canIncrement ? controller.incrementQuantity : null,
              icon: const Icon(Icons.add_circle_outline),
              color:
                  controller.canIncrement ? AppTheme.primaryColor : Colors.grey,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: controller.isInStock ? controller.addToCart : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.isInStock
                  ? AppTheme.primaryColor
                  : Colors.grey[300],
              foregroundColor:
                  controller.isInStock ? Colors.white : Colors.grey[600],
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Icon(
              controller.isInStock
                  ? Icons.shopping_cart_outlined
                  : Icons.remove_shopping_cart_outlined,
              size: 24,
            ),
            label: Text(
              controller.isInStock ? l10n.addToCart : l10n.outOfStock,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (controller.isInStock)
          Center(
            child: Text(
              'Total: \$${controller.totalPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
      ],
    );
  }
}
