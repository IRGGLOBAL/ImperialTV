import '../../Utils/app_imports/app_imports.dart';
import '../custom_widget/my_color.dart';

Future appDialog(
  context, {
  Widget? widget,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              elevation: 0,
              backgroundColor: MyColor.transparentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              //this right here
              child: widget);
        });
      });
}
