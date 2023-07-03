import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apprepeat/utils/globals.dart' as globals;

void showTimerPicker(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            width: double.infinity,
            color: Colors.white,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              initialTimerDuration: const Duration(hours: 0, minutes: 0, seconds: 0),
              onTimerDurationChanged: (value) {
                globals.minutos = value;
                
              },
            ));
      });
}
