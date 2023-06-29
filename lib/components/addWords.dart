import 'package:apprepeat/controllers/patronBlock.dart';
import 'package:apprepeat/models/models.dart';
import 'package:flutter/material.dart';

AddWord(BuildContext context) {
  final key2 = GlobalKey<FormState>();
  late String words;
  late String answers;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Words"),
          actions: [
            SingleChildScrollView(
              child: Form(
                  key: key2,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'what do yo want learn?',
                            labelText: "Add words"),
                        onChanged: (text) {
                          words = text;
                        },
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Add word";
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'is its meaning',
                            labelText: "Add answer"),
                        onChanged: (text) {
                          answers = text;
                        },
                        validator: (text2) {
                          if (text2!.isEmpty) {
                            return "Add word";
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () async {
                              if (key2.currentState!.validate()) {
                                CheckWords pal = CheckWords(words, answers);
                                await block.insertWords(pal);
                                await block.findCheckWords();
                                await check.init();
                                await blockAppbar.Providerappbar();
                                Navigator.pop(context);
                              } else {}
                            },
                            child: const Text("ACCEPT"),
                          ),
                          const SizedBox(width: 80),
                          MaterialButton(
                              child: const Text("CANCELAR"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      )
                    ],
                  )),
            )
          ],
        );
      });
}
