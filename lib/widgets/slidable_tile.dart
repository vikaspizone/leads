import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableTile extends StatelessWidget {
  final Widget child;
  final int valueKey;
  final List<Widget> action;
  final Widget motion;
  const SlidableTile(
      {required this.child,
      required this.valueKey,
      required this.action,
      required this.motion,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(valueKey),
      endActionPane: ActionPane(
        extentRatio: (0.83 / 5) * action.length,
        motion: motion,
        children: action,
      ),
      child: child,
    );
  }
}
