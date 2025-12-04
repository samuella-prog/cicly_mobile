import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<BottomNavigationBarItem> children;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.children,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black, width: 3.0)),
      ),
      child: BottomNavigationBar(
        items: children,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: onTap,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
