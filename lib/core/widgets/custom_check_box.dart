import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import 'widgets.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.onChanged,
  });
  final ValueChanged<bool>? onChanged;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged?.call(isChecked);
        });
      },
      child: AnimatedContainer(
        width: 20.w,
        height: 24.h,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          shape: BoxShape.rectangle,
          color: isChecked ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: isChecked ? AppColors.primary : AppColors.grey,
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: AppColors.white,
              )
            : null,
      ),
    );
  }
}
