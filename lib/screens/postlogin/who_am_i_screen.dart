import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_task/client/cubits/Who_cubit/who_cubit.dart';
import 'package:kafiil_task/client/cubits/Who_cubit/who_states.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_cubit.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_state.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
import 'package:kafiil_task/client/models/user_who_model.dart';
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

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController dateController = TextEditingController(
      text: DateFormat("yyyy-MM-dd", 'en').format(DateTime.now()));
  final TextEditingController aboutController = TextEditingController();

  File? selectedImage;
  bool passwordVisible = false;
  String? userType;
  List selectedValue = [];
  bool facebookCheckBoxValue = false;
  bool xCheckBoxValue = false;
  bool linkedinCheckBoxValue = false;
  String? gender;
  String male = '0';
  String female = '1';

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
    userType = 'value1';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    UserWhoModel userWhoModel =
        WhoCubit.get(context).userWhoModel;

    DependenciesModel dependenciesModel =
        DependenciesCubit.get(context).dependenciesModel;

    firstNameController.text = userWhoModel.data!.firstName.toString();
    lastNameController.text = userWhoModel.data!.lastName.toString();
    emailController.text = userWhoModel.data!.email.toString();
    aboutController.text = userWhoModel.data!.about.toString();
    salaryController.text = userWhoModel.data!.salary.toString();
    dateController.text = userWhoModel.data!.birthDate.toString();
    return BlocConsumer<WhoCubit,WhoStates>(
        builder: (context, state){
          return BlocConsumer<DependenciesCubit,DependenciesStates>(
            builder: (BuildContext context, DependenciesStates state) {
              return Scaffold(
                  bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
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
                                        image: NetworkImage(userWhoModel.data!.avatar.toString()),
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
                                  onPressed: () {},
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
                          // SkillsBody(
                          //   selectedValue: selectedValue,
                          //   items: skills,
                          // ),
                          const SizedBox(
                            height: 16,
                          ),
                          FavSocialMedia(
                            facebookTitle: 'Facebook',
                            twitterTitle: 'Twitter',
                            linkedinTitle: 'Linkedin',
                            linkedinRadioValue: linkedinCheckBoxValue,
                            twitterRadioValue: xCheckBoxValue,
                            facebookRadioValue: facebookCheckBoxValue, favList: [],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  )
              );
            },
            listener: (context, state) {  },
          );
        },
        listener: (context, state){},
    );
  }
}
