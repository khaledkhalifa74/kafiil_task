import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_button.dart';
import 'package:kafiil_task/screens/global_components/custom_floating_action_button.dart';
import 'package:kafiil_task/screens/global_components/custom_icon.dart';
import 'package:kafiil_task/screens/global_components/fav_social_media.dart';
import 'package:kafiil_task/screens/global_components/radio_button_with_text.dart';
import 'package:kafiil_task/screens/global_components/second_registration_progress_line.dart';
import 'package:kafiil_task/screens/global_components/select_salary_field.dart';
import 'package:kafiil_task/screens/global_components/skills_body.dart';
import 'package:kafiil_task/screens/global_components/social_media_item_with_checkbox.dart';
import 'package:kafiil_task/screens/global_components/text_form_field_with_title.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../global_components/custom_appbar.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});

  static String id = 'CompleteRegisterScreen';

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  bool facebookCheckBoxValue = false;
  bool xCheckBoxValue = false;
  bool linkedinCheckBoxValue = false;
  File? selectedImage;
  int salary = 1000;
  String? gender;
  bool? male;
  bool? female;
  TextEditingController dateController = TextEditingController();
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

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

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
                                : Image.asset('assets/images/avatar.png').image,
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
              const TextFormFieldWithTitle(
                title: AppStrings.aboutTitle,
                height: 115,
                maxLines: 10,
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
                          DateFormat("yyyy-MM-dd", 'en').format(selectedDate);
                    }
                  });
                },
                readOnly: true,
                title: AppStrings.birthDateTitle,
                suffixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  color: kPrimaryIconColor,
                  size: 24,
                ),
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
              CustomButton(
                text: AppStrings.submitButtonTitle,
                onPressed: () {
                  Navigator.pushNamed(context, WhoAmIScreen.id);
                },
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
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
