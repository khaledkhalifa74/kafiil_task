import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';

class ValidateErrorMessage extends StatelessWidget {
  const ValidateErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kErrorBodyColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.info_outline_rounded,
                  color: kErrorColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  AppStrings.validateErrorMessageTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kErrorColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
