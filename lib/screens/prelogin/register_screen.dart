import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_state.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_cubit.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_state.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
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
  String? userType;
  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    DependenciesModel dependenciesModel = DependenciesCubit.get(context).dependenciesModel;
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state){
          return BlocConsumer<DependenciesCubit, DependenciesStates>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      key: registerFormKey,
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
                                controller: firstNameController,
                                width: MediaQuery.of(context).size.width * 0.43,
                                title: AppStrings.firstNameTitle,
                              ),
                              const Spacer(),
                              TextFormFieldWithTitle(
                                controller: lastNameController,
                                width: MediaQuery.of(context).size.width * 0.43,
                                title: AppStrings.lastNameTitle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
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
                            iconColor: kHintColor,
                            controller: passwordController,
                            maxLines: 1,
                            title: AppStrings.passwordTitle,
                            obscureText: AuthCubit.get(context).isPasswordShown,
                            suffixPressed: () {
                              AuthCubit.get(context).changePasswordVisibility();
                            },
                            suffixIcon: AuthCubit.get(context).passwordVisible,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormFieldWithTitle(
                            iconColor: kHintColor,
                            controller: confirmPasswordController,
                            maxLines: 1,
                            title: AppStrings.confirmPasswordTitle,
                            obscureText:
                            AuthCubit.get(context).isConfirmPasswordShown,
                            suffixPressed: () {
                              AuthCubit.get(context).changeConfirmPasswordVisibility();
                            },
                            suffixIcon: AuthCubit.get(context).confirmPasswordVisible,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            AppStrings.userTypeTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              RadioButtonWithText(
                                value: dependenciesModel.data?.types?[0].value.toString(),
                                groupValue: userType,
                                onChanged: (newValue) {
                                  setState(() {
                                    userType = newValue;
                                  });
                                },
                                text: dependenciesModel.data?.types?[0].label,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              RadioButtonWithText(
                                value: dependenciesModel.data?.types?[1].value.toString(),
                                groupValue: userType,
                                onChanged: (newValue) {
                                  setState(() {
                                    userType = newValue;
                                  });
                                },
                                text: dependenciesModel.data?.types?[1].label,

                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              RadioButtonWithText(
                                value: dependenciesModel.data?.types?[2].value.toString(),
                                groupValue: userType,
                                onChanged: (newValue) {
                                  setState(() {
                                    userType = newValue;
                                  });
                                },
                                text: dependenciesModel.data?.types?[2].label,
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
                                onPressed: () async {
                                  if (registerFormKey.currentState!.validate()) {
                                    if(passwordController.text == confirmPasswordController.text){
                                      Navigator.pushNamed(
                                          context, CompleteRegisterScreen.id,
                                          arguments: {
                                            'firstName' : firstNameController.text,
                                            'lastName' : lastNameController.text,
                                            'email' : emailController.text,
                                            'password' : passwordController.text,
                                            'confirmPassword' : confirmPasswordController.text,
                                            'userType' : int.parse(userType??'null'),
                                          });
                                    } else{
                                      showToast(
                                        toastMessage: "Passwords doesn't match",
                                        backgroundColor: kErrorBodyColor,
                                        textColor: kErrorColor,
                                      );
                                    }
                                  }
                                },
                                width: MediaQuery.of(context).size.width * 0.42,
                                text: AppStrings.nextButtonTitle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
