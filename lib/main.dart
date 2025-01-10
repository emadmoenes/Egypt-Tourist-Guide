import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/views/auth/login_screen.dart';
import 'package:egypt_tourist_guide/views/auth/signup_screen.dart';
import 'package:egypt_tourist_guide/views/governorates/governoarates_places.dart';
import 'core/app_routes.dart';
import 'package:egypt_tourist_guide/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'merriweather'),
        routes: {
          AppRoutes.signupRoute: (context) => const SignupScreen(),
          AppRoutes.loginRoute: (context) => const LoginScreen(),
          AppRoutes.homeRoute: (context) => const HomeScreen(),
          AppRoutes.placesRoute: (context) => GovernoratesPlaces(),
        },
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchHomeData(),

        )
      ], child: HomeScreen()),

    );
  }
}
