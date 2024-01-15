import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final bool? obscureText;
  final double? width;
  final double? height;
  final int? maxLines;
  final bool? readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function()? suffixPressed;
  final Color? iconColor;
  const TextFormFieldWithTitle({
    super.key,
    required this.title,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.obscureText,
    this.width,
    this.height,
    this.maxLines,
    this.readOnly,
    this.onTap,
    this.validator, this.suffixPressed, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: width ?? MediaQuery.of(context).size.width,
          child: TextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return 'Field is required';
              }
              return null;
            },
            onTap: onTap,
            readOnly: readOnly ?? false,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kErrorColor,
              ),
              suffixIcon: GestureDetector(
                onTap: suffixPressed,
                child: Icon(
                  suffixIcon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              filled: true,
              fillColor: kFieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
