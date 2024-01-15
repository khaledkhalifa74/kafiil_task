import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/prelogin/register_screen.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            AppStrings.dontHaveAccountTitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kSecondaryColor,
            )
        ),
        TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              overlayColor: MaterialStateProperty.all(kFieldColor)
          ),
          onPressed: (){
            Navigator.pushNamed(context, RegisterScreen.id);
          },
          child: Text(
            AppStrings.registerTitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
