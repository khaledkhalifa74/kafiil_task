import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/client/cubits/auth_cubit/auth_state.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_cubit.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_state.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_button.dart';
import 'package:kafiil_task/screens/global_components/custom_floating_action_button.dart';
import 'package:kafiil_task/screens/global_components/fav_social_media.dart';
import 'package:kafiil_task/screens/global_components/radio_button_with_text.dart';
import 'package:kafiil_task/screens/global_components/second_registration_progress_line.dart';
import 'package:kafiil_task/screens/global_components/select_salary_field.dart';
import 'package:kafiil_task/screens/global_components/skills_body.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';
import '../global_components/custom_appbar.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});

  static String id = 'CompleteRegisterScreen';

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  GlobalKey<FormState> submitRegisterFormKey = GlobalKey();

  bool facebookCheckBoxValue = false;
  bool xCheckBoxValue = false;
  bool linkedinCheckBoxValue = false;
  File? selectedImage;
  int salary = 1000;
  String? gender;
  String male = '0';
  String female = '1';
  TextEditingController dateController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  List<String> selectedValue = [];
  List<String?> favSocial = <String?>[];

  @override
  void dispose() {
    dateController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    favSocial = [];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    DependenciesModel dependenciesModel =
        DependenciesCubit.get(context).dependenciesModel;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(
              toastMessage: AppStrings.loginSuccessMsg,
              backgroundColor: kPrimaryColor,
              textColor: kWhiteColor,
            );
            Navigator.pushReplacementNamed(context, WhoAmIScreen.id);
          }
          if (state is RegisterFailureState) {
            showToast(
              toastMessage: AppStrings.loginErrorMsg,
              backgroundColor: kErrorBodyColor,
              textColor: kErrorColor,
            );
          }
        },
        builder: (context, state) {
          return BlocConsumer<DependenciesCubit, DependenciesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: AppStrings.registerTitle,
                        ),
                        const SecondRegistrationProgressLine(),
                        const SizedBox(
                          height: 43,
                        ),
                        Center(
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                width: 83,
                                height: 83,
                                decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: selectedImage != null
                                          ? FileImage(selectedImage!)
                                          : Image.asset(
                                                  'assets/images/avatar.png')
                                              .image,
                                      fit: BoxFit.cover,
                                    ),
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                      color: kPrimaryColor,
                                    ))),
                              ),
                              CustomFloatingActionButton(
                                heroTag: "addButton",
                                icon: Icons.add_rounded,
                                buttonColor: kPrimaryColor,
                                iconColor: kWhiteColor,
                                onPressed: () {
                                  _pickImage();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                         TextFormFieldWithTitle(
                          controller: aboutController,
                          title: AppStrings.aboutTitle,
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SelectSalaryField(
                          salary: salary.toString(),
                          minusButtonPress: () {
                            setState(() {
                              salary--;
                            });
                          },
                          plusButtonPress: () {
                            setState(() {
                              salary++;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWithTitle(
                          controller: dateController,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(1800),
                              lastDate: DateTime(2050),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                dateController.text =
                                    DateFormat("yyyy-MM-dd", 'en')
                                        .format(selectedDate);
                              }
                            });
                          },
                          readOnly: true,
                          title: AppStrings.birthDateTitle,
                          suffixIcon: Icons.calendar_month_rounded,
                          iconColor: kPrimaryIconColor,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.genderTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                RadioButtonWithText(
                                  value: male,
                                  groupValue: gender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      gender = newValue;
                                    });
                                  },
                                  text: 'Male',
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                RadioButtonWithText(
                                  value: female,
                                  groupValue: gender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      gender = newValue;
                                    });
                                  },
                                  text: 'Female',
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SkillsBody(
                          selectedValue: selectedValue,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FavSocialMedia(
                          facebookTitle: dependenciesModel
                              .data!.socialMedia![0].label
                              .toString(),
                          twitterTitle: dependenciesModel
                              .data!.socialMedia![1].label
                              .toString(),
                          linkedinTitle: dependenciesModel
                              .data!.socialMedia![2].label
                              .toString(),
                          linkedinRadioValue: linkedinCheckBoxValue,
                          twitterRadioValue: xCheckBoxValue,
                          facebookRadioValue: facebookCheckBoxValue,
                          favList: favSocial,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          fallback: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                          builder: (context) => CustomButton(
                              text: AppStrings.submitButtonTitle,
                              onPressed: () async {
                                  AuthCubit.get(context).registerUser(
                                    firstName: arguments['firstName'],
                                    lastName: arguments['lastName'],
                                    email: arguments['email'],
                                    password: arguments['password'],
                                    confirmPassword:
                                        arguments['confirmPassword'],
                                    userType: arguments['userType'],
                                    avatar: selectedImage,
                                    about: aboutController.text,
                                    salary: salary,
                                    birthDate: dateController.text,
                                    gender: int.parse(gender ?? 'null'),
                                    skills: selectedValue,
                                    socialMedia: favSocial,
                                  );
               //////////// there was an server error in register request //////////
                              },
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
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

  Future _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(pickedImage!.path);
    });
  }
}
