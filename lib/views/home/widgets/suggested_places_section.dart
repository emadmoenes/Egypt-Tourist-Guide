import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/views/home/widgets/suggested_places_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../data.dart';
import '../../widgets/error_widget.dart';

class SuggestedPlacesSection extends StatelessWidget {
  const SuggestedPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      if (state is HomeSuccessState) {
        if (state.data.isEmpty) {
          return Center(
            child: Text('no_data'.tr()),
          );
        }
      } else if (state is HomeErrorState) {
        return const AppErrorWidget();
      } else if (state is HomeLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SuggestedPlacesGrid(
        suggestedPlaces:
            context.locale.toString() == 'ar' ? ARABICPLACES : PLACES,
      );
    });
  }
}
