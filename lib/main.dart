import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/views/auth/login_screen.dart';
import 'package:egypt_tourist_guide/views/auth/signup_screen.dart';
import 'package:egypt_tourist_guide/views/governorates/governoarates_places.dart';
import 'package:egypt_tourist_guide/views/governorates/governorates_screen.dart';
import 'package:egypt_tourist_guide/views/home/home_screen.dart';
import 'package:egypt_tourist_guide/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchHomeData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStringEn.appTitle,
        theme: ThemeData(fontFamily: 'merriweather', primarySwatch: Colors.blue),
        home: GovernoratesScreen(),
        // Set the initial screen to LoginScreen
        routes: {
          AppRoutes.signupRoute: (context) => const SignupScreen(),
          AppRoutes.loginRoute: (context) => const LoginScreen(),
          AppRoutes.homeRoute: (context) => const HomeScreen(),
          AppRoutes.profileRoute: (context) => ProfileScreen(),
          AppRoutes.governoratesRoute: (context) => GovernoratesScreen(),
          AppRoutes.placesRoute: (context) => GovernoratesPlaces(),
        },
      ),
    );
  }
}
