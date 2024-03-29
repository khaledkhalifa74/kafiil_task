import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class RadioButtonWithText extends StatelessWidget {
  const RadioButtonWithText({super.key, this.value, required this.groupValue, required this.onChanged, this.text});

  final String? value;
  final String? groupValue;
  final void Function(String?) onChanged;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: kPrimaryColor,
          value: value??'null',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text??'null',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: kBlackColor,
          ),
        ),
      ],
    );
  }
}
