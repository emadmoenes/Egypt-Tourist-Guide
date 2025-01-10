import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Function settingState;
  const AppBottomNavigationBar({super.key, required this.settingState});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BottomNavigationBar(
      backgroundColor: Colors.purple,
      onTap: (pageIndex) {
        setState(() {homeCubit.currentPageIndex = pageIndex;});
        widget.settingState();
        },
      currentIndex: homeCubit.currentPageIndex,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'places'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded),
          label: 'liked'.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'settings'.tr(),
        ),
      ],
    );
  }
}
