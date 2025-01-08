import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/data.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  int currentPageIndex = 0;

  void fetchHomeData() {
    emit(HomeLoadingState());
    emit(HomeSuccessState(data: PLACES));
  }

  togglingFavourite({required PlacesModel place}){
    PLACES.firstWhere(
          (placeItem) => placeItem.id == place.id,
    ).isFav=!place.isFav;
    fetchHomeData();
  }
}