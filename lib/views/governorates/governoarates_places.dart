import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_tourist_guide/views/home/widgets/suggested_places_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/home_controller/home_cubit.dart';
import '../../controllers/home_controller/home_states.dart';
import '../../core/app_colors.dart';
import '../../models/governorate_model.dart';
import '../../models/place_model.dart';
import '../home/widgets/home_section_title.dart';

class GovernoratesPlaces extends StatelessWidget {
  final GovernorateModel governorate;
  final List<PlacesModel> places;

  const GovernoratesPlaces({
    super.key,
    required this.governorate,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('${governorate.name} '),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "hero-${governorate.id}",
              child: GovernorateContainer(
                width: width,
                height: height,
                governorate: governorate,
              ),
            ),
            HomeSectionTitle(text: "places".tr()),
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                  child: SuggestedPlacesGrid(
                    suggestedPlaces: places,
                    isWide: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
 //////////////////////////////////////////////////////////
/*--------------- Governorate Container ------------------*/
class GovernorateContainer extends StatelessWidget {
  const GovernorateContainer({
    super.key,
    required this.width,
    required this.height,
    required this.governorate,
  });

  final double width;
  final double height;
  final GovernorateModel governorate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.3,
      margin: EdgeInsetsDirectional.only(
        start: width * 0.05,
        end: width * 0.05,
        top: 10.0,
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(2, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(governorate.image),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            governorate.name,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
          ),
          Text(
            governorate.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
