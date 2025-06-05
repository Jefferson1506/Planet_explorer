import 'package:flutter/material.dart';
import 'package:planet_explorer/src/core/responsive/responsive_builder.dart';

class CustomTextFormFilter extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSearchTap;
  final VoidCallback? onClearTap;
  final ValueChanged<String>? onChanged;
  final Icon? searchIcon;
  final Icon? clearIcon;
  final Color? borderColor;
  final Color? fillColor;
  final Color? cursorColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextInputType? typeTextInput;

  const CustomTextFormFilter({
    super.key,
    required this.controller,
    required this.hintText,
    this.onSearchTap,
    this.onClearTap,
    this.onChanged,
    this.searchIcon,
    this.clearIcon,
    this.borderColor,
    this.fillColor,
    this.textStyle,
    this.cursorColor,
    this.hintStyle,
    this.typeTextInput,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, responsive) {
        return TextField(
          keyboardType: typeTextInput ?? TextInputType.text,
          onChanged: onChanged,
          controller: controller,
          style:
              textStyle ??
              TextStyle(
                fontSize: responsive.isFontSize,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 9, 98, 76),
              ),
          cursorColor: cursorColor ?? const Color.fromARGB(255, 9, 98, 76),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: responsive.scaledHeight(0.015),
              horizontal: responsive.scaledWidth(0.03),
            ),
            hintStyle:
                hintStyle ??
                TextStyle(
                  fontSize: responsive.isFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
            hintText: hintText,
            filled: true,
            fillColor: fillColor ?? Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Colors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 0,
                children: [
                  if (onSearchTap != null)
                    IconButton(
                      icon:
                          searchIcon ??
                          const Icon(Icons.search, color: Colors.orange),
                      onPressed: onSearchTap,
                    ),
                  if (onClearTap != null)
                    IconButton(
                      icon:
                          clearIcon ??
                          const Icon(Icons.clear, color: Colors.red),
                      onPressed: onClearTap,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
