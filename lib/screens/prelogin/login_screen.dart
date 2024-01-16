import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_state.dart';
import 'package:kafiil_task/client/services/local/cashe_helper.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_appbar.dart';
import 'package:kafiil_task/screens/global_components/custom_button.dart';
import 'package:kafiil_task/screens/global_components/register_option.dart';
import 'package:kafiil_task/screens/global_components/remember_user_option.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';
import '../../global_helpers/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top],
    );
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
              toastMessage: AppStrings.loginSuccessMsg,
              backgroundColor: kPrimaryColor,
              textColor: kWhiteColor,
            );
            if (kDebugMode) {
              print(state.loginModel.accessToken);
            }
            CasheHelper.saveData(
              key: 'token',
              value: state.loginModel.accessToken,
            ).then(
              (value) =>
                  Navigator.pushReplacementNamed(context, WhoAmIScreen.id),
            );
          }
          if (state is LoginFailureState) {
            showToast(
              toastMessage: AppStrings.loginErrorMsg,
              backgroundColor: kErrorBodyColor,
              textColor: kErrorColor,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: loginFormKey,
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
                      TextFormFieldWithTitle(
                        controller: emailController,
                        title: AppStrings.emailTitle,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormFieldWithTitle(
                        maxLines: 1,
                        controller: passwordController,
                        title: AppStrings.passwordTitle,
                        obscureText: AuthCubit.get(context).isPasswordShown,
                        suffixPressed: () {
                          AuthCubit.get(context).changePasswordVisibility();
                        },
                        suffixIcon: AuthCubit.get(context).passwordVisible,
                        iconColor: kHintColor,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const RememberUserOption(),
                      const SizedBox(
                        height: 32,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (BuildContext context) =>
                            const Center(child: CircularProgressIndicator()),
                        builder: (context) => CustomButton(
                          text: AppStrings.loginButtonTitle,
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              AuthCubit.get(context).loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const RegisterOption(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
