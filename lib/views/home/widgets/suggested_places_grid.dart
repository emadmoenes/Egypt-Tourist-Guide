import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:egypt_tourist_guide/views/widgets/place_card.dart';
import 'package:flutter/material.dart';

class SuggestedPlacesGrid extends StatelessWidget {
  final List<PlacesModel> suggestedPlaces;

  const SuggestedPlacesGrid({
    super.key,
    required this.suggestedPlaces,
    this.isWide = false,
  });

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: width * 0.03,
        mainAxisSpacing: width * 0.03,
      ),
      itemBuilder: (context, counter) => PlaceCard(
        place: suggestedPlaces[counter],
        isWide: isWide,
      ),
      itemCount: suggestedPlaces.length,
    );
  }
}
