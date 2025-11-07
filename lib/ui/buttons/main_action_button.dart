import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;

  const CustomActionButton({
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(6, 6), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          textStyle: Theme.of(context).textTheme.displayMedium,
          side: BorderSide(
            color: Colors.black,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon, size: 24), Text(text)],
        ),
      ),
    );
  }
}
