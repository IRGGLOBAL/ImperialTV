import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../custom_widget/my_color.dart';
import 'AppButton.dart';



showExitDialog(BuildContext context) {
  AwesomeDialog(
    padding:  EdgeInsets.symmetric(vertical: 10,horizontal:20),
    context: context,
    dialogType: DialogType.noHeader,
    dialogBackgroundColor: MyColor.colorYellow,
    width: MediaQuery.of(context).size.width,
    buttonsBorderRadius: BorderRadius.circular(20),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    onDismissCallback: (type) {},
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title:"exitTitle".tr,
    titleTextStyle: TextStyle(
        color: MyColor.colorBlack, fontWeight: FontWeight.w600),
    showCloseIcon: false,
    btnCancel:AppButton(
        buttonName: 'no',
        buttonColor: MyColor.colorAmber,
        textColor: MyColor.colorBlack,
        borderColor:MyColor.getGreyText(),
        onTap:(){}),
    btnOk: AppButton(
        buttonName: 'Yes',
        buttonColor: MyColor.colorAmber,
        textColor: MyColor.colorBlack,
        borderColor:MyColor.getGreyText(),
        onTap:(){}),
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      SystemNavigator.pop();
    },
  ).show();
}
