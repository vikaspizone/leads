import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 158, 99, 58)),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images().backgroundImage), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            //app bar
            renderCustomAppBar(),
            verticalSpaceSmall,
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        //leads trend graph
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Graph(),
                        ),

                        verticalSpaceTiny,
                        //pie chart
                        renderCard(
                          buttonTitle: viewAll,
                          leadsName: 'LEADS BY STAGES',
                          child: FlipCard(
                            direction: FlipDirection
                                .HORIZONTAL, // Change this to your desired flip direction
                            flipOnTouch: true,
                            speed: 1000,
                            front: PieChartPage(),
                            back: BackSide(
                              gridDetail: viewModel.gridDetail,
                            ),
                          ),
                        ),
                        //users card
                        renderCard(
                            buttonTitle: viewAll,
                            leadsName: users.toUpperCase(),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    renderCircleWithText(
                                        circleBgColor: const Color.fromARGB(
                                            255, 219, 255, 231),
                                        text: '8',
                                        textColor: const Color.fromARGB(
                                            255, 6, 95, 36)),
                                    const SizedBox(width: 10),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                            text: 'DST',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 105, 97, 94),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "\n$users",
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 105, 97, 94),
                                                  ))
                                            ])),
                                  ]),
                                  // horizontalSpaceMedium,
                                  Row(children: [
                                    renderCircleWithText(
                                        circleBgColor: const Color.fromARGB(
                                            255, 254, 235, 179),
                                        text: '25',
                                        textColor: const Color.fromARGB(
                                            255, 07, 80, 0)),
                                    const SizedBox(width: 10),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                            text: 'Channel Partner ',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 105, 97, 94),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "\n$users",
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 105, 97, 94),
                                                  ))
                                            ])),
                                  ])
                                ],
                              ),
                            )),
                        //schedule and follow up cards
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: renderCard(
                                  child: Row(
                                    children: [
                                      renderCircleWithText(
                                          circleBgColor: const Color.fromARGB(
                                              255, 255, 221, 201),
                                          textColor: const Color.fromARGB(
                                              255, 128, 52, 10),
                                          text: '8'),
                                      horizontalSpaceSmall,
                                      const Text('Site Visits \nScheduled',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 105, 97, 94),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                  buttonTitle: 'View Scheduled',
                                  leadsName: ''),
                            ),
                            horizontalSpaceSmall,
                            Expanded(
                              flex: 1,
                              child: renderCard(
                                  child: Row(
                                    children: [
                                      renderCircleWithText(
                                          circleBgColor: const Color.fromARGB(
                                              255, 255, 237, 201),
                                          textColor: const Color.fromARGB(
                                              255, 147, 97, 0),
                                          text: '18'),
                                      horizontalSpaceSmall,
                                      const Text('Upcoming\nFollow ups',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 105, 97, 94),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                  buttonTitle: 'View Follow ups',
                                  leadsName: ''),
                            ),
                          ],
                        ),

                        //my team card
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
                                      height: 60,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          renderContainerWithImage(
                                            child: SvgPicture.asset(
                                              Images().userImage,
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            child: renderContainerWithImage(
                                              child: SvgPicture.asset(
                                                Images().userImage,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 40,
                                            child: renderContainerWithImage(
                                              child: SvgPicture.asset(
                                                Images().userImage,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 60,
                                            child: renderContainerWithImage(
                                              child: SvgPicture.asset(
                                                Images().userImage,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 80,
                                            child: renderContainerWithImage(
                                              child: SvgPicture.asset(
                                                Images().userImage,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 100,
                                            child: renderContainerWithImage(
                                                child: const Center(
                                              child: Text(
                                                '+5',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                renderCircleWithText(
                                  circleBgColor:
                                      const Color.fromARGB(255, 250, 231, 202),
                                  text: '10',
                                  textColor:
                                      const Color.fromARGB(255, 147, 97, 0),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//app bar
  ListTile renderCustomAppBar() {
    return ListTile(
      title: const Text(
        'Welcome',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 0.5),
      ),
      subtitle: const Text(
        'Ravi Kumar',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          Images().userImage,
          height: 34,
          width: 34,
        ),
      ),
      trailing: Wrap(
        children: <Widget>[
          const Icon(
            Icons.power_settings_new_outlined,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 60,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Icon(
                  Icons.notifications,
                  size: 20,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  right: 6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 148, 30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "100",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//circle container with image
  Container renderContainerWithImage({Widget? child}) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 247, 148, 30),
          border: Border.all(color: Colors.white, width: 1)),
      child: child,
    );
  }

//circle with number text
  Container renderCircleWithText(
      {Color? circleBgColor, Color? textColor, String? text}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: circleBgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(text!,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 18)),
      ),
    );
  }

//common card
  Container renderCard(
      {Widget? child, String? buttonTitle, String? leadsName}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.white)),
            child: child,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
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
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chevron_right_outlined,
                          size: 10,
                          color: Color.fromARGB(255, 58, 50, 67),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
