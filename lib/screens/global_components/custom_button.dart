import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final bool? isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed:
        isDisabled != null && isDisabled == true ? null : onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 20,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(isDisabled != null && isDisabled == true
              ? kHintColor
              : kPrimaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}