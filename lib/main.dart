import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/screens/postlogin/countries_screen.dart';
import 'package:kafiil_task/screens/postlogin/services_screen.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';
import 'package:kafiil_task/screens/prelogin/complete_register_screen.dart';
import 'package:kafiil_task/screens/prelogin/login_screen.dart';
import 'package:kafiil_task/screens/prelogin/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // arabic
          ],
          locale: const Locale('en'),
          theme: ThemeData(
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: kPrimaryColor,
                onPrimary: kWhiteColor,
                secondary: kSecondaryColor,
                onSecondary: kSecondaryColor,
                error: kErrorBodyColor,
                onError: kErrorColor,
                background: kWhiteColor,
                onBackground: kWhiteColor,
                surface: kWhiteColor,
                onSurface: kHintColor,
            ),
            datePickerTheme: const DatePickerThemeData(
              surfaceTintColor: kPrimaryColor,
              elevation: 0,
              headerForegroundColor: kBlackColor,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: kBlackColor,
              selectionColor: kWhiteColor,
              selectionHandleColor: kBlackColor,
            ),
            scaffoldBackgroundColor: kWhiteColor,
            useMaterial3: true,
            primaryColor: kPrimaryColor,
            hintColor: kSecondaryColor,
            unselectedWidgetColor: kHintColor,
            fontFamily: "Montserrat",
            textTheme: TextTheme(
              titleLarge: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 18.spMin,
              ),
              titleMedium: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.spMin,
              ),
              bodyLarge: TextStyle(
                color: kBlackColor,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
              ),
              bodyMedium: TextStyle(
                color: kWhiteColor,
                fontSize: 14.spMin,
                fontWeight: FontWeight.w500,
              ),
              bodySmall: TextStyle(
                color: kBlackColor,
                fontSize: 12.spMin,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context) => const LoginScreen(),
            RegisterScreen.id: (context) => const RegisterScreen(),
            CompleteRegisterScreen.id: (context) => const CompleteRegisterScreen(),
            WhoAmIScreen.id: (context) => const WhoAmIScreen(),
            CountriesScreen.id: (context) => const CountriesScreen(),
            ServicesScreen.id: (context) => const ServicesScreen(),
          },
        );
      },
    );
  }
}
