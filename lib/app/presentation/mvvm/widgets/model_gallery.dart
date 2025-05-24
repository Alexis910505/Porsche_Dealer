import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/styles/app_styles.dart';

class ModelGallery extends StatelessWidget {
  final List<String> images;
  final double height;

  const ModelGallery({super.key, required this.images, required this.height});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enableInfiniteScroll: images.length > 1,
        autoPlay: images.length > 1,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: AppStyles.animationCurve,
      ),
      items:
          images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppStyles.cardBackground),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                          color: AppStyles.accentColor,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: AppStyles.errorColor,
                              size: 48,
                            ),
                            const SizedBox(height: AppStyles.spacingSm),
                            Text(
                              'Error loading image',
                              style: AppStyles.captionText.copyWith(
                                color: AppStyles.errorColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
