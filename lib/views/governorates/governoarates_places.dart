import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:egypt_tourist_guide/views/governorates/widgets/places_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GovernoratesPlaces extends StatefulWidget {
  const GovernoratesPlaces({
    super.key,
  });

  @override
  State<GovernoratesPlaces> createState() => _GovernoratesPlacesState();
}

class _GovernoratesPlacesState extends State<GovernoratesPlaces> {
  List<PlacesModel> governoratePlaces = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    governoratePlaces = [];
    final args = ModalRoute.of(context)?.settings.arguments;
    var dataMap = args as Map<String, Object>;
    String governorateName = dataMap['2'] as String;
    governoratePlaces.addAll(dataMap['1'] as List<PlacesModel>);
    return Scaffold(
      appBar: AppBar(
        title: Text('$governorateName ${AppStringEn.landmarks}'),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return GovernoratesPlacesGrid(
            recommendedPlaces: governoratePlaces,
            isWide: true,
          );
        },
      ),
    );
  }
}
