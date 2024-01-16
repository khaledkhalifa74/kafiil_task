import 'package:flutter/material.dart';
import 'package:kafiil_task/client/services/local/cashe_helper.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';

class RememberUserOption extends StatefulWidget {
  const RememberUserOption({super.key});
  @override
  State<RememberUserOption> createState() => _RememberUserOptionState();
}

class _RememberUserOptionState extends State<RememberUserOption> {
  bool checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }
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
            value: checkBoxValue,
            onChanged: (newValue) {
              setState(() {
                checkBoxValue = newValue!;
                if(checkBoxValue == true){
                  CasheHelper.saveData(key: 'login', value: true);
                }
              });
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          AppStrings.rememberTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Text(
          AppStrings.forgotPasswordTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
