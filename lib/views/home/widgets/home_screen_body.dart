import 'package:egypt_tourist_guide/views/home/widgets/popular_places_section.dart';
import 'package:egypt_tourist_guide/views/home/widgets/recommended_places_section.dart';
import 'package:flutter/material.dart';
import 'home_section_title.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      PopularPlacesSection(),
      HomeSectionTitle(text: 'Recommended'),
      RecommendedPlacesSection()
    ]);
  }
}
