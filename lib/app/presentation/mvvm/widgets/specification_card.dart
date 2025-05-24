import 'package:flutter/material.dart';
import '../../../core/styles/app_styles.dart';

class SpecificationCard extends StatelessWidget {
  final String title;
  final String value;

  const SpecificationCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppStyles.spacingMd),
      padding: const EdgeInsets.all(AppStyles.spacingMd),
      decoration: BoxDecoration(
        color: AppStyles.cardBackground,
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusMd),
        border: Border.all(color: AppStyles.dividerColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: AppStyles.bodyText)),
          Text(
            value,
            style: AppStyles.bodyText.copyWith(
              fontWeight: FontWeight.w600,
              color: AppStyles.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
