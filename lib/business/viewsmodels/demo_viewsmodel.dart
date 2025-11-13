import 'package:cicly/business/services/service_demo.dart';
import 'package:flutter/material.dart';

class DemoViewsmodel extends ChangeNotifier {
  final ServiceDemo _service = ServiceDemo();

  String _message = 'Chargement...'; 
  String get message => _message ;

  bool _isLoading = false ;
  bool get isLoading => _isLoading;

  Future <void> loadDemoMessage() async {
    _isLoading = true;
    notifyListeners();

    _message = await _service.fetchDemoData(); 


    _isLoading = false;
    notifyListeners();
  }
}