import 'package:easy_localization/easy_localization.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_states.dart';
import 'package:egypt_tourist_guide/data.dart';
import 'package:egypt_tourist_guide/models/governorate_model.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:egypt_tourist_guide/views/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_colors.dart';

class PlaceCard extends StatelessWidget {
  final PlacesModel place;
  final bool isWide;

  const PlaceCard({
    super.key,
    required this.place,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double textFactor = width / 415;
    List<GovernorateModel> governorateList =
        context.locale.toString() == 'ar' ? ARABICGOVERNORATES : GOVERNERATES;
    GovernorateModel placeGovernorate = governorateList
        .firstWhere((element) => element.id == place.governorateId);
    final homeCubit = context.read<HomeCubit>();
    var isFav = place.isFav;
    double bigContainerHeight = isWide ? width * 0.81 * 0.75 : width * 0.48;
    return InkWell(
      child: Container(
        width: isWide ? width * 0.81 : width * 0.25,
        height: bigContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.containerColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(2, 6),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(place.image),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: SecondContainer(
          bigContainerHeight: bigContainerHeight,
          place: place,
          isWide: isWide,
          textFactor: textFactor,
          homeCubit: homeCubit,
          isFav: isFav,
          placeGovernorate: placeGovernorate,
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////
//-------------- Second container ---------------//
// Second container which contain place details
class SecondContainer extends StatelessWidget {
  const SecondContainer({
    super.key,
    required this.bigContainerHeight,
    required this.place,
    required this.isWide,
    required this.textFactor,
    required this.homeCubit,
    required this.isFav,
    required this.placeGovernorate,
  });

  final double bigContainerHeight;
  final PlacesModel place;
  final bool isWide;
  final double textFactor;
  final HomeCubit homeCubit;
  final bool isFav;
  final GovernorateModel placeGovernorate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: bigContainerHeight * 0.29,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
        color: AppColors.secGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Place name text and fav icon
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // place name
                Expanded(
                  child: Text(
                    place.name,
                    style: TextStyle(
                      fontSize: isWide ? textFactor * 16 : textFactor * 12.5,
                      color: AppColors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ),
                /*------- Favourite icon -------*/
                InkWell(
                  onTap: () {
                    homeCubit.togglingFavourite(
                        place: place,
                        isArabic: context.locale.toString() == 'ar');
                  },
                  child: BlocBuilder<HomeCubit, HomeStates>(
                    builder: (context, state) {
                      return CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: isWide ? 10 : 7.5,
                        child: FavouriteIcon(
                          isFav: isFav,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 2),
          // Governorate name of the place
          Text(
            placeGovernorate.name,
            style: TextStyle(
              fontSize: isWide ? textFactor * 11.2 : textFactor * 9,
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            ),
          ),
          // place description
          Text(
            place.description,
            style: TextStyle(
              fontSize: isWide ? textFactor * 11.2 : textFactor * 9,
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
