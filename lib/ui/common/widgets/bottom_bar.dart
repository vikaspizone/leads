import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leads/app/app.locator.dart';
import 'package:leads/app/app.router.dart';
import 'package:leads/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/views/home/home_viewmodel.dart';
import '../images.dart';

class BottomBar extends StackedView<HomeViewModel> {
  const BottomBar({Key? key}) : super(key: key);
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    NavigationService navigationService = locator<NavigationService>();
    return Container(
        height: screenDimension(context) / 21,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: screenDimension(context) * 0.0035),
          Row(children: [
            Expanded(
                // Home page
                child: InkWell(
                    radius: 0,
                    onTap: () {
                      viewModel.changeIndex(0);
                      navigationService.replaceWithHomeView();
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Images().home,
                              height: screenDimension(context) / 50,
                              width: screenDimension(context) / 50,
                              color: currentIndex == 0
                                  ? const Color.fromRGBO(171, 119, 17, 1)
                                  : const Color.fromRGBO(105, 97, 94, 1)),
                          Text("HOME",
                              style: TextStyle(
                                  fontSize: screenDimension(context) * 0.0070,
                                  height: screenDimension(context) * 0.0018,
                                  color: currentIndex == 0
                                      ? const Color.fromRGBO(171, 119, 17, 1)
                                      : const Color.fromRGBO(105, 97, 94, 1)))
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
                              height: screenDimension(context) / 50,
                              width: screenDimension(context) / 50,
                              color: currentIndex == 1
                                  ? const Color.fromRGBO(171, 119, 17, 1)
                                  : const Color.fromRGBO(105, 97, 94, 1)),
                          SizedBox(height: screenDimension(context) * 0.0018),
                          Text("USERS",
                              style: TextStyle(
                                  fontSize: screenDimension(context) * 0.0070,
                                  height: screenDimension(context) * 0.0018,
                                  color: currentIndex == 1
                                      ? const Color.fromRGBO(171, 119, 17, 1)
                                      : const Color.fromRGBO(105, 97, 94, 1)))
                        ]))),
            Expanded(
                // Leads page
                child: InkWell(
                    radius: 0,
                    onTap: () {
                      viewModel.changeIndex(2);
                      navigationService.navigateTo(Routes.leadsView);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Images().lead,
                              height: screenDimension(context) / 46,
                              width: screenDimension(context) / 46,
                              color: currentIndex == 2
                                  ? const Color.fromRGBO(171, 119, 17, 1)
                                  : const Color.fromRGBO(105, 97, 94, 1)),
                          Text("LEADS",
                              style: TextStyle(
                                  fontSize: screenDimension(context) * 0.0070,
                                  height: screenDimension(context) * 0.0018,
                                  color: currentIndex == 2
                                      ? const Color.fromRGBO(171, 119, 17, 1)
                                      : const Color.fromRGBO(105, 97, 94, 1)))
                        ]))),
            Expanded(
                // Call Records page
                child: InkWell(
                    radius: 0,
                    onTap: () {
                      viewModel.changeIndex(3);
                      navigationService.navigateTo(Routes.incomingCallView);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Images().call,
                              height: screenDimension(context) / 46,
                              width: screenDimension(context) / 46,
                              color: currentIndex == 3
                                  ? const Color.fromRGBO(171, 119, 17, 1)
                                  : const Color.fromRGBO(105, 97, 94, 1)),
                          Text("CALL RECORDS",
                              style: TextStyle(
                                  fontSize: screenDimension(context) * 0.0070,
                                  height: screenDimension(context) * 0.0018,
                                  color: currentIndex == 3
                                      ? const Color.fromRGBO(171, 119, 17, 1)
                                      : const Color.fromRGBO(105, 97, 94, 1)))
                        ]))),
            const Expanded(child: SizedBox())
          ])
        ]));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
