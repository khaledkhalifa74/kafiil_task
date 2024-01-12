import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_appbar.dart';
import 'package:kafiil_task/screens/global_components/custom_button.dart';
import 'package:kafiil_task/screens/global_components/first_registration_progress_line.dart';
import 'package:kafiil_task/screens/global_components/radio_button_with_text.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';
import 'package:kafiil_task/screens/prelogin/complete_register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  String? userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: AppStrings.registerTitle,
              ),
              const FirstRegistrationProgressLine(),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormFieldWithTitle(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.43,
                    title: AppStrings.firstNameTitle,
                  ),
                  const Spacer(),
                  TextFormFieldWithTitle(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.43,
                    title: AppStrings.lastNameTitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const TextFormFieldWithTitle(
                title: AppStrings.emailTitle,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormFieldWithTitle(
                maxLines: 1,
                title: AppStrings.passwordTitle,
                obscureText: !passwordVisible,
                suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kPrimaryIconColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormFieldWithTitle(
                maxLines: 1,
                title: AppStrings.confirmPasswordTitle,
                obscureText: !confirmPasswordVisible,
                suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kPrimaryIconColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppStrings.userTypeTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  RadioButtonWithText(
                      value: 'value1',
                      groupValue: userType,
                      onChanged: (newValue){
                        setState(() {
                          userType = newValue;
                        });
                      },
                      text: 'Seller',
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  RadioButtonWithText(
                    value: 'value2',
                    groupValue: userType,
                    onChanged: (newValue){
                      setState(() {
                        userType = newValue;
                      });
                    },
                    text: 'Buyer',
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  RadioButtonWithText(
                    value: 'value3',
                    groupValue: userType,
                    onChanged: (newValue){
                      setState(() {
                        userType = newValue;
                      });
                    },
                    text: 'Both',
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.42,
                    text: AppStrings.nextButtonTitle,
                    onPressed: () {
                      Navigator.pushNamed(context, CompleteRegisterScreen.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}