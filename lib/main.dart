import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/client/cubits/Who_cubit/who_cubit.dart';
import 'package:kafiil_task/client/cubits/Who_cubit/who_states.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_cubit.dart';
import 'package:kafiil_task/client/cubits/dependencies_cubit/dependencies_state.dart';
import 'package:kafiil_task/client/models/dependencies_model.dart';
import 'package:kafiil_task/client/services/local/cashe_helper.dart';
import 'package:kafiil_task/client/services/remote/dio_helper.dart';
import 'package:kafiil_task/client/cubits/simple_bloc_observer.dart';
import 'package:kafiil_task/global_helpers/constants.dart';
import 'package:kafiil_task/global_helpers/globals.dart';
import 'package:kafiil_task/screens/postlogin/countries_screen.dart';
import 'package:kafiil_task/screens/postlogin/services_screen.dart';
import 'package:kafiil_task/screens/postlogin/who_am_i_screen.dart';
import 'package:kafiil_task/screens/prelogin/complete_register_screen.dart';
import 'package:kafiil_task/screens/prelogin/login_screen.dart';
import 'package:kafiil_task/screens/prelogin/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CasheHelper.init();
  bool isLogin = CasheHelper.getData(key: 'login');
  token = CasheHelper.getData(key: 'token');
  if (kDebugMode) {
    print (isLogin);
  }
  runApp( MyApp(
    isLogin : isLogin,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DependenciesCubit()..getDependencies(),
        ),
        BlocProvider(
            create: (context) => WhoCubit()..getUserWhoData(),
        ),
      ],
      child: BlocConsumer<DependenciesCubit,DependenciesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<WhoCubit,WhoStates>(
            listener: (context, state){},
            builder: (context, state){
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
                      Locale('en'),
                    ],
                    locale: const Locale('en'),
                    theme: ThemeData(
                      colorScheme: const ColorScheme(
                        brightness: Brightness.light,
                        primary: kPrimaryColor,
                        onPrimary: kWhiteColor,
                        secondary: kSecondaryColor,
                        onSecondary: kSecondaryColor,
                        error: kErrorColor,
                        onError: kBlackColor,
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
                    // initialRoute: isLogin ? WhoAmIScreen.id : LoginScreen.id,
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
            },
          );
        },
      ),
    );
  }
}
