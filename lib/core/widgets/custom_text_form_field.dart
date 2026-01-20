import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.isPassowrd = false,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassowrd;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isSecure;

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassowrd;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTextFormField(
      style: context.appTheme.regular14.copyWith(
        color: AppColors.black,
      ),
      obscureText: isSecure,

      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: widget.isPassowrd
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                child: isSecure
                    ? const Icon(
                        Icons.visibility_off,
                        color: Color(0xff617589),
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Color(0xff617589),
                      ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: context.appTheme.regular12.copyWith(
          color: const Color(0xff617589),
        ),
        errorStyle: context.appTheme.bold10.copyWith(
          color: AppColors.red,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildBorder(
          color: AppColors.red,
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.r),
      ),
      borderSide: BorderSide(
        color: color ?? const Color(0xffdbe0e6),
      ),
    );
  }
}
