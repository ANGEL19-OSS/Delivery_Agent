import 'package:flutter/material.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_strings.dart';
import '../utils/constants/app_text_styles.dart';

class LocatingCard extends StatelessWidget {
  final String message;
  const LocatingCard({
    super.key,
    this.message = AppStrings.verifyingLocality,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.primary,
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 36,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.locatingAgent,
              style: AppTextStyles.h4,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyGrey,
            ),
          ],
        ),
      ),
    );
  }
}
