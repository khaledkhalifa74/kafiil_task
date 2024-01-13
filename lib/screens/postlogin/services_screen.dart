import 'package:flutter/material.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/global_components/custom_bottom_nav_bar.dart';
import 'package:kafiil_task/screens/global_components/service_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  static String id = 'ServicesScreen';

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
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
              AppStrings.servicesTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                  itemBuilder: (context,index){
                    return const ServiceCard(
                      image: 'https://www.creativefabrica.com/wp-content/uploads/2021/06/06/AS-Logo-Design-Graphics-12998890-2-580x387.jpg',
                      cost: '100',
                      title: 'Logo Design -Graphic Design Graphic Design',
                      rate: '4.5',
                      salesCount: '20',
                    );
                  },
              ),
            ),
            Text(
              AppStrings.popularServicesTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return const ServiceCard(
                    image: 'https://www.creativefabrica.com/wp-content/uploads/2021/06/06/AS-Logo-Design-Graphics-12998890-2-580x387.jpg',
                    cost: '100',
                    title: 'Logo Design -Graphic Design Graphic Design',
                    rate: '4.5',
                    salesCount: '20',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
