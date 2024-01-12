import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppBar({
    super.key, required this.title, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
