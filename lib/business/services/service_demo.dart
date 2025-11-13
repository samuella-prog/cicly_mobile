class ServiceDemo{
  Future <String> fetchDemoData() async {
    await Future.delayed(const Duration(seconds: 1)) ; 
    return 'MVVM Opérationnel' ;
  }
}