import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leads/ui/common/images.dart';

import '../ui/common/ui_helpers.dart';

class Input extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const Input({required this.controller, required this.focusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenDimension(context) / 24,
      padding: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Material(
              child: InkWell(
                onTap: () {
                  focusNode.requestFocus();
                },
                child: SvgPicture.asset(Images().searchIcon,
                    width: 15, height: 15),
              ),
            ),
          ),
          horizontalSpaceTiny,
          Expanded(
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              cursorColor: Colors.black54,
              cursorHeight: 18,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                fillColor: Colors.black,
                hintText: 'Search',
                contentPadding: EdgeInsets.only(bottom: 15),
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 214, 214, 214),
                    fontSize: 14,
                    height: 1,
                    letterSpacing: 0.5),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                controller.clear();
                focusNode.unfocus();
              },
              icon: const Icon(
                Icons.close,
                size: 20,
                color: Color.fromARGB(255, 165, 165, 165),
              ))
        ],
      ),
    );
  }
}
