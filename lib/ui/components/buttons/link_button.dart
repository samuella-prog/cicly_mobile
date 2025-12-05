import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/business/services/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String route;

  const LinkButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //TODO: Implement navigation logic
        print('Navigate to $route');
      },
      child: Text(
        text,
        style: TextStyle(
          fontFamily: GoogleFonts.bagelFatOne().fontFamily,
          fontSize: 18,
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: CustomColorScheme().orange,
          decorationThickness: 3,
        ),
      ),
    );
  }
}
