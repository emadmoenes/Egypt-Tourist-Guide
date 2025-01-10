import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:egypt_tourist_guide/views/governorates/widgets/places_grid_view.dart';
import 'package:egypt_tourist_guide/views/home/widgets/home_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_colors.dart';
import '../../models/governorate_model.dart';

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
  Widget build(BuildContext context) {
    governoratePlaces = [];
    final args = ModalRoute.of(context)?.settings.arguments;
    var dataMap = args as Map<String, Object>;
    GovernorateModel governorate = dataMap['2'] as GovernorateModel;
    governoratePlaces.addAll(dataMap['1'] as List<PlacesModel>);
    return Scaffold(
      appBar: AppBar(
        title: Text('${governorate.name} ${AppStringEn.landmarks}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "hero-${governorate.id}",
            child: Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(governorate.image),fit: BoxFit.fill)
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            governorate.name,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      governorate.description,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
          HomeSectionTitle(text: "places".tr()),
          BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              return GovernoratesPlacesGrid(
                recommendedPlaces: governoratePlaces,
                isWide: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
