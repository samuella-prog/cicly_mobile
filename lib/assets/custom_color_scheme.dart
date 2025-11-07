import 'package:flutter/material.dart';

class CustomColorScheme extends ColorScheme {
  final Color pink;
  final Color blue;
  final Color yellow;
  final Color orange;
  final Color grey;
  final Color success;

  CustomColorScheme({
    this.pink = const Color(0xffFDBFD5),
    this.blue = const Color(0xffA3CACB),
    this.yellow = const Color(0XFFFFCC00),
    this.orange = const Color(0xffFFA030),
    this.success = const Color(0xff30C874),
    this.grey = const Color(0xff575D66),
  }) : super(
         brightness: Brightness.light,
         primary: Color(0xff000000),
         onPrimary: Colors.black,
         secondary: Color(0xffFDBFD5),
         onSecondary: Colors.black,
         tertiary: Color(0xffA3CACB),
         onTertiary: Colors.black,
         error: Color(0xffFFD3D3),
         onError: Color(0xffDB3232),
         errorContainer: Color(0xffFFD3D3),
         surface: Color(0xFFFFF1E7),
         onSurface: Colors.black,
       );
}
