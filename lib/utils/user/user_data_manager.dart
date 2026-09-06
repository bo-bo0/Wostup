import 'package:wostup/data/user/user_info.dart';
import 'package:wostup/network/user/user_poster.dart';
import 'package:wostup/utils/files/user_data_file_manager.dart';

final class UserDataManager {
  static Future<void> registerUser(String name, String number) async {
    await UserPoster.registerUser(name, number);
    await UserDataFileManager.writeJson({
      "name" : name,
      "number" : number
    });
    saveLocalUser(name, number);
  }

  static void saveLocalUser(String name, String number) {
    UserInfo.info = UserInfo(name: name, number: number);
  }
}