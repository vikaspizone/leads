import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/images.dart';
import '../../common/ui_helpers.dart';

class CallDetailCard extends StatelessWidget {
  final String personName;
  final String visitDate;
  final String visitTime;
  final String callDuration;
  final String status;

  const CallDetailCard({
    super.key,
    required this.personName,
    required this.callDuration,
    required this.visitDate,
    required this.visitTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 172, 119, 13),
          ),
          child: Text(status,
              style: const TextStyle(color: Colors.white, fontSize: 11)),
        ),
        Container(
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
                      Text(personName, style: const TextStyle(fontSize: 15)),
                      horizontalSpaceSmall,
                      SvgPicture.asset(Images().phoneCloudIcon),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(Images().calenderIcon),
                      horizontalSpaceTiny,
                      Text(visitDate,
                          style: const TextStyle(
                              fontFamily: 'Nexa-Bold',
                              height: 0.5,
                              fontSize: 10,
                              color: Color(0xFFAB7711))),
                      horizontalSpaceTiny,
                      SvgPicture.asset(Images().clockIcon),
                      horizontalSpaceTiny,
                      Text(visitTime,
                          style: const TextStyle(
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
                          Text(callDuration,
                              style: const TextStyle(
                                  fontSize: 8, color: Color(0xFF818080)))
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
        )
      ],
    );
  }
}
