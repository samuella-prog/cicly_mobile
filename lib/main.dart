import 'package:cicly/ui/buttons/blue_action_button.dart';
import 'package:cicly/ui/navbar/anon_bottom_navigation_bar.dart';
import 'package:cicly/ui/navbar/custom_bottom_navigation_bar.dart';
import 'package:cicly/ui/buttons/pink_action_button.dart';
import 'package:cicly/ui/navbar/user_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assets/custom_color_scheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColorScheme().surface,
        colorScheme: CustomColorScheme(),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.bagelFatOne(
            fontSize: 32,
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.bagelFatOne(
            fontSize: 24,
            color: Colors.black,
          ),
          headlineSmall: GoogleFonts.bagelFatOne(
            fontSize: 20,
            color: Colors.black,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          // button text style in typography scheme
          displayMedium: GoogleFonts.bagelFatOne(
            fontSize: 18,
            color: Colors.black,
          ),
          labelLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          //placeholder in typography scheme
          labelMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: CustomColorScheme().grey,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: UserBottomNavigationBar(
          onTap: (index) => {
            switch (index) {
              0 => print('Accueil tapped'),
              1 => print('A propos tapped'),
              2 => print('Conditions d\'utilisation tapped'),
              3 => print('Site web tapped'),
              4 => print('Paramètres tapped'),
              5 => print('Signaler un bug tapped'),
              _ => print('Unknown tapped'),
            },
          },
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              PinkActionButton(
                text: 'Custom Button',
                onPressed: () => {print('pink Button Pressed')},
                icon: Icons.add,
              ),
              BlueActionButton(
                text: 'Custom Button',
                onPressed: () => {print('blue Button Pressed')},
                icon: Icons.add,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
