import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/models/screen_model.dart';
import 'package:egypt_tourist_guide/views/home/widgets/app_bottom_navigation_bar.dart';
import 'package:egypt_tourist_guide/views/home/widgets/home_screen_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // List of different screens using Screen Model
  static const List<ScreenModel> screens = [
    ScreenModel(title: 'Egypt Tourist Guide', body: HomeScreenBody()),
    ScreenModel(title: 'Favourites', body: HomeScreenBody()),
    ScreenModel(title: 'Places', body: HomeScreenBody()),
    ScreenModel(title: 'Settings', body: ProfileScreen()),
  ];
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function for setting the state of the home screen according to the choosed index in the nav bar
  settingState(){setState(() {});}

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(settingState: settingState,),
      appBar: AppBar(
        title: Text(
          HomeScreen.screens[homeCubit.currentPageIndex].title,
        ),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 11),
          child: Container(child: HomeScreen.screens[homeCubit.currentPageIndex].body)
      )
    );
  }
}
