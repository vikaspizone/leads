import 'package:flutter/material.dart';
import 'package:leads/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LeadsViewModel extends FormViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  //Go to back page
  void goBack() {
    _navigationService.replaceWithHomeView();
  }

  List<FilterModel> filterCategoryList = [
    FilterModel(
        color: const Color.fromARGB(255, 225, 111, 34),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 247, 181, 137),
        textColor: const Color.fromARGB(255, 139, 61, 8),
        title: 'ALL'),
    FilterModel(
        color: const Color.fromARGB(255, 39, 148, 184),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 182, 237, 255),
        textColor: const Color.fromARGB(255, 11, 90, 116),
        title: 'PROSPECT'),
    FilterModel(
        color: const Color.fromARGB(255, 220, 174, 33),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 254, 224, 132),
        textColor: const Color.fromARGB(255, 133, 103, 12),
        title: 'WARM'),
    FilterModel(
        color: const Color.fromARGB(255, 191, 192, 53),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 245, 245, 118),
        textColor: const Color.fromARGB(255, 122, 123, 4),
        title: 'HOT'),
    FilterModel(
        color: const Color.fromARGB(255, 46, 178, 123),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 105, 247, 188),
        textColor: const Color.fromARGB(255, 0, 122, 71),
        title: 'NEGOTIATION'),
    FilterModel(
        color: const Color.fromARGB(255, 17, 120, 77),
        isSelected: false,
        selectedColor: const Color.fromARGB(255, 108, 218, 159),
        textColor: const Color.fromARGB(255, 3, 82, 48),
        title: 'SOLD'),
  ];
  List<LeadsModel> leadsList = [
    LeadsModel(
        backgroundColor: const Color.fromARGB(255, 182, 237, 255),
        borderColor: const Color.fromARGB(255, 39, 148, 184),
        companyName: 'XYZ Properties Ltd.',
        date: '11th Aug 2023',
        location: 'Swarnamani',
        clientVisitDate: '3th Aug 2023',
        visitDate: '4th Aug 2023',
        personName: 'Manoj Kumar Tiwari',
        status: 'Prospect'),
    LeadsModel(
        backgroundColor: const Color.fromARGB(255, 254, 224, 132),
        borderColor: const Color.fromARGB(255, 220, 174, 33),
        companyName: 'XYZ Properties Ltd.',
        date: '16th Aug 2023',
        location: 'Swarnamani',
        clientVisitDate: '17th Aug 2023',
        visitDate: '20th Aug 2023',
        personName: 'Sanoj Kumar Tiwari',
        status: 'Warm'),
    LeadsModel(
        backgroundColor: const Color.fromARGB(255, 108, 218, 159),
        borderColor: const Color.fromARGB(255, 17, 120, 77),
        companyName: 'XYZ Properties Ltd.',
        date: '12th Aug 2023',
        location: 'Swarnamani',
        clientVisitDate: '16th Aug 2023',
        visitDate: '29th Aug 2023',
        personName: 'Kaushik',
        status: 'Sold'),
  ];
  onFilterCategoryTap(int index) {
    filterCategoryList[index].isSelected =
        !filterCategoryList[index].isSelected;
    notifyListeners();
  }
}

class FilterModel {
  String title;
  Color color;
  Color selectedColor;
  Color textColor;
  bool isSelected;
  FilterModel(
      {required this.color,
      required this.isSelected,
      required this.selectedColor,
      required this.textColor,
      required this.title});
}

class LeadsModel {
  String personName;
  String companyName;
  String status;
  String location;
  String date;
  String? visitDate;
  String? clientVisitDate;

  Color backgroundColor;
  Color borderColor;
  LeadsModel({
    required this.backgroundColor,
    required this.borderColor,
    this.clientVisitDate,
    required this.date,
    required this.location,
    this.visitDate,
    required this.personName,
    required this.companyName,
    required this.status,
  });
}
