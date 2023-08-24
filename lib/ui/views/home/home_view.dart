import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:leads/ui/common/widgets/floating_action_button.dart';

import '/ui/common/widgets/bottom_bar.dart';
import '/ui/views/home/graph.dart';
import '/ui/views/home/pie_chart.dart';
import 'package:stacked/stacked.dart';
import '/ui/common/app_strings.dart';
import '/ui/common/images.dart';
import '/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var topPadding = MediaQuery.of(context).viewPadding.top;
    var sizer = screenDimension(context);
    var spacer = SizedBox(height: sizer / 81);
    print(sizer / 81);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BottomAppBar(child: BottomBar()),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: const CustomFloatingActionButton(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Images().backgroundImage),
                    fit: BoxFit.fill)),
            child: Column(children: [
              SizedBox(height: topPadding - 10),
              renderCustomAppBar(),
              Expanded(
                  child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    //Render Line Graph
                    const Graph(),
                    spacer,
                    //Render Pie Chart
                    renderCard(
                        buttonTitle: viewAll,
                        leadsName: 'LEADS BY STAGES',
                        child: FlipCard(
                            direction: FlipDirection.HORIZONTAL,
                            flipOnTouch: true,
                            speed: 1000,
                            front: const PieChartPage(),
                            back: BackSide(gridDetail: viewModel.gridDetail))),
                    spacer,
                    //Users card
                    renderCard(
                        buttonTitle: viewAll,
                        leadsName: users.toUpperCase(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                renderCircleWithText(screenDimension(context),
                                    circleBgColor: const Color.fromARGB(
                                        255, 219, 255, 231),
                                    text: '8',
                                    textColor:
                                        const Color.fromARGB(255, 6, 95, 36)),
                                horizontalSpaceTiny,
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                        text: 'DST',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 105, 97, 94),
                                            fontFamily: 'Nexa-Bold',
                                            fontSize: 13),
                                        children: [
                                          TextSpan(
                                              text: "\n$users",
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  height: 1,
                                                  fontFamily: 'Nexa-Bold',
                                                  color: Color.fromARGB(
                                                      255, 105, 97, 94)))
                                        ])),
                              ]),
                              Row(children: [
                                renderCircleWithText(screenDimension(context),
                                    circleBgColor: const Color.fromARGB(
                                        255, 254, 235, 179),
                                    text: '25',
                                    textColor:
                                        const Color.fromARGB(255, 07, 80, 0)),
                                horizontalSpaceTiny,
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                        text: 'Channel Partner ',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 105, 97, 94),
                                          fontFamily: 'Nexa-Bold',
                                          fontSize: 13,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "\n$users",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontFamily: 'Nexa-Bold',
                                                color: Color.fromARGB(
                                                    255, 105, 97, 94),
                                              ))
                                        ])),
                              ])
                            ],
                          ),
                        )),
                    spacer,
                    //Scheduled and Follow Up Card
                    Row(
                      children: [
                        Expanded(
                            child: renderCard(
                                child: Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: renderCircleWithText(
                                          screenDimension(context),
                                          circleBgColor: const Color.fromARGB(
                                              255, 255, 221, 201),
                                          textColor: const Color.fromARGB(
                                              255, 128, 52, 10),
                                          text: '8')),
                                  horizontalSpaceSmall,
                                  const Text('Site Visits \nScheduled',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 105, 97, 94),
                                          fontFamily: 'Nexa-Bold',
                                          fontSize: 12,
                                          height: 1))
                                ]),
                                buttonTitle: 'View Scheduled',
                                leadsName: '')),
                        horizontalSpaceSmall,
                        Expanded(
                            child: renderCard(
                                child: Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: renderCircleWithText(
                                          screenDimension(context),
                                          circleBgColor: const Color.fromARGB(
                                              255, 255, 237, 201),
                                          textColor: const Color.fromARGB(
                                              255, 147, 97, 0),
                                          text: '18')),
                                  horizontalSpaceSmall,
                                  const Text('Upcoming\nFollow ups',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 105, 97, 94),
                                          fontFamily: 'Nexa-Bold',
                                          fontSize: 12,
                                          height: 1))
                                ]),
                                buttonTitle: 'View Follow ups',
                                leadsName: ''))
                      ],
                    ),
                    spacer,
                    //My Team Card
                    renderCard(
                        buttonTitle: viewAll,
                        leadsName: 'MY TEAM',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenDimension(context) / 20,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      renderContainerWithImage(
                                          screenDimension(context),
                                          child: Image.asset(Images().girl1)),
                                      Positioned(
                                          left: 20,
                                          child: renderContainerWithImage(
                                              screenDimension(context),
                                              child:
                                                  Image.asset(Images().boy1))),
                                      Positioned(
                                          left: 40,
                                          child: renderContainerWithImage(
                                              screenDimension(context),
                                              child:
                                                  Image.asset(Images().boy2))),
                                      Positioned(
                                          left: 60,
                                          child: renderContainerWithImage(
                                              screenDimension(context),
                                              child:
                                                  Image.asset(Images().boy3))),
                                      Positioned(
                                          left: 80,
                                          child: renderContainerWithImage(
                                              screenDimension(context),
                                              child:
                                                  Image.asset(Images().girl2))),
                                      Positioned(
                                          left: 100,
                                          child: renderContainerWithImage(
                                              screenDimension(context),
                                              child: const Center(
                                                  child: Text('+5',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          height: 1.5,
                                                          fontWeight: FontWeight
                                                              .w400))))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            renderCircleWithText(
                              screenDimension(context),
                              circleBgColor:
                                  const Color.fromARGB(255, 250, 231, 202),
                              text: '10',
                              textColor: const Color.fromARGB(255, 147, 97, 0),
                            )
                          ],
                        )),
                    spacer
                  ],
                ),
              ))
            ])));
  }

//app bar
  renderCustomAppBar() {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 3,
        title: const Text('Welcome',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 0.7)),
        subtitle: const Text('Ravi Kumar',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Nexa-Bold',
                height: 1.2)),
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(Images().clientImage, height: 34, width: 34)),
        trailing: SizedBox(
            width: 72,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(Icons.power_settings_new_outlined,
                  size: 25, color: Colors.white),
              horizontalSpaceSmall,
              SizedBox(
                  width: 40,
                  child:
                      Stack(alignment: Alignment.centerLeft, children: <Widget>[
                    const Icon(Icons.notifications,
                        size: 25, color: Colors.white),
                    Positioned(
                        top: 4,
                        right: 2,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 148, 30),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("100",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400))))
                  ]))
            ])));
  }

//circle container with image
  Container renderContainerWithImage(screenRation, {Widget? child}) {
    return Container(
        height: screenRation / 40.5,
        width: screenRation / 40.5,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 247, 148, 30),
            border: Border.all(color: Colors.white, width: 1)),
        child: child);
  }

//circle with number text
  Container renderCircleWithText(screenRation,
      {Color? circleBgColor, Color? textColor, String? text}) {
    return Container(
        width: screenRation / 26.4,
        height: screenRation / 26.4,
        decoration: BoxDecoration(color: circleBgColor, shape: BoxShape.circle),
        child: Center(
            child: Text(text!,
                style: TextStyle(
                    height: 1.5,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nexa-Bold',
                    fontSize: 18))));
  }

//common card
  Container renderCard(
      {Widget? child, String? buttonTitle, String? leadsName}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 151, 51, 0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 1.0,
                  spreadRadius: 1,
                  offset: const Offset(2, 2))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.white)),
              child: child),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(leadsName!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(buttonTitle!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9)),
                          horizontalSpaceTiny,
                          Container(
                              width: 12,
                              height: 15,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 247, 170, 101),
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(Icons.chevron_right_outlined,
                                      size: 10,
                                      color: Color.fromARGB(255, 58, 50, 67)))),
                          if (buttonTitle == viewAll) horizontalSpaceTiny
                        ])
                  ]))
        ]));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
