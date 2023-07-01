import 'package:apprepeat/components/SecondPage.dart';
import 'package:apprepeat/main.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initialNotification() async {
    await AwesomeNotifications().initialize(
      null,      
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: "high_importance_channel_group", channelGroupName: "group 1")
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
      ReceivedAction receivedAction) async {
         debugPrint('onNotificationCreatedMethod');
          final payload = receivedAction.payload ?? {};
           if (payload["navigate"] == "true"){
            MyApp.navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (_)=>const SecondPage())
            );
           }
      }

  static Future<void> onNotificationCreateMethod(
      ReceivedNotification receivedNotification) async {
         debugPrint('onNotificationCreatedMethod');
      }

  static Future<void> onNotificationDisplayMethod(
      ReceivedNotification receivedNotification) async {
         debugPrint('onNotificationCreatedMethod');
      }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
         debugPrint('onNotificationCreatedMethod');
      }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String,String>? payload,
    final ActionType actionType=ActionType.Default,
    final NotificationLayout notificationLayout=NotificationLayout.Default,
    final NotificationCategory? notificationCategory,
    final String? bigPicture,
    final List <NotificationActionButton>? actionButtons,
    final bool scheduled=false,
    final int? interval
  })async{
     assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: notificationCategory,
        payload: payload,
        bigPicture: bigPicture
        ),
        actionButtons: actionButtons,
        schedule: scheduled
        ?NotificationInterval(
          interval: interval,
          timeZone: 
          await AwesomeNotifications().getLocalTimeZoneIdentifier(),
          preciseAlarm: true
           )
           :null,
        );

  }

  static Future <void>createRepeatNotification(final Map<String,String>? payload,)async{
  String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  String utcTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'high_importance_channel',
          title: '${Emojis.money_money_bag+Emojis.plant_cactus} every minute',
          body:'Tu palabra a recordar es ',
          payload: payload,
          notificationLayout: NotificationLayout.BigText,
          bigPicture: 'asset://assets/images/melted-clock.png'),
          schedule: NotificationInterval(interval: 60, timeZone: localTimeZone, repeats: true),
          actionButtons: [
            NotificationActionButton(
                key: "View", label: "View answer")
          ]
  );
}
}
