import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/postlogin/countries_screen.dart';
import 'package:kafiil_task/screens/postlogin/services_screen.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({super.key, required this.currentIndex});

  // late int currentIndex;
  late int currentIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // late int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 5,
        currentIndex: widget.currentIndex,
        onTap: (int newIndex) {
          setState(() {
            widget.currentIndex = newIndex;
            newIndex == 0
                ? Navigator.pushReplacementNamed(context, WhoAmIScreen.id)
                : newIndex == 1
                    ? Navigator.pushReplacementNamed(
                        context, CountriesScreen.id)
                    : Navigator.pushReplacementNamed(
                        context, ServicesScreen.id);
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: AppStrings.whoAmITitle,
              icon: Icon(Icons.account_circle_rounded)),
          BottomNavigationBarItem(
              label: AppStrings.countriesTitle,
              icon: Icon(Icons.dehaze_outlined)),
          BottomNavigationBarItem(
              label: AppStrings.servicesTitle,
              icon: Icon(Icons.shopping_cart_rounded)),
        ]);
  }
}
