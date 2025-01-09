import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/views/home/widgets/recommended_places_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/error_widget.dart';

class RecommendedPlacesSection extends StatelessWidget {
  const RecommendedPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeCubit,HomeStates>(
              builder: (context, state) {
                if(state is HomeSuccessState){
                  if(state.data.isEmpty){
                    return const Text("There's no data to show");
                  } else {
                    return Expanded(child: RecommendedPlacesGrid(recommendedPlaces: state.data));
                  }
                }else if(state is HomeErrorState){
                  return AppErrorWidget();
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
          ),
        ],
      ),
    );
  }
}
