import 'package:flutter/material.dart';

import 'responsive_info.dart';
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
