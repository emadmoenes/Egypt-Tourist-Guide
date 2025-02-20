import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return BottomNavigationBar(
          backgroundColor: AppColors.purple,
          onTap: (pageIndex) {
            homeCubit.changePageIndex(pageIndex);
          },
          currentIndex: homeCubit.currentPageIndex,
          selectedItemColor: AppColors.purple,
          unselectedItemColor: AppColors.grey,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: 'home'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_on_outlined),
              label: 'governorates'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline_rounded),
              label: 'liked'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: 'profile_title'.tr(),
            ),
          ],
        );
      },
    );
  }
}
