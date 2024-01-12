import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class SocialMediaItemWithCheckBox extends StatelessWidget {
  const SocialMediaItemWithCheckBox({super.key, required this.title, required this.icon, required this.radioValue, required this.onChanged, this.widthIcon, this.heightIcon});
  final String title;
  final bool radioValue;
  final void Function(bool?) onChanged;
  final double? widthIcon;
  final double? heightIcon;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            value: radioValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        icon,
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kBlackColor,
              ),
        ),
      ],
    );
  }
}
