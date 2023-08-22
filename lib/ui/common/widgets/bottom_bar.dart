import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leads/app/app.locator.dart';
import 'package:leads/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/views/home/home_viewmodel.dart';
import '../images.dart';

class BottomBar extends StackedView<HomeViewModel> {
  const BottomBar({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    NavigationService _navigationService = locator<NavigationService>();
    return Container(
        color: Colors.white,
        height: 58,
        child: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Row(children: [
                    Expanded(
                        // Home page
                        child: InkWell(
                            radius: 0,
                            onTap: () {
                              viewModel.changeIndex(0);
                              _navigationService.clearStackAndShowView(
                                 const HomeView(pageIndex: 0));
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images().home,
                                      height: 25,
                                      width: 25,
                                      color: currentIndex == 0
                                          ? const Color.fromRGBO(
                                              171, 119, 17, 1)
                                          : const Color.fromRGBO(
                                              105, 97, 94, 1)),
                                  Text("HOME",
                                      style: TextStyle(
                                          fontSize: 8,
                                          height: 2,
                                          color: currentIndex == 0
                                              ? const Color.fromRGBO(
                                                  171, 119, 17, 1)
                                              : const Color.fromRGBO(
                                                  105, 97, 94, 1)))
                                ]))),
                    Expanded(
                        // Users Page
                        child: InkWell(
                            radius: 0,
                            onTap: () {
                              viewModel.changeIndex(1);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images().user,
                                      height: 23,
                                      width: 23,
                                      color: currentIndex == 1
                                          ? const Color.fromRGBO(
                                              171, 119, 17, 1)
                                          : const Color.fromRGBO(
                                              105, 97, 94, 1)),
                                  const SizedBox(height: 2),
                                  Text("USERS",
                                      style: TextStyle(
                                          fontSize: 8,
                                          height: 2,
                                          color: currentIndex == 1
                                              ? const Color.fromRGBO(
                                                  171, 119, 17, 1)
                                              : const Color.fromRGBO(
                                                  105, 97, 94, 1)))
                                ]))),
                    Expanded(
                        // Leads page
                        child: InkWell(
                            radius: 0,
                            onTap: () {
                              viewModel.changeIndex(2);
                              _navigationService.clearStackAndShowView(
                                 const HomeView(pageIndex: 2));
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images().lead,
                                      height: 25,
                                      width: 25,
                                      color: currentIndex == 2
                                          ? const Color.fromRGBO(
                                              171, 119, 17, 1)
                                          : const Color.fromRGBO(
                                              105, 97, 94, 1)),
                                  Text("LEADS",
                                      style: TextStyle(
                                          fontSize: 8,
                                          height: 2,
                                          color: currentIndex == 2
                                              ? const Color.fromRGBO(
                                                  171, 119, 17, 1)
                                              : const Color.fromRGBO(
                                                  105, 97, 94, 1)))
                                ]))),
                    Expanded(
                        // Call Records page
                        child: InkWell(
                            radius: 0,
                            onTap: () {
                              viewModel.changeIndex(3);
                              _navigationService.clearStackAndShowView(
                                 const HomeView(pageIndex: 3));
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images().call,
                                      height: 25,
                                      width: 25,
                                      color: currentIndex == 3
                                          ? const Color.fromRGBO(
                                              171, 119, 17, 1)
                                          : const Color.fromRGBO(
                                              105, 97, 94, 1)),
                                  Text("CALL RECORDS",
                                      style: TextStyle(
                                          fontSize: 8,
                                          height: 2,
                                          color: currentIndex == 3
                                              ? const Color.fromRGBO(
                                                  171, 119, 17, 1)
                                              : const Color.fromRGBO(
                                                  105, 97, 94, 1)))
                                ]))),
                    const Expanded(child: SizedBox())
                  ]))
            ]),
          ],
        ));
  }

///////////////////////////////////////////////////////////////// gradient floating action button////////////////////////////////////////////////////////////////////
  Align floatingActionButton() {
    return Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20),
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(235, 91, 9, 1),
                                    Color.fromRGBO(151, 52, 1, 1)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.30),
                                    blurRadius: 4,
                                    offset: Offset(0, 4))
                              ]),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.add,
                              size: 28, color: Colors.white))
                    ]))));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
