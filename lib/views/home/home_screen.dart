import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/models/screen_model.dart';
import 'package:egypt_tourist_guide/views/favorites/favorites_screen.dart';
import 'package:egypt_tourist_guide/views/governorates/governorates_screen.dart';
import 'package:egypt_tourist_guide/views/home/widgets/app_bottom_navigation_bar.dart';
import 'package:egypt_tourist_guide/views/home/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // List of different screens using Screen Model
  static List<ScreenModel> get screens => [
        ScreenModel(title: 'app_title'.tr(), body: const HomeScreenBody()),
        ScreenModel(
            title: 'governorates'.tr(), body: const GovernoratesScreen()),
        ScreenModel(
            title: 'favorites_title'.tr(), body: const FavoritesScreen()),
        ScreenModel(title: 'profile_title'.tr(), body: const ProfileScreen()),
      ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      appBar: AppBar(
          elevation: 0.5,
          title: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              return Text(
                HomeScreen.screens[homeCubit.currentPageIndex].title,
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.language, color: Colors.black, size: 30),
              onPressed: () {
                // Toggle between English and Arabic
                final newLocale = context.locale.languageCode == 'en'
                    ? const Locale('ar')
                    : const Locale('en');
                context.setLocale(newLocale);
              },
            ),
          ]),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 11),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            return Container(
              child: HomeScreen.screens[homeCubit.currentPageIndex].body,
            );
          },
        ),
      ),
    );
  }
}
