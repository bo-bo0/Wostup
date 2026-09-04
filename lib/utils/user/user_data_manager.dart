import 'package:wostup/data/user/user_info.dart';

final class UserDataManager {
  static void registerUser(String name, String number) {
    UserInfo.info = UserInfo(name: name, number: number);
  }
}