import 'package:cicly/business/services/router.dart';
import 'package:cicly/ui/bullet_item.dart';
import 'package:cicly/ui/buttons/blue_action_button.dart';
import 'package:cicly/ui/buttons/link_button.dart';
import 'package:cicly/ui/buttons/round_icon_button.dart';
import 'package:cicly/ui/buttons/scale_icon_button.dart';
import 'package:cicly/ui/buttons/switch_button.dart';
import 'package:cicly/ui/buttons/text_button.dart';
import 'package:cicly/ui/inputs/date_input.dart';
import 'package:cicly/ui/inputs/select_input.dart';
import 'package:cicly/ui/inputs/text_input.dart';
import 'package:cicly/ui/buttons/pink_action_button.dart';
import 'package:cicly/ui/mood_scale.dart';
import 'package:cicly/ui/navbar/user_bottom_navigation_bar.dart';
import 'package:cicly/ui/pain_scale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'assets/custom_color_scheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic selectedValue;
    bool switchValue = false;
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
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          labelStyle: TextStyle(height: 0, fontSize: 0),
          hintStyle: Theme.of(context).textTheme.labelMedium,
          constraints: BoxConstraints(maxHeight: 40),
          filled: true,
          fillColor: CustomColorScheme().surface,
          errorStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: CustomColorScheme().error),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 8.0,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16.0,
              children: [
                TextInput(
                  controller: TextEditingController(),
                  hintText: 'Enter text here',
                  icon: Icons.text_fields,
                  onChanged: (value) => print('Text changed: $value'),
                  labelText: 'Custom Text Input',
                ),
                DateInput(
                  selectedDate: DateTime.now(),
                  onDateSelected: (value) => {},
                  labelText: 'Pick a date',
                  icon: Icons.lock_clock,
                ),
                LinkButton(
                  text: 'Rejoignez-nous !',
                  route: '/first-visit-form',
                ),
                SelectInput(
                  labelText: 'Custom Select Input',
                  icon: Icons.arrow_drop_down_circle,
                  onChanged: (value) => {
                    print('Selected value: $value'),
                    selectedValue = value,
                    print('Updated selectedValue: $selectedValue'),
                  },
                  hint: 'Select an option',
                  value: null,
                  items: [
                    DropdownMenuEntry(value: 'option 1', label: 'Option 1'),
                    DropdownMenuEntry(value: 'option 2', label: 'Option 2'),
                  ],
                ),
                SwitchButton(
                  value: switchValue,
                  onChanged: (newValue) => {
                    switchValue = newValue,
                    print('Switch value: $switchValue'),
                  },
                ),
                ScaleIconButton(
                  onPressed: () => {print('ScaleIconButton Pressed')},
                  text: '0-4',
                  icon: Symbols.sentiment_satisfied,
                ),
                PainScale(
                  onScaleSelected: (int scale) {
                    print('Selected pain scale: $scale');
                  },
                ),
                BulletItem(
                  text:
                      'bullet item description. This is an example of a bullet item in Flutter.',
                  icon: Icons.check,
                  title: 'Bullet Title',
                  color: CustomColorScheme().orange,
                ),
                RoundIconButton(
                  icon: Icons.check_circle,
                  backgroundColor: CustomColorScheme().pink,
                  size: 100,
                  onPressed: () => {print('RoundIconButton Pressed')},
                ),
                CustomTextButton(
                  text: 'Custom Text Button',
                  icon: Icons.bolt,
                  onPressed: () => {print('TextButton Pressed')},
                ),
                MoodScale(
                  onMoodSelected: (mood) => {print('Selected mood: $mood')},
                ),
                Row(
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
                Row(
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
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
