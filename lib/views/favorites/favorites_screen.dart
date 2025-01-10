import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/views/widgets/place_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    final favoritePlaces =
        homeCubit.places.where((place) => place.isFav).toList();

    return Scaffold(
      body: Column(
        children: [
          if (favoritePlaces.isEmpty)
            const Center(
              heightFactor: 30,
              child: Text('No favorite places yet!'),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: favoritePlaces.length,
                itemBuilder: (context, index) {
                  final place = favoritePlaces[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlaceCard(
                      place: place,
                      isWide: true,
                      onFavoriteToggled: () {
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
