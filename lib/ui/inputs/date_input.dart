import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;
  final String labelText;
  final IconData icon;

  const DateInput({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Implementation of the date input widget goes here
    return CustomInput(
      labelText: labelText,
      icon: icon,
      child: Container(
        decoration: BoxDecoration(color: CustomColorScheme().surface),
        constraints: const BoxConstraints(maxHeight: 40),
        child: InputDatePickerFormField(
          fieldHintText: 'MM/DD/YYYY',
          fieldLabelText: 'MMMM',
          keyboardType: TextInputType.datetime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: selectedDate,
          onDateSubmitted: onDateSelected,
          acceptEmptyDate: true,
          errorInvalidText: 'Format de date invalide',
          errorFormatText: 'Veuillez entrer une date au format MM/JJ/AAAA',
        ),
      ),
    ); // Placeholder
  }
}
