import 'package:egypt_tourist_guide/core/app_routes.dart';
import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/models/governorate_model.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:egypt_tourist_guide/views/governorates/widgets/governorate_card.dart';
import 'package:flutter/material.dart';
import '../../data.dart';

class GovernoratesScreen extends StatelessWidget {
  const GovernoratesScreen({super.key});

  //--- Get governorate data ---//
  List<PlacesModel> getGovernorateData(String governorateId) {
    return PLACES
        .where((place) => place.governorateId == governorateId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<GovernorateModel> governorateList = GOVERNERATES;
    //HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStringEn.governorates,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.grey[300]!,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var governorate = governorateList[index];
            return GovernorateCard(
              governorate: governorate,
              width: width,
              height: height,
              onTap: () {
                // Go to governorate places
                List<PlacesModel> listOfPlaces =
                    getGovernorateData(governorate.id);
                // homeCubit.getGovernorateData(governorate.name);
                Navigator.pushNamed(
                  context,
                  AppRoutes.placesRoute,
                  arguments: {'1': listOfPlaces, '2': governorate.name},
                );
              },
            );
          },
          separatorBuilder: (context, counter) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: governorateList.length,
        ),
      ),
    );
  }
}
