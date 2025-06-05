import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingHelper {
  static void configLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.black.withAlpha(200)
      ..indicatorColor = const Color.fromARGB(255, 254, 237, 83)
      ..textColor = Colors.white
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..maskColor = const Color.fromARGB(255, 50, 55, 120).withAlpha(85)
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..dismissOnTap = false
      ..displayDuration = const Duration(milliseconds: 2000);
  }

  static void show({String? message = 'Cargando...'}) {
    EasyLoading.show(status: message);
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message, duration: const Duration(seconds: 2));
  }

  static void showError(String message) {
    EasyLoading.showError(message, duration: const Duration(seconds: 3));
  }

  static void showInfo(String message) {
    EasyLoading.showInfo(message, duration: const Duration(seconds: 2));
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
