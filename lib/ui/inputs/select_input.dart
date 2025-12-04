import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class SelectInput extends StatelessWidget {
  final List<DropdownMenuEntry<dynamic>> items;
  final void Function(dynamic)? onChanged;
  final String labelText;
  final IconData icon;
  final String hint;
  final dynamic value;

  const SelectInput({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hint,
    required this.labelText,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      labelText: labelText,
      icon: icon,
      child: Container(
        color: CustomColorScheme().surface,
        width: MediaQuery.of(context).size.width,
        child: Theme(
          data: Theme.of(context).copyWith(
            dropdownMenuTheme: DropdownMenuThemeData(
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          child: DropdownMenu(
            hintText: hint,
            width: MediaQuery.of(context).size.width * 0.8,
            onSelected: onChanged,
            dropdownMenuEntries: items,
          ),
        ),
      ),
    );
  }
}
