import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/styles/app_styles.dart';
import '../viewmodels/porsche_detail_viewmodel.dart';
import '../widgets/model_gallery.dart';
import '../widgets/specification_card.dart';

class PorscheDetailView extends GetView<PorscheDetailViewModel> {
  const PorscheDetailView({super.key});

  String _getCategoryTranslation(AppLocalizations l10n, String category) {
    switch (category) {
      case 'sports':
        return l10n.category_sports;
      case 'suv':
        return l10n.category_suv;
      case 'electric':
        return l10n.category_electric;
      case 'sedan':
        return l10n.category_sedan;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
        actions: [
          // Botón de compartir
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: controller.shareModel,
            tooltip: l10n.share,
          ),
          // Botón de favoritos
          Obx(
            () => IconButton(
              icon: Icon(
                controller.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: controller.isFavorite
                    ? AppStyles.accentColor
                    : AppStyles.textColor,
              ),
              onPressed: controller.toggleFavorite,
              tooltip: controller.isFavorite
                  ? l10n.removeFromFavorites
                  : l10n.addToFavorites,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: controller.addToCart,
            tooltip: l10n.addToCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Galería de imágenes
            ModelGallery(
              images: controller.porscheModel.galleryImages,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(AppStyles.spacingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título y categoría
                  Text(controller.name, style: AppStyles.displayTitle),
                  Text(
                    '${l10n.category}: ${_getCategoryTranslation(l10n, controller.category)}',
                    style: AppStyles.captionText.copyWith(
                      color: AppStyles.primaryColor,
                    ),
                  ),
                  const SizedBox(height: AppStyles.spacingLg),
                  // Descripción
                  Text(controller.description, style: AppStyles.bodyText),
                  const SizedBox(height: AppStyles.spacingXl),
                  // Especificaciones
                  Text(l10n.specifications, style: AppStyles.displaySubtitle),
                  const SizedBox(height: AppStyles.spacingMd),
                  ...controller.specifications.entries.map(
                    (spec) => SpecificationCard(
                      title: spec.key,
                      value: spec.value.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
