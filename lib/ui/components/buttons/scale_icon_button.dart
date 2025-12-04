import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class ScaleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  const ScaleIconButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: CustomColorScheme().surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black, size: 32, fill: 1),
          const SizedBox(height: 4),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
