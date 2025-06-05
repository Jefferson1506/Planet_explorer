import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResponsiveSign {
  final BuildContext context;

  ResponsiveSign(this.context);

  MediaQueryData get _mediaQuery => MediaQuery.of(context);
  double get width => _mediaQuery.size.width;
  double get height => _mediaQuery.size.height;
  Orientation get orientation => _mediaQuery.orientation;
  double get pixelRatio => _mediaQuery.devicePixelRatio;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024 && width < 1440;
  bool get isLargeDesktop => width >= 1440;

  double wp(double percent) => width * percent;
  double hp(double percent) => height * percent;

  double scale(double size) {
    double scaleFactor;

    if (width >= 1920) {
      scaleFactor = (width / 1920) * 1.2;
    } else if (width >= 1024) {
      scaleFactor = (width / 1920) * 1.1;
    } else if (width >= 768) {
      scaleFactor = (width / 1024) * 1.05;
    } else {
      scaleFactor = (width / 375) * 0.9;
    }

    scaleFactor = scaleFactor.clamp(0.8, 1.4);
    return math.max(
      size * scaleFactor,
      pixelRatio > 2 ? pixelRatio * 0.75 : 8.0,
    );
  }
}
