import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key, required this.icon, required this.buttonColor, required this.iconColor, required this.onPressed, this.heroTag,
  });
  final IconData icon;
  final Color buttonColor;
  final Color iconColor;
  final void Function() onPressed;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: FloatingActionButton(
        heroTag: heroTag,
        elevation: 2,
        onPressed: onPressed,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
        backgroundColor: buttonColor,
        child: Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
      ),
    );
  }
}
