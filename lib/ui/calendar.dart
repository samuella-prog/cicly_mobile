import 'package:cicly/core/models/mentrual_cycle.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final DateTime initialDate;
  final void Function(DateTime) onDateSelected;
  final Menstrualcycle menstrualcycle;

  const Calendar({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    required this.menstrualcycle,
  });

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: _selectedDate,
      firstDate: DateTime(_selectedDate.year, _selectedDate.month, 1),
      lastDate: // last day of the month of the initial date
      DateTime(
        _selectedDate.year,
        _selectedDate.month + 1,
        0,
      ),
      onDateChanged: (newDate) {
        setState(() {
          _selectedDate = newDate;
        });
        widget.onDateSelected(newDate);
      },
    );
  }
}
