import 'package:fluttertoast/fluttertoast.dart';

import '../custom_widget/my_color.dart';

appToastView({required String title}) {
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColor.secondaryColor,
      textColor: MyColor.colorBlack,
      fontSize: 16.0);
}
