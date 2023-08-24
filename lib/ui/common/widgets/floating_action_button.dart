import 'package:flutter/material.dart';
import 'package:leads/ui/common/ui_helpers.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: screenDimension(context) / 20,
            width: screenDimension(context) / 20,
            decoration: const BoxDecoration(
                // color: Color(0xFFF9F5EF),
                gradient: RadialGradient(
                    tileMode: TileMode.decal,
                    radius: 12,
                    center: Alignment.topCenter,
                    colors: [Colors.transparent, Color(0xFFF9F5EF)]),
                shape: BoxShape.circle),
            child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0.0,
                child: Container(
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
                    height: screenDimension(context) / 25.9,
                    width: screenDimension(context) / 25.9,
                    child: Icon(Icons.add,
                        size: screenDimension(context) / 43.5,
                        color: Colors.white)),
                onPressed: () {})),
        SizedBox(height: screenDimension(context) / 81)
      ],
    );
  }
}
