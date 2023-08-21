import 'package:stacked/stacked_annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/ui_helpers.dart';
import '/ui/views/leads/leads_view.form.dart';
import '/widgets/input.dart';
import '/widgets/slidable_tile.dart';
import '../../../widgets/custom_lead_tile.dart';
import 'leads_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'search', initialValue: ''),
])
class LeadsView extends StackedView<LeadsViewModel> with $LeadsView {
  const LeadsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LeadsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 246, 240),
        body: Stack(
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
                    height: 70 - MediaQuery.of(context).viewPadding.top,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: viewModel.goBack,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const Text(
                          'All Leads',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
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
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFD9D9D9)),
                        ),
                        verticalSpaceSmall,
                        verticalSpaceTiny,
                        const TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          tabs: [
                            SizedBox(
                              height: 25,
                              child: Text('Channel Partner',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Nexa-Bold',
                                      fontWeight: FontWeight.w400)),
                            ),
                            SizedBox(
                              height: 25,
                              child: Text('DST',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Nexa-Bold',
                                      fontWeight: FontWeight.w400)),
                            ),
                            SizedBox(
                              height: 25,
                              child: Text('Referrals',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Nexa-Bold',
                                      fontWeight: FontWeight.w400)),
                            )
                          ],
                          indicatorWeight: 2,
                          indicatorColor: Color.fromARGB(255, 196, 22, 28),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Nexa-Bold',
                              fontSize: 15),
                        ),
                        verticalSpaceMedium,
                        Input(
                            controller: searchController,
                            focusNode: searchFocusNode),
                        verticalSpaceSmall,
                        SizedBox(
                          height: 35,
                          width: screenWidth(context),
                          child: ListView.builder(
                            itemCount: viewModel.filterCategoryList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () =>
                                    viewModel.onFilterCategoryTap(index),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      boxShadow: viewModel
                                              .filterCategoryList[index]
                                              .isSelected
                                          ? [
                                              const BoxShadow(
                                                  offset: Offset(0, 5),
                                                  color: Colors.black,
                                                  blurRadius: 5,
                                                  spreadRadius: -5)
                                            ]
                                          : [],
                                      border: Border.all(
                                          width: 1,
                                          color: viewModel
                                              .filterCategoryList[index].color),
                                      color: viewModel.filterCategoryList[index]
                                                  .isSelected ==
                                              true
                                          ? viewModel.filterCategoryList[index]
                                              .selectedColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    viewModel.filterCategoryList[index].title,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: 'Nexa-Bold',
                                        color: viewModel
                                            .filterCategoryList[index]
                                            .textColor),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.leadsList.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 245, 148, 30)),
                                margin: const EdgeInsets.only(bottom: 20),
                                child: SlidableTile(
                                  action: [
                                    // SlidableAction(
                                    //   onPressed: (context) {},
                                    //   borderRadius: const BorderRadius.only(
                                    //       topRight: Radius.circular(10),
                                    //       bottomRight: Radius.circular(10)),
                                    //   backgroundColor: const Color.fromARGB(
                                    //       255, 245, 148, 30),
                                    //   foregroundColor: Colors.white,
                                    //   icon: Icons.add_circle,
                                    //   padding: const EdgeInsets.all(5),
                                    //   label: 'Follow Up',
                                    // ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 148, 30),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Follow Up',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Nexa-Bold',
                                                  color: Colors.white,
                                                  fontSize: 8),
                                            )
                                          ]),
                                    ),
                                  ],
                                  valueKey: index,
                                  child: CustomTile(
                                    companyName:
                                        viewModel.leadsList[index].companyName,
                                    date: viewModel.leadsList[index].date,
                                    location:
                                        viewModel.leadsList[index].location,
                                    personName:
                                        viewModel.leadsList[index].personName,
                                    clientVistDate: viewModel
                                        .leadsList[index].clientVisitDate,
                                    statusBorderColor:
                                        viewModel.leadsList[index].borderColor,
                                    statusColor: viewModel
                                        .leadsList[index].backgroundColor,
                                    vistDate:
                                        viewModel.leadsList[index].visitDate,
                                    status: viewModel.leadsList[index].status,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LeadsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeadsViewModel();
}
