import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_icon.dart';
import 'package:kafiil_task/screens/global_components/social_media_item_with_checkbox.dart';

class FavSocialMedia extends StatefulWidget {
  const FavSocialMedia({
    super.key,
    required this.facebookTitle,
    required this.twitterTitle,
    required this.linkedinTitle,
    required this.linkedinRadioValue,
    required this.twitterRadioValue,
    required this.facebookRadioValue,
  });

  final bool facebookRadioValue;
  final bool twitterRadioValue;
  final bool linkedinRadioValue;
  final String facebookTitle;
  final String twitterTitle;
  final String linkedinTitle;

  @override
  State<FavSocialMedia> createState() => _FavSocialMediaState();
}

class _FavSocialMediaState extends State<FavSocialMedia> {
  bool? facebookRadioValue;
  bool? twitterRadioValue;
  bool? linkedinRadioValue;

  @override
  void initState() {
    facebookRadioValue = widget.facebookRadioValue;
    twitterRadioValue = widget.twitterRadioValue;
    linkedinRadioValue = widget.linkedinRadioValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.favouriteSocialMediaTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        SocialMediaItemWithCheckBox(
          title: widget.facebookTitle,
          icon: SvgPicture.asset(kFacebookIcon),
          radioValue: facebookRadioValue!,
          onChanged: (newValue) {
            setState(() {
              facebookRadioValue = newValue!;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SocialMediaItemWithCheckBox(
          title: widget.twitterTitle,
          icon: SvgPicture.asset(kTwitterIcon),
          radioValue: twitterRadioValue!,
          onChanged: (newValue) {
            setState(() {
              twitterRadioValue = newValue!;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SocialMediaItemWithCheckBox(
          title: widget.linkedinTitle,
          icon: const CustomIcon(
            icon: kLinkedinIcon,
          ),
          radioValue: linkedinRadioValue!,
          onChanged: (newValue) {
            setState(() {
              linkedinRadioValue = newValue!;
            });
          },
        ),
      ],
    );
  }
}
