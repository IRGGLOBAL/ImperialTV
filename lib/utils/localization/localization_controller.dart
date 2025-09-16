
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/localization/localization_controller.dart';
final box = GetStorage();

var langController=Get.put(ChangeLangController());
class ChangeLangController extends GetxController {
  var langCode=''.obs;



  void changeLanguage(String param1, String param2) {
    box.write('langCountry', param2);
    box.write('langCode', param1);
    langCode.value=param1;
    var locate = Locale(param1, param2);
    Get.updateLocale(locate);
  }
}
