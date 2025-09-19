// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:google_fonts/google_fonts.dart';
import '../../Utils/app_imports/app_imports.dart';
import '../Fonts/AppDimensions.dart';
import '../custom_widget/my_color.dart';

Widget AppText({
  required String text,
  double size = AppDimensions.FONT_SIZE_18,
  TextDecoration underLine = TextDecoration.none,
  TextAlign textAlign = TextAlign.left,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = "Inter",
  FontStyle fontStyle = FontStyle.normal,
  int? maxLines,
  TextOverflow? overflow,
  Color? color,
  TextStyle? style,
  GestureTapCallback? onTap, // Add onTap parameter
}) {
  final textWidget = color == null
      ? Text(text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style ??
          GoogleFonts.getFont(
            fontFamily,
            decoration: underLine,
            fontSize: size,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ))
      : Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: style ??
        GoogleFonts.getFont(fontFamily,
            fontSize: size,
            decoration: underLine,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            color: color),
  );

  // Wrap with GestureDetector if onTap is provided
  return onTap != null
      ? GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: textWidget,
  )
      : textWidget;
}

class HyperTxt extends StatelessWidget {
  String text = '';
  double? size;
  Color? color;
  TextAlign? align = TextAlign.center;
  FontWeight fontWeight;
  Function? onTap;

  HyperTxt({
    Key? key,
    required this.onTap,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.align,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap?.call(),
      child: Text(
        text,
        overflow: TextOverflow.fade,
        textAlign: align,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class MultiTxt extends StatelessWidget {
  String firstText;
  String? secondText;
  Color firstColor;
  String firstTextfontFamily;
  String secondTextfontFamily;

  MultiTxt({
    Key? key,
    required this.firstText,
    this.secondText,
    this.firstTextfontFamily = "Light Grold",
    this.secondTextfontFamily = "Light Grold",
    this.firstColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
                color: firstColor,
                fontSize: 15,
                fontFamily: firstTextfontFamily),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
                fontSize: 15,
                color: MyColor.colorBlack,
                fontFamily: secondTextfontFamily),
          ),
        ],
      ),
    );
  }
}