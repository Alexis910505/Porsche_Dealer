import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/cart_viewmodel.dart';
import '../../../core/styles/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CartView extends GetView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.cart),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _showClearCartDialog(context),
            tooltip: l10n.clearCart,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.items.isEmpty) {
          return Center(
            child: Text(
              l10n.noPartsAvailable,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppStyles.spacing),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: AppStyles.spacing),
                    child: Padding(
                      padding: const EdgeInsets.all(AppStyles.spacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.imageUrl,
                                  width: 120,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: 120,
                                    height: 80,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppStyles.spacing),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      NumberFormat.currency(
                                        symbol: '\$',
                                        decimalDigits: 0,
                                      ).format(item.price),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () => controller.removeItem(item.id),
                                tooltip: l10n.remove,
                              ),
                            ],
                          ),
                          const SizedBox(height: AppStyles.spacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: item.quantity > 1
                                        ? () => controller.updateQuantity(
                                              item.id,
                                              item.quantity - 1,
                                            )
                                        : null,
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => controller.updateQuantity(
                                      item.id,
                                      item.quantity + 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                NumberFormat.currency(
                                  symbol: '\$',
                                  decimalDigits: 0,
                                ).format(item.totalPrice),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppStyles.spacing),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.total,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Obx(
                          () => Text(
                            NumberFormat.currency(
                              symbol: '\$',
                              decimalDigits: 0,
                            ).format(controller.total),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppStyles.spacing),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showCheckoutDialog(context),
                        child: Text(l10n.checkout),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showClearCartDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.clearCart),
        content: Text(l10n.confirmClearCart),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () {
              controller.clearCart();
              Navigator.pop(context);
            },
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.checkout),
        content: Text(l10n.checkout),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }
}
