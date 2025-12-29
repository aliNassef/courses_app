import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.grey.withValues(
          alpha: 0.2,
        ),
        trackHeight: 8.h,
        trackShape: const RoundedRectSliderTrackShape(),
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(value: 0.4, onChanged: (value) {}),
    );
  }
}
