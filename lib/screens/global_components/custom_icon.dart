import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key, required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: kIconBGColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
