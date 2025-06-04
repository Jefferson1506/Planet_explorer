import 'package:flutter/material.dart';

import '../../core/responsive/responsive_builder.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    required this.elevation,
  });

  factory CustomButton.primary({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      borderRadius: 12.0,
      elevation: 4.0,
    );
  }

  factory CustomButton.secondary({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      borderRadius: 8.0,
      elevation: 2.0,
    );
  }

  factory CustomButton.danger({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 16.0,
      elevation: 6.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        final colorScheme = Theme.of(context).colorScheme;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(label),
        );
      },
    );
  }
}
