import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final double? width;
  final double? height;
  final int? maxLines;
  final bool? readOnly;
  final void Function()? onTap;

  const TextFormFieldWithTitle({
    super.key, required this.title, this.keyboardType, this.controller, this.suffixIcon, this.obscureText, this.width, this.height, this.maxLines, this.readOnly, this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: width?? MediaQuery.of(context).size.width,
          height: height ?? 56,
          child: TextFormField(
            onTap: onTap,
            readOnly: readOnly?? false,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                isDense: true,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: kFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                )
            ),
          ),
        ),
      ],
    );
  }
}
