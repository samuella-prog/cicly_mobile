import 'package:flutter/material.dart';

class CalendarLegendItem extends StatelessWidget {
  final Color iconColor;
  final String label;
  final IconData iconData;

  const CalendarLegendItem({
    super.key,
    required this.iconColor,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: iconColor, size: 20, fill: 1),
          const SizedBox(width: 8),
          SizedBox(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
