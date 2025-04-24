import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static void setData({required String key, required dynamic value})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    switch(value.runtimeType){
      case String:
        sharedPreferences.setString(key, value);
        break;
      case bool:
        sharedPreferences.setBool(key, value);
        break;
      case int :
        sharedPreferences.setInt(key, value);
        break;
      default:
        break;
    }
  }

  static Future<dynamic> getData ({required String key})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  static Future<bool> remove({required String key})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }
}