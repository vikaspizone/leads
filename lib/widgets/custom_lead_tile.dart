import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leads/ui/common/ui_helpers.dart';

class CustomTile extends StatefulWidget {
  final String personName;
  final String companyName;
  final String location;
  final String? vistDate;
  final String? clientVistDate;
  final String date;
  final String status;
  final Color statusColor;
  final Color statusBorderColor;

  const CustomTile({
    super.key,
    required this.personName,
    required this.companyName,
    required this.date,
    required this.location,
    this.vistDate,
    this.clientVistDate,
    required this.status,
    required this.statusBorderColor,
    required this.statusColor,
  });

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  bool isShow = false;

  _CustomTileState();

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() async {
    if (isShow) {
      await expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 239, 192),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                isShow = !isShow;
                _runExpandCheck();

                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 172, 119, 13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.personName,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Nexa-Bold',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  horizontalSpaceSmall,
                                  SvgPicture.asset(
                                    'assets/all-leads-icons/phone-icon.svg',
                                  ),
                                  const Expanded(child: SizedBox()),
                                  widget.status == 'Sold'
                                      ? Container(
                                          width: 90,
                                          height: 22,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: widget.statusColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: widget
                                                      .statusBorderColor)),
                                          child: Text(widget.status,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Nexa-Bold')))
                                      : Container(
                                          width: 90,
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: widget.statusColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: widget
                                                      .statusBorderColor)),
                                          child: Text(widget.status,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Nexa-Bold')),
                                        ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/all-leads-icons/building-icon.svg',
                                  ),
                                  horizontalSpaceSmall,
                                  Text(
                                    widget.location,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Nexa-Bold',
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 172, 119, 13)),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    widget.date,
                                    style: const TextStyle(
                                        fontSize: 7,
                                        fontFamily: 'nexa-regular',
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(width: 17)
                                ],
                              ),
                              if (isShow) ...[verticalSpaceTiny],
                              SizeTransition(
                                axisAlignment: 1.0,
                                sizeFactor: animation,
                                child: Row(
                                  //108,218,159
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 135, 209, 82),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 51, 171, 77),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      'Site visited on ${widget.clientVistDate}',
                                      style: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'nexa-regular',
                                          color: Color.fromARGB(
                                              255, 126, 126, 126)),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    SvgPicture.asset(
                                      'assets/all-leads-icons/calendar-icon.svg',
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      'Client visit - ${widget.clientVistDate}',
                                      style: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'nexa-regular',
                                          color: Color.fromARGB(
                                              255, 126, 126, 126)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 172, 119, 13),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/all-leads-icons/handshake-icon.svg',
                              ),
                              horizontalSpaceTiny,
                              Text(widget.companyName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: 'Nexa-Bold')),
                              const Expanded(child: SizedBox()),
                              SvgPicture.asset(
                                'assets/all-leads-icons/timer-icon.svg',
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
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  height: 45,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpaceTiny,
                            SvgPicture.asset(
                              'assets/all-leads-icons/follow-up-icon.svg',
                            ),
                            const Text('Follow Up',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Nexa-Bold',
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Color.fromARGB(255, 227, 211, 164),
                        indent: 10,
                        endIndent: 5,
                        thickness: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpaceTiny,
                            SvgPicture.asset(
                              'assets/all-leads-icons/archive-icon.svg',
                            ),
                            const Text('Archive',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Nexa-Bold',
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Color.fromARGB(255, 227, 211, 164),
                        indent: 10,
                        endIndent: 5,
                        thickness: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpaceTiny,
                            SvgPicture.asset(
                              'assets/all-leads-icons/view-icon.svg',
                            ),
                            const Text('View',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Nexa-Bold',
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
