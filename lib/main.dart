import 'package:cicly/business/viewsmodels/demo_viewsmodel.dart';
import 'package:cicly/ui/screens/demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => DemoViewsmodel(),
    child: MaterialApp(
      title: 'MVVM Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const DemoScreen(),
    ),
    );
  }
}
