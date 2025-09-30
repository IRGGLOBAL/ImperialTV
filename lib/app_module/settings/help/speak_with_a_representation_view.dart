import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/text_strings.dart';

class SpeakWithARepresentationView extends StatelessWidget {
  SpeakWithARepresentationView({Key? key}) : super(key: key);

  final TextEditingController issueController = TextEditingController();
  final TextEditingController countryController =
  TextEditingController(text: MyStrings.unitedstatesofamerica.tr);
  final TextEditingController phoneController = TextEditingController();

  final RxString selectedCountry = MyStrings.unitedstatesofamerica.tr.obs;

  final List<String> countries = [
    MyStrings.unitedstatesofamerica.tr,
    MyStrings.unitedkingdom.tr,
    MyStrings.india.tr,
    MyStrings.pakistan.tr,
    MyStrings.canada.tr,
    MyStrings.australia.tr,
  ];

  @override
  Widget build(BuildContext context) {
    // You can replace the hard-coded strings with MyStrings.*.tr if you have keys.
    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.colorBlack,
        centerTitle: true,
        title: AppText(
          text: MyStrings.speakwitharepresentative.tr,
          size: AppDimensions.FONT_SIZE_18,
          fontWeight: FontWeight.w600,
          color: MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppText(
                text: MyStrings.haveuscallyourightnowabout.tr,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w600,
                color: MyColor.colorWhite,
              ),
              const SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.pleaseenteryourissue.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: const [AutofillHints.email],
                      radius: 10,
                      fillColor: MyColor.lineColor,
                      hintText: MyStrings.otherissue.tr,
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor,fontSize: AppDimensions.FONT_SIZE_12,),
                      controller: issueController,
                      // supply focusNode/controller from your GetX controller if needed:
                      // focusNode: controller.passwordFocusNode,
                      isPassword: false,
                      isShowSuffixIcon: false,
                      textInputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => null,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// 2) Country selector

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.selectyourcountryfromthelist.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColor.lineColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(
                        value: selectedCountry.value.isEmpty ? null : selectedCountry.value,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                          hintText: MyStrings.selectyourcountryfromthelist.tr,

                        ),
                        hint: Text(
                          MyStrings.selectyourcountryfromthelist.tr,

                          style: TextStyle(
                            fontSize: 12,
                            color: MyColor.hintTextColor, // 👈 hint color
                          ),
                        ),
                        items: countries.map((c) {
                          return DropdownMenuItem(
                            value: c,
                            child: Obx(() => Text(
                              c,
                              style: TextStyle(
                                fontSize: 12,
                                color: (selectedCountry.value == c)
                                    ? MyColor.primaryColor // 👈 selected color
                                    : MyColor.hintTextColor, // 👈 unselected color
                              ),
                            )),
                          );
                        }).toList(),
                        onChanged: (v) {
                          if (v != null) selectedCountry.value = v;
                          countryController.text = v ?? '';
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              AppText(
                text: MyStrings.enteryourphonenumberdetails.tr,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w700,
                color: MyColor.colorWhite,
              ),

              const SizedBox(height: 20),

              // 3) Phone input: to match the screenshot the field is visible as a rounded white box.

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IntlPhoneField(
                  controller: phoneController,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  initialCountryCode: 'PK',
                  showDropdownIcon: true,
                  disableLengthCheck: true,
                  keyboardType: TextInputType.phone,
                  onChanged: (phone) {},
                  dropdownTextStyle: TextStyle(
                    fontSize: 14,
                    color: MyColor.hintTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '123 345 3454',
                    hintStyle: TextStyle(fontWeight: FontWeight.w600,color: MyColor.hintTextColor,
                      fontSize: AppDimensions.FONT_SIZE_14,),
                    isDense: true,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // thin divider like the screenshot
              const Divider(color: Colors.white70, thickness: 2),

              const SizedBox(height: 18),

              // Call me now button
              AppButton(
                buttonName: MyStrings.callmenow.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  // your call logic here (e.g., send data to backend or trigger call)
                  final issue = issueController.text.trim();
                  final country = selectedCountry.value;
                  final phone = phoneController.text.trim();
                  // Use your controller methods / GetX actions instead
                },
                elevation: 0,
                borderWidth: 1,
                //borderColor: Colors.white,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30),
              ),

              const SizedBox(height: 16),

              // Instructional text (matches the small grey text in the screenshot)
              Text(
                MyStrings.clickthecallmenow.tr,
                style: TextStyle(
                  color: MyColor.colorWhite.withOpacity(0.7),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),


    );
  }
}




