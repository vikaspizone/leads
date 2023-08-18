import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/ui_helpers.dart';
import '../../common/images.dart';
import 'incoming_call_viewmodel.dart';

class IncomingCallView extends StackedView<IncomingCallViewModel> {
  const IncomingCallView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IncomingCallViewModel viewModel,
    Widget? child,
  ) {
    var height = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(Images().leadBgImage, fit: BoxFit.fill)),
          Padding(
              padding: EdgeInsets.only(top: height),
              child: renderAppBar(context) //app bar
              ),
          Container(
            margin: EdgeInsets.only(top: height + 50),
            padding: const EdgeInsets.all(15),
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xFFFAF6F0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              children: [
                renderSelectBar(viewModel), //Select Bar
                verticalSpaceMedium,
                renderSearch(), //Search
                verticalSpaceSmall,
                const Text(
                  'Showing 2 records',
                  style: TextStyle(fontFamily: 'Nexa-Bold'),
                ),
                verticalSpaceSmall,
                renderCard(), //Render call Card
                verticalSpaceSmall,
                renderCard(), //Render Call Card
              ],
            ),
          )
        ],
      ),
    );
  }

//Render call card
  Container renderCard() {
    return Container(
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          SvgPicture.asset(Images().userImage),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Call from',
                  style: TextStyle(fontSize: 8, color: Color(0xFF818080))),
              Row(
                children: [
                  const Text('Unknown', style: TextStyle(fontSize: 15)),
                  horizontalSpaceSmall,
                  SvgPicture.asset(Images().phoneCloudIcon),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(Images().calenderIcon),
                  horizontalSpaceTiny,
                  const Text('12 August 2022',
                      style: TextStyle(
                          fontFamily: 'Nexa-Bold',
                          height: 0.5,
                          fontSize: 10,
                          color: Color(0xFFAB7711))),
                  horizontalSpaceTiny,
                  SvgPicture.asset(Images().clockIcon),
                  horizontalSpaceTiny,
                  const Text('2.00 PM',
                      style: TextStyle(
                          fontFamily: 'Nexa-Bold',
                          height: 0.5,
                          fontSize: 10,
                          color: Color(0xFFAB7711))),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              height: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(Images().incomingCallIcon),
                      horizontalSpaceTiny,
                      const Text('10 m 54 s',
                          style:
                              TextStyle(fontSize: 8, color: Color(0xFF818080)))
                    ],
                  ),
                  verticalSpaceTiny,
                  SvgPicture.asset(Images().playIcon),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //Search Bar
  Container renderSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                // searchFocusNode.requestFocus();
              },
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 165, 165, 165),
              )),
          horizontalSpaceTiny,
          Expanded(
            child: TextFormField(
              // focusNode: searchFocusNode,
              // controller: searchController,
              cursorColor: Colors.black,
              cursorHeight: 15,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                fillColor: Colors.black,
                hintText: 'Search',
                hintStyle: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // searchController.clear();

                // searchFocusNode.unfocus();
              },
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 165, 165, 165),
              ))
        ],
      ),
    );
  }

//Render Select Bar
  Expanded renderSelectBar(IncomingCallViewModel viewModel) {
    return Expanded(
      child: Row(
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
                      height: double.infinity,
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
                          height: 2,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: viewModel.selectedTab == 'Identified'
                              ? const Color(0xFFE29C10)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('Identified',
                          style: TextStyle(
                              fontFamily: 'Nexa-Bold',
                              height: 2,
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
                          height: 2,
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
                    SvgPicture.asset(Images().menuIcon),
                    const Icon(Icons.arrow_drop_down, color: Colors.black26)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  //App Bar
  Row renderAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25)),
        Text(
          'Incoming Call Records',
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }

  @override
  IncomingCallViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IncomingCallViewModel();
}
