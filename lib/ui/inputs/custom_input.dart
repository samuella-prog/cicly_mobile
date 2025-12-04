import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Widget child;
  final String labelText;
  final IconData icon;

  const CustomInput({
    super.key,
    required this.child,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
        maxHeight: 80,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  labelText,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 4,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(6, 6),
                ),
              ],
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
