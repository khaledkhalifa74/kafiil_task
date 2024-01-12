import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_floating_action_button.dart';

class SelectSalaryField extends StatelessWidget {
  const SelectSalaryField({
    super.key, required this.minusButtonPress, required this.plusButtonPress, required this.salary,
  });
  final void Function() minusButtonPress;
  final void Function() plusButtonPress;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.salaryTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 41,
          ),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kFieldColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFloatingActionButton(
                heroTag: "minusButton",
                icon: Icons.remove_rounded,
                buttonColor: kWhiteColor,
                iconColor: kPrimaryColor,
                onPressed: minusButtonPress,
              ),
              Row(
                children: [
                  Text(
                    'SAR ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    salary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              CustomFloatingActionButton(
                heroTag: "plusButton",
                icon: Icons.add_rounded,
                buttonColor: kWhiteColor,
                iconColor: kPrimaryColor,
                onPressed: plusButtonPress,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
