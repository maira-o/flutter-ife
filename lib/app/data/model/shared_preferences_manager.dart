import 'package:gauge_iot/app/data/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  // Private Properties
  
  static String _userKey = 'userDataKey';

  // Public Methods

  static Future<Usuario?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userJSON = sharedPreferences.getString(_userKey);

    if (userJSON == null) return null;
    
    return Usuario.fromRawJson(userJSON);
  }

    static Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userJSON = sharedPreferences.getString(_userKey);

    if (userJSON == null) return null;
    
    return Usuario.fromRawJson(userJSON).id;
  }

  static Future<bool> saveUser(Usuario user) async {
    String userJSON = user.toRawJson();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(_userKey, userJSON);
  }

  static Future<bool> deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(_userKey);
  }
}