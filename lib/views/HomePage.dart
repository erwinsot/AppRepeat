import 'package:apprepeat/components/addWords.dart';
import 'package:apprepeat/components/cardas.dart';
import 'package:apprepeat/components/timer.dart';
import 'package:apprepeat/controllers/patronBlock.dart';
import 'package:apprepeat/models/models.dart';
import 'package:apprepeat/service/notificationServer.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:apprepeat/utils/globals.dart' as globals;

import '../service/awesomeNotifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState(){
    super.initState();
    

  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await block.init();
    await block.findCheckWords();
    
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Colors.grey[200]!,
          ],
        )),          
          child: StreamBuilder<List<CheckWordsData>>(
            stream: block.chekWodsStream,
            builder: (context, AsyncSnapshot<List<CheckWordsData>> snapshot) {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                    child: MaterialButton(
                  elevation: 15,
                  minWidth: 100,
                  height: 40,
                  onPressed: () {
                    AddWord(context);
                  },
                  color: Colors.deepOrange,
                  child: const Text(
                    "Add Topic",
                    style: TextStyle(color: Colors.black),
                  ),
                ));
              } else {
                return Column(
                  children: [
                    Cartas(context, snapshot.data!),
                    //MySwiper(datos: snapshot.data!, context: context),

                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: style,
                            onPressed: () {
                              AddWord(context);
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),                   
                  Container(                    
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: style,
                          onPressed: (){
                             ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(
                              content: Text("Notification Canceled")));
                          NotificationService.cancellshueNotification();
                            
                          },
                          child: const Text('Stop Notification'),
                        ),
                      ],
                    ),
                  ),
                    
                  ],
                );
              }
            },
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
