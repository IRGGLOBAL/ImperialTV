import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiClient extends GetxService {
  late SharedPreferences sharedPreferences;

  bool isNotificationAudioEnable() {
    String pre = sharedPreferences.getString('rider-notification-audio-enable-key') ?? '';
    return pre == '1';
  }
  storeNotificationAudioEnable(bool isEnable) {
    sharedPreferences.setString(
      'rider-notification-audio-enable-key',
      isEnable ? '1' : '0',
    );
  }


}
