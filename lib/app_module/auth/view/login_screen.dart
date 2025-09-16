import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import '../../home/home_view.dart';
import '../controller/auth_controller.dart';
import 'forget_password_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1C36),
              Color(0xFF111F35),
              Color(0xff000000),
              Color(0xff011c0d),
              Color(0xff022511),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Section with Profile
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.black, size: 30,),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Burair",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        SvgPicture.asset(
                          "assets/logo/imperialtv.svg",
                          height: 80,
                        ),
                        const SizedBox(height: 12),

                        // Tagline
                        Text(
                          "Join millions of people using\nImperial App every day to stay on\ntop of Movie Streaming Apps",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Username

                        TextField(
                          controller: controller.emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password
                        TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Keep signed in + Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: keepSignedIn,
                                  onChanged: (val) {
                                    setState(() {
                                      keepSignedIn = val ?? false;
                                    });
                                  },
                                  side: const BorderSide(color: Colors.white),
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                ),
                                const Text(
                                  "Keep me signed in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            CustomUnderlineText(
                              text: "Forgot Password?",
                              onTap: () => Get.to(() => ForgetPasswordScreen()),
                              color: Colors.white,
                              underlineGap: 3, // control spacing
                              underlineThickness: 1,
                            ),



                          ],
                        ),
                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF61C8C2),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => MyHomePage());
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => Get.to(() => const SignUpScreen()),
                        child: const Text(
                          "Sign Up Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class CustomUnderlineText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double fontSize;
  final double underlineGap;
  final double underlineThickness;

  const CustomUnderlineText({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.white,
    this.fontSize = 14,
    this.underlineGap = 4,
    this.underlineThickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -underlineGap, // moves underline downward
            child: Container(
              height: underlineThickness,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}




//
// class login extends StatelessWidget {
//   const login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final AuthController controller = Get.put(AuthController());
//
//     return Scaffold(
//       backgroundColor:  MyColor.colorWhite,
//       extendBody: true,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight + 20), // Extra height for curve
//         child: Container(
//           decoration: BoxDecoration(
//             color: MyColor.colorWhite,
//             border: Border(
//               bottom: BorderSide(
//                   color:  MyColor.borderColor.withValues(alpha: 0.9),
//                   width: 1), // Top color
//             ),
//           ),
//           child: AppBar(
//             automaticallyImplyLeading: false,
//             backgroundColor: Colors.transparent, // Important: transparent to show container color
//             elevation: 0,
//             surfaceTintColor: Colors.transparent,
//             title: Image.asset(MyImages.appLogopng, height: 45, width: 100),
//             centerTitle: false,
//           ),
//         ),
//       ),
//       body:  Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: Dimensions.space25),
//                     Text(
//                       'Sign in'.tr,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color:  MyColor.colorBlack,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: Dimensions.space25),
//                     // Don't have an account
//                     Row(
//                       children: [
//                         Text(
//                           "Don't have an account? ".tr,
//                           style: TextStyle(color:  MyColor.colorBlack,
//                             fontSize: 16,),
//                         ),
//                         GestureDetector(
//                           onTap: () => Get.to(() => SignUpScreen()),
//                           child: Text(
//                             'Sign Up'.tr,
//                             style: TextStyle(
//                               fontSize: 16,
//                               color:  MyColor.primaryColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: Dimensions.space25),
//                     CustomTextField(
//                       animatedLabel: false,
//                       needOutlineBorder: true,
//                       hintText:  "Email address".tr,
//                       //labelText: "Email address".tr,
//                       controller: controller.emailController,
//                       focusNode: controller.emailFocusNode,
//                       textInputType: TextInputType.emailAddress,
//                       nextFocus: controller.passwordFocusNode,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter email".tr;
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (value) {
//                         return;
//                       },
//                     ),
//                     SizedBox(height: Dimensions.space25),
//                     Focus(
//                         onFocusChange: (hasFocus) {
//                           controller.changePasswordFocus(hasFocus);
//                         },
//                         child: CustomTextField(
//                           animatedLabel: false,
//                           needOutlineBorder: true,
//                           isShowSuffixIcon: true,
//                           isPassword: true,
//                           hintText: 'Password'.tr,
//                           controller: controller.passwordController,
//                           focusNode: controller.passwordFocusNode,
//                           nextFocus: controller.emailFocusNode,
//                           textInputType: TextInputType.text,
//                           onChanged: (value) {
//                             if (controller.checkPasswordStrength) {
//                               controller.updateValidationList(value);
//                             }
//                           },
//                           validator: (value) {
//                             return controller.validatePassword(value ?? '');
//                           },
//                         )),
//                     SizedBox(height: Dimensions.space25),
//                     // Forgot Password
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => ForgetPasswordScreen());
//                       },
//                       child: Text('Forgot Password?'.tr,
//                           style: TextStyle(color:  MyColor.primaryColor,)),
//                     ),
//                     SizedBox(height: Dimensions.space25),
//                     //loginbutton
//                     RoundedButton(
//                       color: MyColor.primaryColor,
//                       borderColor: MyColor.primaryColor,
//                       isLoading: controller.submitLoading,
//                       text:"Continue".tr,
//                       textStyle: boldExtraLarge.copyWith(
//                         fontSize: 16,
//                         color: MyColor.colorWhite,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       press: () async {
//                         Get.to(() => MyHomePage());
//                         //controller.loginUser();
//                       },
//                     ),
//                     SizedBox(height: Dimensions.space20),
//                     //Divider
//                     Row(
//                       children: [
//                          Expanded(
//                           child: Divider(
//                             thickness: 1,
//                             color:  MyColor.borderColor.withValues(alpha: 0.9),
//                             endIndent: 10,
//                           ),
//                         ),
//                         Text(
//                           'or'.tr,
//                           style: TextStyle(
//                             color: Colors.grey[700],
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                          Expanded(
//                           child: Divider(
//                             thickness: 1,
//                             color: MyColor.borderColor.withValues(alpha: 0.9),
//                             indent: 10,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: Dimensions.space20),
//                     // Continue with google & facebook
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             controller.continueWithGoogle();
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(vertical: 15),
//                             width: Get.width *0.36,
//                             decoration: BoxDecoration(
//                                 color: MyColor.colorWhite,
//                                 border: Border.all(
//                                   width: 1,
//                                   color:  MyColor.borderColor.withValues(alpha: 0.9),
//                                 ),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: Get.height *0.02,
//                                   width: Get.width *0.04,
//                                     decoration: BoxDecoration(
//                                         color: MyColor.colorRed2.withAlpha(70),
//                                         borderRadius: BorderRadius.circular(100)),
//                                 ),
//                                 SizedBox(width: Dimensions.space5),
//                                 AppText(
//                                   text: 'Google'.tr,
//                                   style: semiBoldMediumLarge.copyWith(
//                                       color: MyColor.colorBlack,
//                                       fontSize: Dimensions.fontLarge),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: Dimensions.space30),
//                         GestureDetector(
//                           onTap: (){
//                             controller.continueWithPhone();
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(vertical: 15),
//                             width: Get.width *0.36,
//                             decoration: BoxDecoration(
//                                 color: MyColor.colorWhite,
//                                 border: Border.all(
//                                   width: 1,
//                                   color:  MyColor.borderColor.withValues(alpha: 0.9),
//                                 ),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: Get.height *0.02,
//                                   width: Get.width *0.04,
//                                   decoration: BoxDecoration(
//                                       color: Colors.blue,
//                                       borderRadius: BorderRadius.circular(100)),
//                                 ),
//                                 SizedBox(width: Dimensions.space5),
//                                 AppText(
//                                   text: 'Facebook'.tr,
//                                   style: semiBoldMediumLarge.copyWith(
//                                       color: MyColor.colorBlack,
//                                       fontSize: Dimensions.fontLarge),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: Dimensions.space100),
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         style: regularExtraLarge.copyWith(
//                             color: MyColor.rideSub,
//                             fontSize: Dimensions.fontLarge),
//                         children: [
//                           TextSpan(text: 'Protected by reCAPTCHA and subject to the\n'),
//                           TextSpan(text: 'Prism '),
//                           TextSpan(
//                             text: 'Privacy Policy',
//                             style: regularExtraLarge.copyWith(
//                                 color: MyColor.primaryColor,
//                                 fontSize: Dimensions.fontLarge),
//                           ),
//                           TextSpan(text: ' and ',
//                             style: regularExtraLarge.copyWith(
//                                 color: MyColor.rideSub,
//                                 fontSize: Dimensions.fontLarge),),
//                           TextSpan(
//                             text: 'Terms of Service. .',
//                             style: regularExtraLarge.copyWith(
//                                 color: MyColor.primaryColor,
//                                 fontSize: Dimensions.fontLarge),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: Dimensions.space45),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
