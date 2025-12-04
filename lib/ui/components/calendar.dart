import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/core/models/mentrual_cycle.dart';
import 'package:cicly/ui/components/calendar_legend_item.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

enum DayType { normal, period, pms, ovulation }

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
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
  }

  // Détermine le type de jour en fonction du cycle menstruel
  DayType _getDayType(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final ovulationDate = DateTime(
      widget.menstrualcycle.ovulationDate.year,
      widget.menstrualcycle.ovulationDate.month,
      widget.menstrualcycle.ovulationDate.day,
    );

    // Vérifier si c'est le jour d'ovulation
    if (dateOnly.isAtSameMomentAs(ovulationDate)) {
      return DayType.ovulation;
    }

    // Vérifier si c'est dans la période des règles
    if (_isDateInRange(
      dateOnly,
      widget.menstrualcycle.periodStartDate,
      widget.menstrualcycle.periodEndDate,
    )) {
      return DayType.period;
    }

    // Vérifier si c'est dans la période du SPM
    if (_isDateInRange(
      dateOnly,
      widget.menstrualcycle.pmsStartDate,
      widget.menstrualcycle.pmsEndDate,
    )) {
      return DayType.pms;
    }

    return DayType.normal;
  }

  bool _isDateInRange(DateTime date, DateTime start, DateTime end) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final startOnly = DateTime(start.year, start.month, start.day);
    final endOnly = DateTime(end.year, end.month, end.day);

    return (dateOnly.isAtSameMomentAs(startOnly) ||
            dateOnly.isAfter(startOnly)) &&
        (dateOnly.isAtSameMomentAs(endOnly) || dateOnly.isBefore(endOnly));
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return _isSameDay(date, now);
  }

  // Génère les jours du mois avec les jours vides au début
  List<DateTime?> _generateMonthDays() {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    );

    // Jour de la semaine du premier jour (0 = lundi, 6 = dimanche)
    final firstWeekday = (firstDayOfMonth.weekday - 1) % 7;

    final days = <DateTime?>[];

    // Ajouter les jours vides au début
    for (int i = 0; i < firstWeekday; i++) {
      days.add(null);
    }

    // Ajouter tous les jours du mois
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, day));
    }

    return days;
  }

  // Détermine si une date est au début d'une plage
  bool _isRangeStart(DateTime date, DayType dayType) {
    if (dayType == DayType.period) {
      return _isSameDay(date, widget.menstrualcycle.periodStartDate);
    }
    if (dayType == DayType.pms) {
      return _isSameDay(date, widget.menstrualcycle.pmsStartDate);
    }
    return false;
  }

  // Détermine si une date est à la fin d'une plage
  bool _isRangeEnd(DateTime date, DayType dayType) {
    if (dayType == DayType.period) {
      return _isSameDay(date, widget.menstrualcycle.periodEndDate);
    }
    if (dayType == DayType.pms) {
      return _isSameDay(date, widget.menstrualcycle.pmsEndDate);
    }
    return false;
  }

  // Détermine si une date est en début de semaine (lundi)
  bool _isStartOfWeek(DateTime date) {
    return date.weekday == 1;
  }

  // Détermine si une date est en fin de semaine (dimanche)
  bool _isEndOfWeek(DateTime date) {
    return date.weekday == 7;
  }

  Color _getDayColor(DateTime date, DayType dayType) {
    // La date du jour a la priorité
    if (_isToday(date)) {
      return CustomColorScheme().blue;
    }

    // Ensuite les couleurs du cycle
    switch (dayType) {
      case DayType.period:
        return CustomColorScheme().pink;
      case DayType.pms:
        return CustomColorScheme().orange;
      case DayType.ovulation:
        return CustomColorScheme().yellow;
      case DayType.normal:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateMonthDays();
    final daySize = 48.0;
    final spacing = 8.0;

    return Column(
      spacing: 8,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            color: CustomColorScheme().surface,
          ),
          child: Column(
            children: [
              // En-tête avec mois et année
              Padding(
                padding: EdgeInsets.all(spacing),
                child: Text(
                  _getMonthYearText(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),

              // Jours de la semaine
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'sim']
                      .map((day) {
                        return SizedBox(
                          width: daySize,
                          child: Center(
                            child: Text(
                              day,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        );
                      })
                      .toList(),
                ),
              ),

              // Grille des jours
              Padding(
                padding: EdgeInsets.all(spacing),
                child: Wrap(
                  children: days.map((date) {
                    if (date == null) {
                      return SizedBox(width: daySize, height: daySize);
                    }

                    final dayType = _getDayType(date);
                    final dayColor = _getDayColor(date, dayType);
                    final isSelected = _isSameDay(date, _selectedDate);

                    // Détermine les bordures arrondies selon la position dans la plage
                    BorderRadius? borderRadius;
                    if (dayType == DayType.period || dayType == DayType.pms) {
                      final isStart = _isRangeStart(date, dayType);
                      final isEnd = _isRangeEnd(date, dayType);
                      final isStartOfWeek = _isStartOfWeek(date);
                      final isEndOfWeek = _isEndOfWeek(date);

                      // Coins arrondis à gauche si début de plage ou début de semaine
                      final roundLeft = isStart || isStartOfWeek;
                      // Coins arrondis à droite si fin de plage ou fin de semaine
                      final roundRight = isEnd || isEndOfWeek;

                      if (roundLeft && roundRight) {
                        borderRadius = BorderRadius.circular(daySize / 2);
                      } else if (roundLeft) {
                        borderRadius = BorderRadius.only(
                          topLeft: Radius.circular(daySize / 2),
                          bottomLeft: Radius.circular(daySize / 2),
                        );
                      } else if (roundRight) {
                        borderRadius = BorderRadius.only(
                          topRight: Radius.circular(daySize / 2),
                          bottomRight: Radius.circular(daySize / 2),
                        );
                      } else {
                        borderRadius = BorderRadius.zero;
                      }
                    } else {
                      // Pour aujourd'hui et ovulation, garder le cercle
                      borderRadius = BorderRadius.circular(daySize / 2);
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                          widget.onDateSelected(date);
                        },
                        child: Container(
                          width: daySize,
                          height: daySize,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: dayColor,
                            borderRadius: borderRadius,
                            border: isSelected
                                ? Border.all(color: Colors.black, width: 3)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          spacing: 12,
          children: [
            CalendarLegendItem(
              iconColor: CustomColorScheme().orange,
              label: 'jour de règles',
              iconData: Icons.water_drop,
            ),
            CalendarLegendItem(
              iconColor: CustomColorScheme().pink,
              label: 'spm',
              iconData: Symbols.stress_management,
            ),
            CalendarLegendItem(
              iconColor: CustomColorScheme().yellow,
              label: 'ovulation',
              iconData: Symbols.fertile,
            ),
            CalendarLegendItem(
              iconColor: CustomColorScheme().blue,
              label: 'spm',
              iconData: Symbols.today,
            ),
          ],
        ),
      ],
    );
  }

  String _getMonthYearText() {
    const months = [
      'janvier',
      'février',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'août',
      'septembre',
      'octobre',
      'novembre',
      'décembre',
    ];
    return '${months[_currentMonth.month - 1]} ${_currentMonth.year}';
  }
}
