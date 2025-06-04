import 'package:flutter/material.dart';

import 'responsive_sing.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ResponsiveInfo info) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveSign(context);
    final info = ResponsiveInfo(responsive);
    return builder(context, info);
  }
}

class ResponsiveInfo {
  final ResponsiveSign responsive;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  ResponsiveInfo(this.responsive)
    : isMobile = responsive.isMobile,
      isTablet = responsive.isTablet,
      isDesktop = responsive.isDesktop || responsive.isLargeDesktop;

  T value<T>({T? mobile, T? tablet, T? desktop}) {
    if (isMobile && mobile != null) return mobile;
    if (isTablet && tablet != null) return tablet;
    if (isDesktop && desktop != null) return desktop;

    // Fallback seguro
    final fallback = mobile ?? tablet ?? desktop;
    if (fallback == null) {
      throw Exception("Error en clase Info");
    }
    return fallback;
  }

  double get isWidth => value(
    mobile: responsive.wp(0.6),
    tablet: responsive.wp(0.4),
    desktop: responsive.wp(0.3),
  );

  double get isHeight => value(
    mobile: responsive.hp(0.3),
    tablet: responsive.hp(0.25),
    desktop: responsive.hp(0.2),
  );

  double get isFontSize => value(mobile: 16.0, tablet: 18.0, desktop: 20.0);

  double scaledWidth([double factor = 1.0]) => isWidth * factor;
  double scaledHeight([double factor = 1.0]) => isHeight * factor;
  double scaledFont([double factor = 1.0]) => isFontSize * factor;
}
