import 'package:apprepeat/components/TopBar.dart';
import 'package:apprepeat/main.dart';
import 'package:flip_card/flip_card.dart';
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
              Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(payload.keys.first, style: Theme.of(context).textTheme.displayLarge),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(payload.values.first, style: Theme.of(context).textTheme.displayLarge),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    ),
              
                       
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