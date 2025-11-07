import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/navbar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class UserBottomNavigationBar extends CustomBottomNavigationBar {
  UserBottomNavigationBar({super.key, required super.onTap})
    : super(
        children: [
          BottomNavigationBarItem(
            icon: Icon(Symbols.cottage, fill: 1, fontWeight: FontWeight.w500),
            backgroundColor: CustomColorScheme().yellow,
            label: 'Accueil',
            tooltip: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.gynecology,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Symptômes',
            tooltip: 'Symptômes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.query_stats_rounded,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Rapports et stats',
            tooltip: 'Rapports et stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.thumbs_up_down,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Feedback',
            tooltip: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.newspaper, fill: 1, fontWeight: FontWeight.w500),
            label: 'Articles',
            tooltip: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.account_circle,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Profil',
            tooltip: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.settings_heart,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Paramètres',
            tooltip: 'Paramètres',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Symbols.bug_report,
              fill: 1,
              fontWeight: FontWeight.w500,
            ),
            label: 'Signaler un bug',
            tooltip: 'Signaler un bug',
          ),
        ],
      );
}
