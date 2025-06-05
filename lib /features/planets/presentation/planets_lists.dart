import 'package:flutter/material.dart';

import '../../../core/responsive/responsive_builder.dart';

class PlanetsLists extends StatelessWidget {
  const PlanetsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveBuilder(
        builder: (context, view) {
          return Scaffold();
        },
      ),
    );
  }
}
