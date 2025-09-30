import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/Widgets/custom_text_field.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/custom_widget/style.dart';
import '../../utils/text_strings.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  File? _profileImage;
  final picker = ImagePicker();

  final TextEditingController firstNameCtrl = TextEditingController(text: "");
  final TextEditingController lastNameCtrl = TextEditingController(text: "");
  final TextEditingController emailCtrl = TextEditingController(text: "");

  Future<void> _pickImage() async {
    final pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            border: Border.all(color: MyColor.colorGrey, width: 0.5),
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library,color: MyColor.secondaryColor,),
                title: AppText(
                  text: MyStrings.pickfromgallery.tr,
                  size: AppDimensions.FONT_SIZE_16,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
                onTap: () async {
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context, picked);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt,color: MyColor.secondaryColor,),
                title: AppText(
                  text: MyStrings.takeaphoto.tr,
                  size: AppDimensions.FONT_SIZE_16,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
                onTap: () async {
                  final picked = await picker.pickImage(source: ImageSource.camera);
                  Navigator.pop(context, picked);
                },
              ),
            ],
          ),
        ),
      ),
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showProfileUpdatedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _buildDialog(
          icon: SizedBox(
            width: 55,
            height: 55, // Add height constraint
            child: Image.asset(MyImages.profileupdated,height: 55,),
          ),
          //iconColor: Colors.green,
          title:  MyStrings.profileupdated.tr,
          message: MyStrings.yourprofilehasbeensuccessfully.tr,
          buttonText: MyStrings.confirm.tr,
          onPressed: () => Navigator.pop(context),
        );
      },
    );
  }
  void _showProfileFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _buildDialog(
          icon: Image.asset(MyImages.profileupdatefailed, width: 55,),
          //iconColor: Colors.red,
          title:  MyStrings.profileupdatedfailed.tr,
          message: MyStrings.oopstherearesomethingwrong.tr,
          buttonText: MyStrings.tryagain.tr,
          onPressed: () => Navigator.pop(context),
          extraButton: TextButton(
            onPressed: () => Navigator.pop(context),
            child:  Text(MyStrings.cancel.tr, style: TextStyle(color: Colors.black)),
          ),
        );
      },
    );
  }



  Widget _buildDialog({
    required Widget icon,
   // required Color iconColor,
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onPressed,
    Widget? extraButton,
  }) {
    return Dialog(
      backgroundColor: MyColor.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SizedBox(width: 100, height: 100, child: icon),
            ),

            const SizedBox(height: 20),
            AppText(
              text: title,
              size: AppDimensions.FONT_SIZE_18,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 8),
            AppText(
              text: message,
              size: AppDimensions.FONT_SIZE_14,
              textAlign: TextAlign.center,
              color: Colors.grey.shade700,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: MyColor.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: onPressed,
              child: Text(buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
            if (extraButton != null) ...[
              const SizedBox(height: 10),
              extraButton,
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorWhite.withOpacity(0.95),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        title: AppText(
          text: MyStrings.editprofile.tr,
          size: AppDimensions.FONT_SIZE_16,
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
          padding: Dimensions.defaultPaddingHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// Red warning text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 20),
                    const SizedBox(width: 6),
                    Expanded(
                      child: AppText(
                        text: MyStrings.addprofilepictureto.tr,
                        size: AppDimensions.FONT_SIZE_12,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// Profile Picture
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                height: 150,
                child: Stack(
                  clipBehavior: Clip.none, // Important for proper overlapping
                  children: [
                    // CircleAvatar centered
                    Positioned(
                      top: 0, // Center vertically (150 height - 100 circle height) / 2 = 25
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? SvgPicture.asset(MyImages.profileplaceholder,width: 35,)
                            : null,
                      ),
                    ),
                    // Edit button positioned to overlap bottom of CircleAvatar
                    Positioned(
                      top: 80, // 25 (top position) + 50 (radius) - overlap amount
                      left: 0,
                      right: 0,
                      child: Center(
                        child: InkWell(
                          onTap: _pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: MyColor.colorWhite, width: 3),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 15,
                              child: const Icon(Icons.edit_outlined,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // first name
              AppText(
                text: MyStrings.firstname.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.primaryColor,
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                fillColor: MyColor.colorWhite,
                hintText: 'Sana',
               controller: firstNameCtrl,
                //focusNode: controller.emailFocusNode,
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                //nextFocus: controller.passwordFocusNode,
                //textInputType: TextInputType.emailAddress,
                radius: 15,
                inputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return MyStrings.emailvalidationtext.tr;
                  }

                  return null;
                },
                onChanged: (value) {
                  return;
                },
              ),


              const SizedBox(height: 16),
              AppText(
                text: MyStrings.lastname.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.primaryColor,
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),

              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 15,
                fillColor: MyColor.colorWhite,
                hintText: 'Niaz',
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                controller: lastNameCtrl,
               // focusNode: controller.passwordFocusNode,
                isPassword: false,
                isShowSuffixIcon: true,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  // If not empty, check if it's a valid email
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return MyStrings.emailvalidationtext.tr;
                  }

                  return null;
                },
                onChanged: (value) {
                  return;
                },
              ),
              const SizedBox(height: 16),
              AppText(
                text: MyStrings.emailaddress.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.primaryColor,
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),
              CustomTextField(
                animatedLabel: false,
                enableInteractiveSelection: true,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 15,
                fillColor: MyColor.colorWhite,
                 hintText: "abc@imperial.com",
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                controller: emailCtrl,
               // focusNode: controller.passwordFocusNode,
                //isPassword: true,
                isShowSuffixIcon: true,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  // If not empty, check if it's a valid email
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return MyStrings.emailvalidationtext.tr;
                  }

                  return null;
                },
                onChanged: (value) {
                  return;
                },
              ),

              const SizedBox(height: 40),

              /// Save Button
              AppButton(
                buttonName: MyStrings.savechanges.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  // Simulate success or failure
                  if (firstNameCtrl.text.isNotEmpty &&
                      lastNameCtrl.text.isNotEmpty &&
                      emailCtrl.text.isNotEmpty) {
                    _showProfileUpdatedDialog(context);
                  } else {
                    _showProfileFailedDialog(context);
                  }
                },
                elevation: 0,
                borderWidth: 1,
                borderColor: Colors.white,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30), // Stadium shape
              ),
            ],
          ),
        ),
      ),
    );
  }

}
