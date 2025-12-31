import 'package:courses_app/core/utils/app_dilagos.dart';
import 'package:flutter/material.dart';

extension Dialogs on BuildContext {
  void showLoadingDialog() {
    AppDilagos.showLoadingBox(this);
  }

  void showErrorMessage({required String message}) {
    AppDilagos.showErrorMessage(this, errMessage: message);
  }

  void showToast({required String message}) {
    AppDilagos.showToast(text: message);
  }
}
