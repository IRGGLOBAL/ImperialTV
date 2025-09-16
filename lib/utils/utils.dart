import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'dart:math';

import 'custom_widget/dimensions.dart';
import 'custom_widget/my_color.dart';



class MyUtils {
  static splashScreen() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.getPrimaryColor(),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: MyColor.getPrimaryColor(),
        systemNavigationBarIconBrightness: Brightness.light));
  }

  static allScreen() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.getPrimaryColor(),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: MyColor.colorWhite,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  static dynamic getShadow() {
    return [
      BoxShadow(
          blurRadius: 15.0,
          offset: const Offset(0, 25),
          color: Colors.grey.shade500.withValues(alpha: 0.6),
          spreadRadius: -35.0),
    ];
  }


  static dynamic getBottomSheetShadow() {
    return [
      BoxShadow(
        color: Colors.grey.shade400.withValues(alpha: 0.08),
        spreadRadius: 3,
        blurRadius: 4,
        offset: const Offset(0, 3),
      ),
    ];
  }

  static dynamic getShadow2({double blurRadius = 8}) {
    return [
      BoxShadow(
        color: MyColor.getShadowColor().withValues(alpha: 0.3),
        blurRadius: blurRadius,
        spreadRadius: 3,
        offset: const Offset(0, 10),
      ),
      BoxShadow(
        color: MyColor.getShadowColor().withValues(alpha: 0.3),
        spreadRadius: 1,
        blurRadius: blurRadius,
        offset: const Offset(0, 1),
      ),
    ];
  }

  static dynamic getCardShadow() {
    return [
      BoxShadow(
        color: Colors.grey.shade400.withValues(alpha: 0.05),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 3),
      ),
    ];
  }

  static dynamic getCardTopShadow() {
    return [
      BoxShadow(
        color: Colors.grey.shade400.withValues(alpha: 0.05),
        offset: const Offset(0, 0),
        blurRadius: 20,
        spreadRadius: 0,
      ),
    ];
  }

  static dynamic getBottomNavShadow() {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.15),
        blurRadius: 20,
        spreadRadius: 0,
        offset: const Offset(0, 0),
      ),
    ];
  }

  static getOperationTitle(String value) {
    String number = value;
    RegExp regExp = RegExp(r'^(\d+)(\w+)$');
    Match? match = regExp.firstMatch(number);
    if (match != null) {
      String? num = match.group(1) ?? '';
      String? unit = match.group(2) ?? '';
      String title = '"last".tr $num ${unit.capitalizeFirst}';
      return title.tr;
    } else {
      return value.tr;
    }
  }


  double _toRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  double calculateDistance(
      double startLat, double startLong, double endLat, double endLong) {
    const int radiusOfEarth = 6371;
    double dLat = _degreesToRadians(endLat - startLat);
    double dLon = _degreesToRadians(endLong - startLong);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(startLat)) *
            cos(_degreesToRadians(endLat)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = radiusOfEarth * c;
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  void stopLandscape() {
    //normally ride sharing app doesn't have landscape mode
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }


  static LatLng getDefaultLatLong() {
    return const LatLng(-1, -1);
  }

  static Position getDefaultPosition() {
    return Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);
  }


  static Future<void> launchPhone(url) async {
    await launchUrl(Uri.parse("tel:$url"));
  }

  List<Row> makeSlotWidget({required List<Widget> widgets}) {
    List<Row> pairs = [];
    for (int i = 0; i < widgets.length; i += 2) {
      Widget first = widgets[i];
      Widget? second =
      (i + 1 < widgets.length) ? widgets[i + 1] : const SizedBox();

      pairs.add(
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: first),
          const SizedBox(width: Dimensions.space15),
          Expanded(child: second)
        ]),
      );
    }
    return pairs;
  }

  static String maskSensitiveInformation(String input) {
    try {
      if (input.isEmpty) {
        return '';
      }

      final int maskLength = input.length ~/ 2; // Mask half of the characters.

      final String mask = '*' * maskLength;

      final String maskedInput = maskLength > 4
          ? input.replaceRange(5, maskLength, mask)
          : input.replaceRange(0, maskLength, mask);

      return maskedInput;
    } catch (e) {
      return input;
    }
  }

  static String maskEmail(String email) {
    try {
      if (email.isEmpty) {
        return '';
      }

      // Split the email address into parts before and after '@' symbol
      List<String> parts = email.split('@');
      String maskedPart = maskString(parts[0]);

      // Check if there are more than one '@' symbols
      if (parts.length > 2) {
        // If there are, reconstruct the email address with only the first part masked
        return "$maskedPart@${parts[1]}";
      } else {
        // Otherwise, just mask the first part and keep the domain intact
        return "$maskedPart@${parts[1]}";
      }
    } catch (e) {
      return email;
    }
  }

  static String maskString(String str) {
    // Mask the string, leaving only the first and last characters visible
    if (str.length <= 2) {
      // If the string has only 2 characters or less, keep the first character visible
      return str.substring(0, 1) + "*" * (str.length - 1);
    } else {
      // If the string has more than 2 characters, keep the first and last characters visible
      return str.substring(0, 1) +
          "*" * (str.length - 2) +
          str.substring(str.length - 1);
    }
  }


  static bool isImage(String path) {
    if (path.contains('.jpg')) {
      return true;
    }
    if (path.contains('.png')) {
      return true;
    }
    if (path.contains('.jpeg')) {
      return true;
    }
    return false;
  }

  static bool isXlsx(String path) {
    if (path.contains('.xlsx')) {
      return true;
    }
    if (path.contains('.xls')) {
      return true;
    }
    if (path.contains('.xlx')) {
      return true;
    }
    return false;
  }

  static bool isDoc(String path) {
    if (path.contains('.doc')) {
      return true;
    }
    if (path.contains('.docs')) {
      return true;
    }
    return false;
  }


  static Widget customLoadingAnimation(){
    return Container(
        width: double.infinity,
        // color: MyColor.colorWhite,
        // child: LottieBuilder.asset(
        //     MyImages.wheelOriginAlanimation
        //   // MyAnimation.map
        //
        // )
    );
  }
}
//\bMyStrings\.\w+(?!\.tr)\b
