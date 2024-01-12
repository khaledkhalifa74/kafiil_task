import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_appbar.dart';
import 'package:kafiil_task/screens/global_components/custom_button.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';
import 'package:kafiil_task/screens/prelogin/register_screen.dart';

import '../../global_helpers/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top],
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: AppStrings.loginTitle,
              ),
              Center(
                child: SvgPicture.asset(kLoginImage),
              ),
              const SizedBox(
                height: 20,
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
                      size: 18,
                      color: kPrimaryIconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      side: const BorderSide(
                        color: kSecondaryColor,
                        width: 0.5,
                      ),
                      activeColor: kPrimaryColor,
                      value: checkBoxValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkBoxValue = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppStrings.rememberTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: AppStrings.loginButtonTitle,
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAccountTitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kSecondaryColor,
                    )
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
                      overlayColor: MaterialStateProperty.all(kFieldColor)
                    ),
                      onPressed: (){
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: Text(
                          AppStrings.registerTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
