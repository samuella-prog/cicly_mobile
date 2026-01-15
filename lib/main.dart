import 'package:flutter/material.dart';
import 'data/database/local_database.dart'; // adapte si besoin

Future<void> main() async {
  // Required for secure storage and sqflite_sqlcipher
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the encrypted database
  await LocalDatabase.instance.database;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
