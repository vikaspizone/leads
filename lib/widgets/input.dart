import 'package:flutter/material.dart';

import '../ui/common/ui_helpers.dart';

class Input extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const Input({required this.controller, required this.focusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                focusNode.requestFocus();
              },
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 165, 165, 165),
              )),
          horizontalSpaceTiny,
          Expanded(
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
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
                controller.clear();
                focusNode.unfocus();
              },
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 165, 165, 165),
              ))
        ],
      ),
    );
  }
}
