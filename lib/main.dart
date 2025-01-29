import 'dart:developer';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/core/app_routes.dart';
import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/core/custom_page_routes.dart';
import 'package:egypt_tourist_guide/core/services/shared_prefs_service.dart';
import 'package:egypt_tourist_guide/views/auth/login_screen.dart';
import 'package:egypt_tourist_guide/views/auth/signup_screen.dart';
import 'package:egypt_tourist_guide/views/governorates/governoarates_places.dart';
import 'package:egypt_tourist_guide/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // initialize shared preferences
  await SharedPrefsService.init();
  // Get token from shared preferences if exists
  String? token =
      await SharedPrefsService.getStringData(key: AppStringEn.tokenKey);
  // determine start screen
  Widget widget = const LoginScreen();
  if (token != null) {
    widget = const HomeScreen();
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'lib/core/lang',
      fallbackLocale: const Locale('en'),
      child: MyApp(startScreen: widget),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startScreen});

  final Widget startScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..fetchHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'merriweather'),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: onGenerateRoute,
        home: startScreen,
      ),
    );
  }
}

////////////////////////////////////////////
/*-- On Generate page routes --*/
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  log('Navigating to: ${settings.name}');
  switch (settings.name) {
    case AppRoutes.signupRoute:
      return SlideRightRoute(child: const SignupScreen());
    case AppRoutes.loginRoute:
      return FadeTransitionRoute(child: const LoginScreen());
    case AppRoutes.homeRoute:
      return FadeTransitionRoute(child: const HomeScreen());
    case AppRoutes.placesRoute:
      // Extract arguments and pass them to GovernoratesPlaces
      final args = settings.arguments as Map<String, dynamic>;
      return SlideRightRoute(
        child: GovernoratesPlaces(
          governorate: args['governorate'],
          places: args['places'],
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      );
  }
}
