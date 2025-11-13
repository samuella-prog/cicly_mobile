import 'package:cicly/business/viewsmodels/demo_viewsmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DemoViewsmodel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Demo MVVM')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (viewModel.isLoading)
            const CircularProgressIndicator()
            else 
            Text(
              viewModel.message,
              style: const TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.isLoading
              ? null 
              : () => viewModel.loadDemoMessage(), 
            child: const Text('Charger le message'),
            ),
          ],
        ),
      ),
    );

  }
}