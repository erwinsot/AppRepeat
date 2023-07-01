import 'package:apprepeat/components/homeScreen.dart';
import 'package:apprepeat/service/callbackDispacherServe.dart';
import 'package:apprepeat/service/notificationServer.dart';
import 'package:apprepeat/views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialNotification(); //call service notification
  Workmanager().initialize(callbackDispatcher,
      isInDebugMode: false); //callback from service
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: "My flutter"),
    );
  }
}
