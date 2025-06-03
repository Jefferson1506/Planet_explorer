import 'package:flutter/material.dart';

import 'responsive_sing.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ResponsiveSign responsive)
  builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveSign(context);
    return builder(context, responsive);
  }
}
