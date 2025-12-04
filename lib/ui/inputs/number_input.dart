import 'package:cicly/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final void Function(String)? onChanged;

  const NumberInput({
    super.key,
    required this.labelText,
    required this.controller,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      labelText: labelText,
      icon: icon,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ ne peut pas être vide';
          }
          if (double.tryParse(value) == null) {
            return 'Veuillez entrer un nombre valide';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: const InputDecoration(hint: Text('Enter a number')),
      ),
    );
  }
}
