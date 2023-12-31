import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/ui/common/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const LeadsApp());
}

class LeadsApp extends StatelessWidget {
  const LeadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: leadsAppTheme(),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
