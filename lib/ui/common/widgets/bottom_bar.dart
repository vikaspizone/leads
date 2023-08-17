import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leads/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../images.dart';

int currentIndex = 0;

class BottomBar extends StatelessWidget {
  final int currentIndex;
  BottomBar({this.currentIndex = 0, super.key});
  final NavigationService _navigationService = locator<NavigationService>();

  bool isItAlreadyOnTab(index, currentIndex, tabIndex) {
    return index == tabIndex && currentIndex != tabIndex;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
        height: 57,
        child: Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                height: 47,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(children: [
                  bottomItem("Home"),
                  bottomItem("Users"),
                  bottomItem("Leads"),
                  bottomItem("Call Records"),
                  const Expanded(child: SizedBox())
                ]))
          ]),
          floatingActionButton()
        ]));
  }

  Align floatingActionButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 20),
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28), color: Colors.white),
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
                  ]))),
    );
  }

  bottomItem(name) {
    return Expanded(
      child: InkWell(
          onTap: () {},
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
                name == "Call Records"
                    ? Images().call
                    : name == "Users"
                        ? Images().user
                        : name == "Leads"
                            ? Images().lead
                            : Images().home,
                height: name == "Users" ? 23 : 25,
                width: name == "Users" ? 23 : 25),
            if (name == "Users") const SizedBox(height: 3),
            Text(name,
                style: const TextStyle(
                    fontSize: 7, color: Color.fromRGBO(105, 97, 94, 1)))
          ])),
    );
  }
}
