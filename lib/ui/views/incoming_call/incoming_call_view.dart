import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:leads/ui/views/incoming_call/call_detail_card.dart';
import 'package:leads/ui/views/incoming_call/incoming_call_view.form.dart';
import 'package:leads/widgets/input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../widgets/slidable_tile.dart';
import '/ui/common/ui_helpers.dart';
import '../../common/images.dart';
import 'incoming_call_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'search', initialValue: ''),
])
class IncomingCallView extends StackedView<IncomingCallViewModel>
    with $IncomingCallView {
  const IncomingCallView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IncomingCallViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.goBack();
        return true;
      },
      child: Stack(
        children: [
          SizedBox(
            width: screenWidth(context),
            child: Image.asset(
              'assets/bg-images/leads-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: screenHeight(context),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 90 - MediaQuery.of(context).viewPadding.top,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: viewModel.goBack,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const Text(
                        'Incoming Call Records',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nexa-Bold',
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: screenHeight(context) - 90,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 246, 240),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(
                    children: [
                      renderSelectBar(viewModel), //Select Bar
                      verticalSpaceMedium,
                      Input(
                          controller: searchController,
                          focusNode: searchFocusNode), //Search
                      verticalSpaceSmall,
                      Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                text: 'Showing ',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 66, 66, 66),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    fontFamily: 'nexa-regular'),
                                children: [
                              TextSpan(
                                text: '${viewModel.leadsList.length}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    fontFamily: 'Nexa-Bold'),
                              ),
                              const TextSpan(
                                text: ' records',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 66, 66, 66),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    fontFamily: 'nexa-regular'),
                              ),
                            ])),
                      ),

                      verticalSpaceSmall,
                      ListView.builder(
                        itemCount: viewModel.leadsList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 196, 22, 28),
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: SlidableTile(
                                motion: const ScrollMotion(),
                                action: [
                                  Expanded(
                                      child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 196, 22, 28),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 245, 148, 30),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 196, 22, 28),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/incoming-call-icons/discard-icon.svg',
                                                height: 20,
                                              ),
                                              verticalSpaceTiny,
                                              const Text(
                                                'Disqualify',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                    fontSize: 9),
                                              )
                                            ]),
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 245, 148, 30),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/incoming-call-icons/check-icon.svg',
                                            height: 20,
                                          ),
                                          verticalSpaceTiny,
                                          const Text(
                                            'Create\nProspect',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 9),
                                            textAlign: TextAlign.center,
                                          )
                                        ]),
                                  )),
                                ],
                                valueKey: index,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: CallDetailCard(
                                    callDuration:
                                        viewModel.leadsList[index].callDuration,
                                    personName:
                                        viewModel.leadsList[index].personName,
                                    visitTime:
                                        viewModel.leadsList[index].visitTime,
                                    visitDate:
                                        viewModel.leadsList[index].visitDate,
                                    status: viewModel.leadsList[index].status,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      verticalSpaceSmall,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Render Select Bar
  Widget renderSelectBar(IncomingCallViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: const Color(0xFFF9E7C4),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    viewModel.selectTab('All');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: viewModel.selectedTab == 'All'
                            ? const Color(0xFFE29C10)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontFamily: 'Nexa-Bold',
                        height: 1,
                        fontSize: 12,
                        color: viewModel.selectedTab == 'All'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.selectTab('Identified');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: viewModel.selectedTab == 'Identified'
                            ? const Color(0xFFE29C10)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('Identified',
                        style: TextStyle(
                            fontFamily: 'Nexa-Bold',
                            height: 1,
                            fontSize: 12,
                            color: viewModel.selectedTab == 'Identified'
                                ? Colors.white
                                : Colors.black)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.selectTab('Unidentified');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: viewModel.selectedTab == 'Unidentified'
                            ? const Color(0xFFE29C10)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'Unidentified',
                      style: TextStyle(
                        fontFamily: 'Nexa-Bold',
                        height: 1,
                        fontSize: 12,
                        color: viewModel.selectedTab == 'Unidentified'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        horizontalSpaceSmall,
        Expanded(
            flex: 1,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Images().menuIcon,
                    color: const Color.fromARGB(255, 80, 80, 80),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.black26)
                ],
              ),
            ))
      ],
    );
  }

  @override
  IncomingCallViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IncomingCallViewModel();
}
