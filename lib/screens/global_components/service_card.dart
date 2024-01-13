import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_task/global_helpers/constants.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.image, required this.cost, required this.title, required this.rate, required this.salesCount});
  final String image;
  final String cost;
  final String title;
  final String rate;
  final String salesCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: Stack(
        children: [
          Container(
            height: 195,
            width: MediaQuery.of(context).size.width*0.50,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: kShadowColor,
                  blurRadius: 50,
                  offset: Offset(0, 4),
                  spreadRadius: -5,
                )
              ],
            ),
          ),
          Positioned(
            left: 3,
            right: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                height: 115,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 9,
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(27),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              child: Text(
                "\$$cost",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kWhiteColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 9,
            child: SizedBox(
              width: 150,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
            top: 160,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(kStarIcon),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '($rate)',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kRateColor,
                  ),
                ),
                const SizedBox(
                  height: 12,
                  child: VerticalDivider(
                    color: kSecondaryIconColor,
                  ),
                ),
                SvgPicture.asset(kCartIcon),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  salesCount,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kSalesCountColor,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
