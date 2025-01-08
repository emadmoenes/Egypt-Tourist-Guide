import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/views/home/widgets/popular_places_list_view.dart';
import 'package:egypt_tourist_guide/views/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPlacesSection extends StatelessWidget {
  const PopularPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: width*0.81*0.75,
      child: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context, state) {
          if(state is HomeSuccessState){
            if(state.data.isEmpty){
              return const Text("There's no data to show");
            } else {
              return PopularPlacesListView(popularPlacesList: state.data);
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
    );
  }
}
