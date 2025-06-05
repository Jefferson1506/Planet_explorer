import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/responsive/responsive_builder.dart';

class PlanetsLists extends ConsumerWidget {
  const PlanetsLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(body: Container());
      },
    );
  }
}
