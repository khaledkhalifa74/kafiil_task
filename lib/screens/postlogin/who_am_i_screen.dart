import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_bottom_nav_bar.dart';
import 'package:kafiil_task/screens/global_components/custom_floating_action_button.dart';
import 'package:kafiil_task/screens/global_components/fav_social_media.dart';
import 'package:kafiil_task/screens/global_components/radio_button_with_text.dart';
import 'package:kafiil_task/screens/global_components/skills_body.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({super.key});

  static String id = 'WhoAmIScreen';

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {

  final TextEditingController firstNameController = TextEditingController(
      text: 'Khaled');
  final TextEditingController lastNameController = TextEditingController(
      text: 'Khalifa');
  final TextEditingController emailController = TextEditingController(
      text: 'KhaledKhalifa@gmail.com');
  final TextEditingController passwordController = TextEditingController(
      text: 'Kh@lifaa74');
  final TextEditingController salaryController = TextEditingController(
      text: 'SAR 4500');
  final TextEditingController dateController = TextEditingController(
      text: DateFormat("yyyy-MM-dd", 'en').format(DateTime.now()));
  final TextEditingController aboutController = TextEditingController(
      text: 'Lorem ipsum dolor sit amet consectetur. Odio urna sed velit et sed quis. Enim ut sed. sed quis. Enim ut sed.');

  File? selectedImage;
  bool passwordVisible = false;
  String? userType;
  String? gender;
  bool? male;
  bool? female;
  List skills = [
    'Programming1',
    'Football1',
    'Programming2',
    'Football2',
    'Basketball1',
    'Programming3',
    'Football3',
    'Basketball2',
    'Football4',
    'Basketball5',
    'Programming6',
    'Football7',
    'Basketball8',
  ];
  List selectedValue = [];
  bool facebookCheckBoxValue = false;
  bool xCheckBoxValue = false;
  bool linkedinCheckBoxValue = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    aboutController.dispose();
    salaryController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    gender = male.toString();
    userType = 'value1';
    //firstNameController.text = 'Ahmed';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                ),
                Text(
                  AppStrings.whoAmITitle,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(
                  height: 32,
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
                                  : Image
                                  .asset('assets/images/avatar.png')
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
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldWithTitle(
                      controller: firstNameController,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.43,
                      title: AppStrings.firstNameTitle,
                    ),
                    const Spacer(),
                    TextFormFieldWithTitle(
                      controller: lastNameController,
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
                TextFormFieldWithTitle(
                  controller: emailController,
                  title: AppStrings.emailTitle,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWithTitle(
                  controller: passwordController,
                  maxLines: 1,
                  title: AppStrings.passwordTitle,
                  // obscureText: AuthCubit.get(context).isPasswordShown,
                  // suffixPressed: () {
                  //   AuthCubit.get(context).changePasswordVisibility();
                  // },
                  // suffixIcon: AuthCubit.get(context).passwordVisible,
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          onChanged: (newValue) {
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
                          onChanged: (newValue) {
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
                          onChanged: (newValue) {
                            setState(() {
                              userType = newValue;
                            });
                          },
                          text: 'Both',
                        ),
                      ],
                    ),
                  ],
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
                TextFormFieldWithTitle(
                  controller: salaryController,
                  title: AppStrings.salaryTitle,
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
                            DateFormat("yyyy-MM-dd", 'en').format(selectedDate);
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
                          value: male == true ? '0' : '1',
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
                          value: female == true ? '1' : '0',
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
                  skills: skills,
                ),
                const SizedBox(
                  height: 16,
                ),
                FavSocialMedia(
                  facebookTitle: 'Facebook',
                  twitterTitle: 'Twitter',
                  linkedinTitle: 'Linkedin',
                  linkedinRadioValue: linkedinCheckBoxValue,
                  twitterRadioValue: xCheckBoxValue,
                  facebookRadioValue: facebookCheckBoxValue,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        )
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
