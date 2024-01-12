import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';

class SecondRegistrationProgressLine extends StatelessWidget {
  const SecondRegistrationProgressLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.17,
            ),
            Text(
              AppStrings.registerTitle,
              style:
              Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.completeDataTitle,
              style:
              Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kHintColor,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.115,
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Divider(
                    height: 0,
                    color: kPrimaryColor,
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Divider(
                    height: 0,
                    color: kProgressLineColor,
                    thickness: 2,
                    indent: 0,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 80,
              bottom: -12.5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const ShapeDecoration(
                      color: kPrimaryColor,
                      shape: OvalBorder(
                        side: BorderSide(
                            width: 2, color: kPrimaryColor),
                      ),
                    ),
                  ),
                  const Positioned(
                      right: 4,
                      left: 4,
                      bottom: 4,
                      top: 4,
                      child: Icon(
                        Icons.done_rounded,
                        color: kWhiteColor,
                        size: 16,
                      )),
                ],
              ),
            ),
            Positioned(
              right: 80,
              bottom: -12.5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const ShapeDecoration(
                      color: kWhiteColor,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 2, color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 9,
                    left: 9,
                    bottom: 4,
                    top: 4,
                    child: Text(
                      '2',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
