import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/screens/prelogin/login_screen.dart';

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
          locale:  const Locale('en'),
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: kPrimaryColor,
            hintColor: kSecondaryColor,
            fontFamily: "Montserrat",
            textTheme: TextTheme(
              titleLarge: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.w600,
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
            LoginScreen.id:(context)=> const LoginScreen(),
          },
        );
      },
    );
  }
}
