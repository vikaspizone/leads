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
              style: const TextStyle(
                  color: Colors.white, fontSize: 11, fontFamily: 'Nexa-Bold')),
        ),
        Container(
          height: 65,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: [
              SvgPicture.asset(
                Images().userImage,
                height: 32,
                width: 32,
              ),
              horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Call from',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color(0xFF818080),
                          fontFamily: 'nexa-regular')),
                  Row(
                    children: [
                      Text(personName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: 'Nexa-Bold')),
                      horizontalSpaceSmall,
                      SvgPicture.asset(
                        Images().phoneCloudIcon,
                        height: 15,
                        width: 15,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Images().calenderIcon,
                        height: 10,
                        width: 10,
                      ),
                      horizontalSpaceTiny,
                      Text(visitDate,
                          style: const TextStyle(
                              fontFamily: 'Nexa-Bold',
                              height: 1,
                              fontSize: 9,
                              color: Color(0xFFAB7711))),
                      horizontalSpaceTiny,
                      SvgPicture.asset(
                        Images().clockIcon,
                        height: 10,
                        width: 10,
                      ),
                      horizontalSpaceTiny,
                      Text(visitTime,
                          style: const TextStyle(
                              fontFamily: 'Nexa-Bold',
                              height: 1,
                              fontSize: 9,
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
                      SizedBox(
                        height: 15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            personName == 'Manoj Kumar Tiwary'
                                ? SvgPicture.asset(
                                    Images().missCallIcon,
                                    height: 11,
                                  )
                                : SvgPicture.asset(
                                    Images().incomingCallIcon,
                                    height: 10,
                                  ),
                            horizontalSpaceTiny,
                            Text(callDuration,
                                style: const TextStyle(
                                    height: 1,
                                    fontSize: 8,
                                    color: Color(0xFF818080)))
                          ],
                        ),
                      ),
                      verticalSpaceTiny,
                      SvgPicture.asset(
                        Images().playIcon,
                        height: 18,
                        width: 18,
                      ),
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
