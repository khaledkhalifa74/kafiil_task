import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';

class FirstRegistrationProgressLine extends StatelessWidget {
  const FirstRegistrationProgressLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.17,
            ),
            Text(
              AppStrings.registerTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.completeDataTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kHintColor,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.115,
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 80,
              bottom: -12.5,
              child: Container(
                width: 25,
                height: 25,
                decoration: const ShapeDecoration(
                  color: kProgressLineColor,
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 80,
              bottom: -12.5,
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    left: 10,
                    bottom: 4,
                    top: 4,
                    child: Text(
                      '1',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const ShapeDecoration(
                      //color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(
                    height: 0,
                    color: kPrimaryColor,
                    thickness: 2,
                    //endIndent: 1 ,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 0,
                    color: kProgressLineColor,
                    thickness: 2,
                    indent: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
