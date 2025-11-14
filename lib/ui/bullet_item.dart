import 'package:flutter/material.dart';

class BulletItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String title;
  final Color color;

  const BulletItem({
    super.key,
    required this.text,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(
            '$title: ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: color,
              decorationThickness: 3,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
