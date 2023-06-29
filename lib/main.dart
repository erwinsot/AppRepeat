import 'package:apprepeat/service/callbackDispacherServe.dart';
import 'package:apprepeat/service/notificationServer.dart';
import 'package:apprepeat/views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServer.initialNotification(); //call service notification
  Workmanager().initialize(callbackDispatcher,
      isInDebugMode: false); //callback from service
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
