import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/navbar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AnonBottomNavigationBar extends CustomBottomNavigationBar {
  AnonBottomNavigationBar({super.key, required super.onTap})
    : super(
        children: [
          BottomNavigationBarItem(
            icon: Icon(Symbols.cottage, fill: 1),
            backgroundColor: CustomColorScheme().yellow,
            label: 'Accueil',
            tooltip: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.data_loss_prevention, fill: 1),
            label: 'A propos',
            tooltip: 'A propos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.contract, fill: 1),
            label: 'Conditions d\'utilisation',
            tooltip: 'Conditions d\'utilisation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.captive_portal, fill: 1),
            label: 'Site web',
            tooltip: 'Site web',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.settings_heart, fill: 1),
            label: 'Paramètres',
            tooltip: 'Paramètres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.bug_report, fill: 1),
            label: 'Signaler un bug',
            tooltip: 'Signaler un bug',
          ),
        ],
      );
}
