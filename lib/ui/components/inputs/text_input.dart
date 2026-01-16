import 'package:cicly/ui/components/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final void Function(String)? onChanged;

  const TextInput({
    super.key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      labelText: labelText,
      icon: icon,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ ne peut pas être vide';
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(hint: Text(hintText)),
      ),
    );
  }
}
