import 'package:cicly/ui/cards/card_base.dart';
import 'package:cicly/ui/inputs/select_input.dart';
import 'package:flutter/material.dart';

class CardWithSelect extends StatelessWidget {
  final String title;
  final String description;
  final void Function(dynamic) onSelectValueChanged;
  final List<DropdownMenuEntry> items;
  final IconData icon;
  final String labelText;
  final dynamic value;

  const CardWithSelect({
    super.key,
    required this.title,
    required this.description,
    required this.onSelectValueChanged,
    required this.items,
    required this.icon,
    required this.labelText,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return CardBase(
      title: title,
      description: description,
      child: SelectInput(
        items: items,
        onChanged: (value) => onSelectValueChanged(value),
        icon: icon,
        labelText: labelText,
        hint: 'Sélectionner une option',
        value: value,
      ),
    );
  }
}
