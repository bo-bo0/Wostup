import 'dart:async';
import 'package:wostup/data/user/user_info.dart';
import 'package:wostup/utils/contacts/contacts_updater.dart';
import 'message_fetcher.dart';

final class MessageReceiver {
  static Timer? _timer;

  static void startListening() {
    _timer ??= Timer.periodic(
      Duration(seconds: 1),
        (timer) { _tick(); }
    );
  }

  static void stopListening() {
    _timer?.cancel();
    _timer = null;
  }

  static void _tick() {
    if (UserInfo.info == null) {
      return;
    }
    ContactsUpdater.receive(MessageFetcher.fetchFor(UserInfo.info!.number));
  }
}