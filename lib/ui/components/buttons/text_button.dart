import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColorScheme().surface,
        iconColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        side: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 3,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 24),
          if (icon != null) const SizedBox(width: 4),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
