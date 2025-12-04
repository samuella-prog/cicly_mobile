import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstVisitFormView extends StatelessWidget {
  const FirstVisitFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Visit Form')),
      body: const Center(child: Text('This is the First Visit Form View')),
    );
  }
}
