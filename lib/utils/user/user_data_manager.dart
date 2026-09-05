import 'package:wostup/data/user/user_info.dart';
import 'package:wostup/network/user/user_poster.dart';

final class UserDataManager {
  static Future<void> registerUser(String name, String number) async {
    await UserPoster.registerUser(name, number);
    UserInfo.info = UserInfo(name: name, number: number);
  }
}