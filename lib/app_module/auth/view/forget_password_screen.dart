import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/round_button.dart';
import '../../../utils/custom_widget/style.dart';
import '../controller/auth_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: MyColor.colorWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 20), // Extra height for curve
            child: Container(
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                border: Border(
                  bottom: BorderSide(
                      color:  MyColor.borderColor.withValues(alpha: 0.9),
                      width: 1), // Top color
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent, // Important: transparent to show container color
                elevation: 0,
                title: Image.asset(MyImages.appLogopng, height: 45, width: 100),
                centerTitle: false,
                surfaceTintColor: Colors.transparent,
                leading: Container(
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios, color: MyColor.primaryTextColor),
                  ),
                ),
              ),
            ),
          ),
          body: GetBuilder<AuthController>(
            builder: (auth) => SingleChildScrollView(
              //padding: Dimensions.screenPaddingHV,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:Dimensions.space20),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                          top: Dimensions.space20,
                          start: Dimensions.space20,
                          end: Dimensions.space20,
                          bottom: Dimensions.space20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:Dimensions.space20),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("Forgot Password?".tr,
                                    style: boldExtraLarge.copyWith(
                                        fontSize: Dimensions.fontExtraLarge + 7))),
                            const SizedBox(height: Dimensions.space10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("No worriest! Just enter your emailand we'll send you a reset password link.".tr,
                                style: regularDefault.copyWith(
                                    color: MyColor.getBodyTextColor(),
                                    fontSize: Dimensions.fontLarge),
                                textAlign: TextAlign.start,),
                              //heightFactor: 1,
                            ),
                            const SizedBox(height: Dimensions.space40),
                            CustomTextField(
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText:"Username or Email".tr,
                              hintText: ""
                                  "abc@gmail.com".tr,
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              controller: auth.emailOrUsernameController,
                              onSuffixTap: () {},
                              onChanged: (value) {
                                return;
                              },
                              validator: (value) {
                                if (auth
                                    .emailOrUsernameController.text.isEmpty) {
                                  return "Enter username or email".tr;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: Dimensions.space25),
                            RoundedButton(
                              color: MyColor.primaryColor,
                              borderColor: MyColor.primaryColor,
                              isLoading: controller.submitLoading,
                              text:"Send Recovery Email".tr,
                              textStyle: boldExtraLarge.copyWith(
                                fontSize: 16,
                                color: MyColor.colorWhite,
                                fontWeight: FontWeight.w500,
                              ),
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  //auth.submitForgetPassCode();
                                }                              },
                            ),
                            const SizedBox(height: Dimensions.space40),
                            GestureDetector(
                              onTap: () => Get.to(() => SignUpScreen()),
                              child: Center(
                                child: Text(
                                  'Sign Up'.tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:  MyColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 0.4,
                                    //decorationColor: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
