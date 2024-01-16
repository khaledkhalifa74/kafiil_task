import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppStrings {
  static const String loginTitle = "Account Login";
  static const String registerTitle = "Register";
  static const String whoAmITitle = "Who Am I";
  static const String countriesTitle = "Countries";
  static const String servicesTitle = "Services";
  static const String popularServicesTitle = "Popular Services";
  static const String completeDataTitle = "Complete Data";
  static const String firstNameTitle = "First Name";
  static const String lastNameTitle = "Last Name";
  static const String emailTitle = "Email Address";
  static const String passwordTitle = "Password";
  static const String confirmPasswordTitle = "Confirm Password";
  static const String userTypeTitle = "User Type";
  static const String aboutTitle = "About";
  static const String salaryTitle = "Salary";
  static const String birthDateTitle = "Birth Date";
  static const String genderTitle = "Gender";
  static const String skillsTitle = "Skills";
  static const String favouriteSocialMediaTitle = "Favourite Social Media";
  static const String rememberTitle = "Remember me";
  static const String forgotPasswordTitle = "Forgot Password?";
  static const String loginButtonTitle = "Login";
  static const String nextButtonTitle = "Next";
  static const String submitButtonTitle = "Submit";
  static const String dontHaveAccountTitle = "Don’t have an account ?";
  static const String validateErrorMessageTitle = "Fill the required fields";
  static const String loginSuccessMsg = "Login successfully";
  static const String loginErrorMsg = "Invalid email address or password";
}

void showToast({
  required String toastMessage,
  required Color backgroundColor,
  required Color textColor,
}) {
  Fluttertoast.showToast(
    msg: toastMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.spMin,
  );
}

String token = '';
