import 'package:stacked/stacked.dart';

class IncomingCallViewModel extends BaseViewModel {
//Select Tab
  String selectedTab = 'All';
  void selectTab(name) {
    selectedTab = name;
    notifyListeners();
  }
}
