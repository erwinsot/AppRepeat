import 'dart:math';
import 'package:apprepeat/utils/utils.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createPlantFoodNotification(
    String? body, Map<String, String> payload, String images) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: "basic_channel",
        title:
            '${Emojis.animals_bear}hora de estudiar mk${Emojis.animals_bear}',
        body: 'Do you remember what this is? !${body}!  ${Emojis.animals_fox} ',
        payload: payload,
        summary: "!! hola sapo hp!!",
        displayOnBackground: true,
        largeIcon: images,
        //bigPicture: images,
        notificationLayout: NotificationLayout.Messaging,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'Find out',
          label: 'Find out',
        )
      ]);
}

Future<void> cancellshueNotification() async {
  await AwesomeNotifications().cancelAllSchedules();
}
