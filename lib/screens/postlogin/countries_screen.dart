import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_bottom_nav_bar.dart';
import 'package:kafiil_task/screens/global_components/custom_data_row.dart';
import 'package:number_paginator/number_paginator.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  static String id = 'CountriesScreen';

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int currentPage = 0;
  int numberOfPages = 10;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(numberOfPages, (index) => Container());
    // Center(
    //    child: Text("Page number: ${index+1}",style: Theme.of(context).textTheme.titleLarge,),)
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(
              AppStrings.countriesTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: kShadowColor,
                    blurRadius: 40,
                    offset: Offset(0, 4),
                    spreadRadius: -5,
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: kFieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Country',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                        Text(
                          'Capital',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const CustomDataRow(
                          country: 'egypt',
                          capital: 'cairo',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            NumberPaginator(
              config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: kPrimaryColor,
                buttonUnselectedBackgroundColor: kWhiteColor,
                buttonUnselectedForegroundColor: kBlackColor,
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              numberPages: numberOfPages,
              onPageChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
