import 'package:egypt_tourist_guide/views/home/widgets/app_bottom_navigation_bar.dart';
import 'package:egypt_tourist_guide/views/home/widgets/home_section_title.dart';
import 'package:egypt_tourist_guide/views/home/widgets/popular_places_section.dart';
import 'package:egypt_tourist_guide/views/home/widgets/recommended_places_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      appBar: AppBar(
        title: Text(
          "Egypt Tourist Guide",
        ),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PopularPlacesSection(),
            HomeSectionTitle(text: 'Recommended'),
            RecommendedPlacesSection()
          ])),
    );
  }
}
