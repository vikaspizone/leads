import 'package:flutter/material.dart';
import 'package:leads/ui/views/home/pie_chart.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'home_view.dart';

int currentIndex = 0;

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  ScrollController scrollController = ScrollController();
  //Go to back page
  void goBack() {
    currentIndex = 0;
    notifyListeners();
    _navigationService.back();
    _navigationService.navigateWithTransition(const HomeView(pageIndex: 0),
        duration: Duration.zero);
  }

  List<GridItem> gridDetail = [
    GridItem(
        gridCol: const Color(0xffDDF7FF),
        text: 'PROSPECT',
        val: '15',
        valCol: const Color(0xff2794B8)),
    GridItem(
        gridCol: const Color(0xffD8FFBA),
        text: 'NEGOTIATION',
        val: '5',
        valCol: const Color(0xff42A928)),
    GridItem(
        gridCol: const Color(0xffFEEFC4),
        text: 'WARM',
        val: '10',
        valCol: const Color(0xffB78D0E)),
    GridItem(
        gridCol: const Color(0xff9CFFCA),
        text: 'SOLD',
        val: '35',
        valCol: const Color(0xff19884C)),
    GridItem(
        gridCol: const Color(0xffFFFFD3),
        text: 'HOT',
        val: '21',
        valCol: const Color(0xffA0A10D)),
    GridItem(
        gridCol: const Color(0xffFFE9E9),
        text: 'LOST',
        val: '3',
        valCol: const Color(0xffD25151))
  ];

//change bottom bar index
  changeIndex(tabindex) {
    currentIndex = tabindex;
    notifyListeners();
  }
}
