import 'package:flutter/material.dart';
import 'package:leads/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../home/home_view.dart';

class IncomingCallViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  ScrollController scrollController = ScrollController();
  //Go to back page
  void goBack() {
    currentIndex = 0;
    notifyListeners();
    _navigationService.clearStackAndShowView(const HomeView(pageIndex: 0));
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
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Received by : Ravi Kumar',
        personName: 'Unknown',
        visitTime: '2.00 PM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '20th Aug 2023',
        status: 'Received by : Ravi Kumar',
        personName: 'Koushik',
        visitTime: '2.00 AM'),
    CallRecordModel(
        callDuration: '10 m 54 s',
        visitDate: '12 August 2022',
        status: 'Unanswered',
        personName: 'Manoj Kumar Tiwary',
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
