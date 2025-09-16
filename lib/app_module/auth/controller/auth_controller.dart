import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/models/error_model.dart';

class AuthController extends GetxController {
  bool submitLoading = false;
  var isLogin = true.obs;
  RxBool isChecked = false.obs;
  bool hasError = false;
  bool isLoading = true;
  String currentText = '';
  String userPhone = '';
  bool isProfileCompleteEnable = false;
  bool resendLoading = false;

  TextEditingController emailOrUsernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();


  bool checkPasswordStrength = false;

  void toggleLoginSignup() {
    isLogin.value = !isLogin.value;
    emailController.clear();
    passwordController.clear();
  }

  void loginUser() {
    // TODO: Implement login logic
    print("Logging in with ${emailController.text}");
  }

  void registerUser() {
    // TODO: Implement registration logic
    print("Registering ${emailController.text}");
  }

  void onForgotPassword() {
    // TODO: Forgot password logic
    print("Forgot Password clicked");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var acceptPrivacyPolicy = false.obs;

  void togglePasswordVisibility() => isPasswordHidden.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordHidden.toggle();


  void continueWithPhone() {
    Get.snackbar('Phone Auth', '----pressed');
  }

  // void continueWithGoogle() {
  //   Get.snackbar('Google Auth', '----pressed');
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> continueWithGoogle() async {
    try {
      // Trigger the authentication flow
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Get.snackbar("Cancelled", "Google sign-in was cancelled.");
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      await _auth.signInWithCredential(credential);

      Get.snackbar("Success", "Logged in with Google successfully.");
      Get.offAllNamed('/home'); // Navigate to home screen
    } catch (e) {
      Get.snackbar("Error", "Failed to login with Google: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed('/login'); // Navigate back to login screen
  }

  bool hasPasswordFocus = false;

  void changePasswordFocus(bool hasFocus) {
    hasPasswordFocus = hasFocus;
    // hasPasswordFocus = hasFocus;
    update();
  }

  List<ErrorModel> passwordValidationRules = [
    ErrorModel(text: "Has uppercase letter".tr, hasError: true),
    ErrorModel(text: "Has lower letter".tr, hasError: true),
    ErrorModel(text: "Has digits".tr, hasError: true),
    ErrorModel(text: "Has special characters".tr, hasError: true),
    ErrorModel(text: "Min of 6 characters".tr, hasError: true),
  ];
  // void updateValidationList(String value) {
  //   passwordValidationRules[0].hasError =
  //   value.contains(RegExp(r'[A-Z]')) ? false : true;
  //   passwordValidationRules[1].hasError =
  //   value.contains(RegExp(r'[a-z]')) ? false : true;
  //   passwordValidationRules[3].hasError =
  //   value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ? false : true;
  //   passwordValidationRules[4].hasError = value.length >= 6 ? false : true;
  //
  //   update();
  // }
  void updateValidationList(String value) {
    passwordValidationRules[0].hasError = !value.contains(RegExp(r'[A-Z]'));
    passwordValidationRules[1].hasError = !value.contains(RegExp(r'[a-z]'));
    passwordValidationRules[2].hasError = !value.contains(RegExp(r'[0-9]')); // <- Add this
    passwordValidationRules[3].hasError = !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    passwordValidationRules[4].hasError = value.length >= 6 ? false : true;
    update();
  }

  double get passwordStrength {
    int passedRules = passwordValidationRules.where((e) => !e.hasError).length;
    return passedRules / passwordValidationRules.length; // Range: 0.0 - 1.0
  }


  RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Enter your password'.tr;
    } else {
      if (checkPasswordStrength) {
        if (!regex.hasMatch(value)) {
          return 'Password must be contain 1 special character and number'.tr;
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
  }
}
