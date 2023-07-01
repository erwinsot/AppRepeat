import 'package:apprepeat/components/TopBar.dart';
import 'package:apprepeat/main.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
   final Map<String,String> payload;
  const SecondPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Colors.grey[200]!,
          ],
        )),
        child: SizedBox(
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const TopBar(title: 'Second Screen'),
              const Spacer(),
              Text( payload.values.first),
               const SizedBox(height: 50,),
              Text( payload.values.elementAt(1)),
              const Center(
                child: Text("Navigated from notification"),
              ),
              // This icon button has been added fot ios navigation
              IconButton(
                onPressed: () => MyApp.navigatorKey.currentState?.pop(),
                icon: const Icon(Icons.arrow_circle_left_outlined),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}