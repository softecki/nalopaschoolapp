import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon; // Optional icon

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColor.primaryColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.icon, // Default is null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: textColor),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
