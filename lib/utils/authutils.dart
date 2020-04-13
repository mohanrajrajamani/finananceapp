import 'package:shared_preferences/shared_preferences.dart';


class AuthUtils {

  static final String endPoint = '/Auth';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'access_token';
  static final String userIdKey = 'user_id';
  static final String nameKey = 'name';
  static final String roleKey = 'role';

  static save(responseJson) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.setString(authTokenKey, responseJson['access_token']);

    // ignore: unnecessary_statements
    String val=sharedPrefs.getString(AuthUtils.authTokenKey) ?? '';

    print('myvalue---'+val);
  }



//  static insertDetails(SharedPreferences prefs, var response) {
//    print(response['access_token']);
//    prefs.setString(authTokenKey, response['access_token']);
//  }

}