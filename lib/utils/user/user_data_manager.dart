import 'package:wostup/data/user/user_info.dart';
import 'package:wostup/network/user/user_poster.dart';
import 'package:wostup/utils/files/save_files_helper.dart';

final class UserDataManager {
  static Future<void> registerUser(String name, String number) async {
    await UserPoster.registerUser(name, number);
    await SaveFilesHelper.writeJson(
      {
        "name" : name,
        "number" : number
      },
      SaveFile.user);
    saveLocalUser(name, number);
  }

  static void saveLocalUser(String name, String number) {
    UserInfo.info = UserInfo(name: name, number: number);
  }
}