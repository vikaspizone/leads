import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'incoming_call_viewmodel.dart';

class IncomingCallView extends StackedView<IncomingCallViewModel> {
  const IncomingCallView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IncomingCallViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        color: Colors.amber,
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SvgPicture.asset('Name'),
      ),
    );
  }

  @override
  IncomingCallViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IncomingCallViewModel();
}
