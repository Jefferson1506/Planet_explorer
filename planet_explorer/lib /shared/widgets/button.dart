import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double borderRadius;
  final double elevation;
  final Color? backgroundColor;
  final Color? textColor;
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
    this.sizeHeight,
    this.sizeWidth,
  });

  factory CustomButton.theme({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    double? sizeHeight,
    double? sizeWidth,
    Color? textColor,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      sizeHeight: sizeHeight,
      sizeWidth: sizeWidth,
    );
  }

  factory CustomButton.gold({
    required String label,
    required VoidCallback onPressed,
    double? sizeHeight,
    double? sizeWidth,
    Color? textColor,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 230, 211, 0),
      textColor: Colors.black,
      borderRadius: 12.0,
      elevation: 9.0,
      sizeHeight: sizeHeight,
      sizeWidth: sizeWidth,
    );
  }

  factory CustomButton.cyanGreen({
    required String label,
    required VoidCallback onPressed,
    double? sizeHeight,
    double? sizeWidth,
    Color? textColor,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 0, 156, 107),
      textColor: Colors.black,
      borderRadius: 14.0,
      elevation: 5.0,
      sizeHeight: sizeHeight,
      sizeWidth: sizeWidth,
    );
  }

  factory CustomButton.danger({
    required String label,
    required VoidCallback onPressed,
    double? sizeHeight,
    double? sizeWidth,
    Color? textColor,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 155, 46, 24),
      textColor: Colors.white,
      borderRadius: 16.0,
      elevation: 6.0,
      sizeHeight: sizeHeight,
      sizeWidth: sizeWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, view) {
        final colorScheme = Theme.of(context).colorScheme;
        return SizedBox(
          height: view.scaledHeight(sizeHeight ?? 0.12),
          width: view.scaledWidth(sizeWidth ?? 1.2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? colorScheme.primary,
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
                color: textColor ?? colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
