import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GETTERS and SETTERS
  get gender {
    return this._prefs.getInt('gender') ?? 1;
  }
  set gender (int value) {
    this._prefs.setInt('gender', value);
  }


  get secondaryColor {
    return this._prefs.getBool('secondaryColor') ?? false;
  }
  set secondaryColor (bool value) {
    this._prefs.setBool('secondaryColor', value);
  }


  get username {
    return this._prefs.getString('username') ?? '';
  }
  set username (String value) {
    this._prefs.setString('username', value);
  }

}