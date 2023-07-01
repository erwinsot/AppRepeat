import 'package:apprepeat/components/addWords.dart';
import 'package:apprepeat/components/cardas.dart';
import 'package:apprepeat/components/timer.dart';
import 'package:apprepeat/controllers/patronBlock.dart';
import 'package:apprepeat/models/models.dart';
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
  void initState()async{
    super.initState();
    await  block.findCheckWords();

  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await block.init();
    
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
                        children: [
                          FloatingActionButton(
                            heroTag: "btn7",
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: const Text(
                                          "interval minimum 15 minutes",
                                          textAlign: TextAlign.center,
                                        ),
                                        alignment: Alignment.center,
                                        actions: [
                                          OutlinedButton(
                                              onPressed: () {
                                                showTimerPicker(context);
                                              },
                                              child: const Text("Interval")),
                                          OutlinedButton(
                                            onPressed: () {
                                              if (globals.minutos
                                                      .abs()
                                                      .inMinutes <
                                                  15) {
                                                ScaffoldMessenger.of(
                                                        this.context)
                                                    .showSnackBar(const SnackBar(
                                                        backgroundColor:
                                                            Colors.pinkAccent,
                                                        content: Text(
                                                            "Minimum interval 15 minutes")));
                                              } else {
                                                List<String> array1 = [];
                                                List<String> array2 = [];
                                                snapshot.data
                                                    ?.asMap()
                                                    .forEach((key, value) {
                                                  array2.add(value.answer);
                                                  array1.add(value.word);
                                                });
                                                Workmanager()
                                                    .registerPeriodicTask(
                                                        "2",
                                                        //This is the value that will be
                                                        // returned in the callbackDispatcher
                                                        "simplePeriodicTask",

                                                        // When no frequency is provided
                                                        // the default 15 minutes is set.
                                                        // Minimum frequency is 15 min.
                                                        // Android will automatically change
                                                        // your frequency to 15 min
                                                        // if you have configured a lower frequency.
                                                        frequency: globals.minutos,
                                                        inputData: {
                                                      "num": array1.length,
                                                      "arrays": array1,
                                                      "array2": array2
                                                    });

                                                Navigator.pop(context);

                                                ScaffoldMessenger.of(
                                                        this.context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Colors.pinkAccent,
                                                        content: Text(
                                                            "Interval of ${globals.minutos.abs().inMinutes} minutes created")));
                                              }

                                              // createRepeatNotification();
                                              // NotificationApi.periodicalNotification(title: "perron",body: "este es una pruba");
                                            },
                                            child: const Text(
                                              "Create",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cancel",
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                        buttonPadding: const EdgeInsets.all(15),
                                        title: const Text(
                                          "Created notification",
                                          textAlign: TextAlign.center,
                                        ),
                                      ));
                            },
                            backgroundColor: Colors.teal,
                            tooltip: 'Open Notification',
                            child: const Icon(Icons.ad_units_outlined),
                          ),
                          const SizedBox(
                            width: 150,
                          ),
                          FloatingActionButton(
                              heroTag: "btn9",
                              onPressed: () {
                                ScaffoldMessenger.of(this.context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Notification Canceled")));
                                cancellshueNotification();
                                Workmanager().cancelByUniqueName("2");
                              },
                              tooltip: 'Open Notification',
                              backgroundColor: Colors.deepPurpleAccent,
                              child: const Icon(Icons.close))
                        ],
                      ),
                    )
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
