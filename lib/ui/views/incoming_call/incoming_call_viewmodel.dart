import 'package:leads/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class IncomingCallViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  //Go to back page
  void goBack() {
    _navigationService.replaceWithHomeView();
  }

//Select Tab
  String selectedTab = 'All';
  void selectTab(name) {
    selectedTab = name;
    notifyListeners();
  }

  List<CallRecordModel> leadsList = [
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '4th Aug 2023',
        status: 'Received by : Ravi Kumar',
        personName: 'Manoj Kumar Tiwari',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '20th Aug 2023',
        status: 'Received by : Ravi Kumar',
        personName: 'Sanoj Kumar Tiwari',
        visitTime: '2.00 AM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '29th Aug 2023',
        status: 'Unanswered',
        personName: 'Kaushik',
        visitTime: '1.00 PM'),
  ];
}

class CallRecordModel {
  String personName;
  String visitTime;
  String visitDate;
  String status;
  String callDuration;

  CallRecordModel({
    required this.callDuration,
    required this.visitDate,
    required this.status,
    required this.personName,
    required this.visitTime,
  });
}
