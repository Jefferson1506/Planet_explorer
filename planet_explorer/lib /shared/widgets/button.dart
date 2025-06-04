import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double elevation;
  final double? sizeHeight;
  final double? sizeWidth;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12.0,
    this.elevation = 4.0,
    this.sizeHeight = 0.1,
    this.sizeWidth = 1.3,
  });

  factory CustomButton.theme({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    double? sizeHeight,
    double? sizeWidth,
    Color? textColor,
  }) {
    final theme = Theme.of(context);
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: theme.colorScheme.primary,
      textColor: theme.colorScheme.onPrimary,
      sizeHeight: sizeHeight,
      sizeWidth: sizeWidth,
    );
  }

  factory CustomButton.gold({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 230, 211, 0),
      textColor: Colors.black,
      borderRadius: 14.0,
      elevation: 5.0,
    );
  }

  factory CustomButton.cyanGreen({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 0, 156, 107),
      textColor: Colors.black,
    );
  }

  factory CustomButton.danger({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 155, 46, 24),
      textColor: Colors.white,
      borderRadius: 16.0,
      elevation: 6.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBackground =
        backgroundColor ?? Theme.of(context).colorScheme.primary;
    final effectiveTextColor =
        textColor ?? Theme.of(context).colorScheme.onPrimary;

    return ResponsiveBuilder(
      builder: (context, view) {
        return SizedBox(
          height: view.scaledHeight(sizeHeight!),
          width: view.scaledWidth(sizeWidth!),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: effectiveBackground,
              foregroundColor: effectiveTextColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                fontSize: view.isFontSize,
                color: effectiveTextColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
