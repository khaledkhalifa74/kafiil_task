import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class CustomDataRow extends StatelessWidget {
  const CustomDataRow({super.key, required this.country, required this.capital});
  final String country;
  final String capital;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              country,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              capital,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          height: 0,
          color: kDividerColor,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
