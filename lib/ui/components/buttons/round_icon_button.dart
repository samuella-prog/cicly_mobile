import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.iconColor = Colors.black,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(size * 0.2),
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: iconColor, size: size * 0.5),
      ),
    );
  }
}
