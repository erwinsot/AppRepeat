import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationServer {
  static Future<void> initialNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'scheduled_channel',
            channelName: 'Scheduled Notifications',
            locked: false,
            defaultColor: Colors.teal,
            ledColor: Colors.white,
            importance: NotificationImportance.Max,
            channelDescription: "shedul is mejor",
            channelShowBadge: true),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: "importan_channel", channelGroupName: "group 1")
      ],
      debug: false,
    );

    await AwesomeNotifications().isNotificationAllowed().then((value) async {
      if (!value) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreateMethod,
        onNotificationDisplayedMethod: onNotificationDisplayMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod);
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  static Future<void> onNotificationCreateMethod(
      ReceivedNotification receivedNotification) async {}

  static Future<void> onNotificationDisplayMethod(
      ReceivedNotification receivedNotification) async {}

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}
}
