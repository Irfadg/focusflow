import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';
import 'package:focusflow/core/core.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const FocusFlowApp());
}



class FocusFlowApp extends StatelessWidget {
  const FocusFlowApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(

      routerConfig: AppRouter.router,

      title: 'FocusFlow',

    );

  }

}
