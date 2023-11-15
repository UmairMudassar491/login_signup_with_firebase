import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String qariLoggedInKey = "QARILOGGEDINKEY";
  // static String userNameKey = "USERNAMEKEY";
  // static String userEmailKey = "USEREMAILKEY";

  // saving the data to SF

  static Future<void> saveUserLoggedInStatus(bool loggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setBool(userLoggedInKey, loggedIn);
  }

  static Future<void> saveQariLoggedInStatus(bool loggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setBool(qariLoggedInKey, loggedIn);
  }

  static Future<bool> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey) ?? false;
  }

  static Future<bool> getQariLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(qariLoggedInKey) ?? false;
  }

  static Future<bool> removeUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.clear();
  }

  static Future<bool> removeQariLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.clear();
  }

  // static Future<bool> saveUserNameSF(String userName) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setString(userNameKey, userName);
  // }

  // static Future<bool> saveUserEmailSF(String userEmail) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setString(userEmailKey, userEmail);
  // }

  // getting the data from SF

  // static Future<String?> getUserEmailFromSF() async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return sf.getString(userEmailKey);
  // }

  // static Future<String?> getUserNameFromSF() async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return sf.getString(userNameKey);
  // }
}
