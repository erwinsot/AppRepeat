import 'dart:math';

import 'package:apprepeat/controllers/patronBlock.dart';

int createUniqueId() {
  return DateTime.now().microsecondsSinceEpoch.remainder(100000);
}

Future<Map<String, String>> daPayload() async {
  var bpaylod = await block.checkwordsdata;
  var rng = Random();
  var num = rng.nextInt(bpaylod.length);

  Map<String, String> payload = {
    "word": bpaylod[num].word,
    "answer": bpaylod[num].answer
  };

  return payload;
}

Future<String?> daPayload2() async {
  var bpaylod = await block.checkwordsdata;
  var rng = Random();
  var num = rng.nextInt(bpaylod.length);

  String payload = bpaylod[num].answer;

  return payload;
}
