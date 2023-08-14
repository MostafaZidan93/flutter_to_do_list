

import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    print("Did Enter Cash Helper Init+++++++++");
    sharedPreferences = await SharedPreferences.getInstance();
  }


  //Set Data
  static Future<bool> setData({
    required String key,
    required bool value,
}) async {
    print("Did Set Data for theme Mode)))))))))))))))))");
    return await sharedPreferences!.setBool(key, value);
  }

  //Get Data
  static bool? getData({
    required String key
}) {
    return sharedPreferences!.getBool(key);
  }
}