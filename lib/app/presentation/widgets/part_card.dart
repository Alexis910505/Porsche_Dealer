// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/entities/part_entity.dart';
import '../../core/theme/app_theme.dart';

class PartCard extends StatelessWidget {
  final PartEntity part;
  final VoidCallback onTap;
  final VoidCallback? onAddToCart;

  const PartCard({
    Key? key,
    required this.part,
    required this.onTap,
    this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImage(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          part.name,
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        _buildRating(),
                        const SizedBox(height: 8),
                        _buildPriceAndStock(l10n),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildChips(),
              if (part.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  part.description,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              _buildAddToCartButton(l10n),
              const SizedBox(height: 8),
              _buildDeliveryInfo(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            part.imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 120,
              height: 120,
              color: Colors.grey[100],
              child: const Icon(Icons.error_outline, color: Colors.grey),
            ),
          ),
        ),
        if (!part.inStock)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'OUT OF STOCK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: Colors.amber[700],
        ),
        const SizedBox(width: 4),
        Text(
          '4.5',
          style: Get.textTheme.bodySmall?.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(128)',
          style: Get.textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndStock(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\$${part.price.toStringAsFixed(2)}',
              style: Get.textTheme.titleLarge?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            if (part.price > 1000)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'FREE SHIPPING',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        if (part.inStock)
          Text(
            '${l10n.inStock} - Envío en 1-2 días',
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  Widget _buildChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            part.category,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            part.compatibleModel,
            style: const TextStyle(
              color: AppTheme.secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: part.inStock ? onAddToCart : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              part.inStock ? AppTheme.primaryColor : Colors.grey[300],
          foregroundColor: part.inStock ? Colors.white : Colors.grey[600],
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: Icon(
          part.inStock
              ? Icons.shopping_cart_outlined
              : Icons.remove_shopping_cart_outlined,
          size: 20,
        ),
        label: Text(
          part.inStock ? l10n.addToCart : l10n.outOfStock,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo(AppLocalizations l10n) {
    return Row(
      children: [
        Icon(
          Icons.local_shipping_outlined,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          'Delivery by Zweck',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.verified_outlined,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          '2 Year Warranty',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
