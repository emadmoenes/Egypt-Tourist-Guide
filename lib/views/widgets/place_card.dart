import 'package:egypt_tourist_guide/controllers/home_controller/home_cubit.dart';
import 'package:egypt_tourist_guide/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceCard extends StatelessWidget {
  final PlacesModel place;
  final bool isWide;
  const PlaceCard({super.key, required this.place, required this.isWide, });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double textFactor = width/415;
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return InkWell(
      child: Container(
        width: isWide? width*0.81:width*0.42,
        height: isWide? width*0.81*0.75:width*0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffD0CBFF),
            image: DecorationImage(
                image: AssetImage(place.image),
              fit: BoxFit.fill
            )
        ),
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: width*0.135,
              padding: EdgeInsets.all(width*0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(160, 160, 160, 0.8),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(place.name, style: TextStyle(fontSize: textFactor*14,color: Colors.white,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                      InkWell(
                        onTap: (){
                          homeCubit.togglingFavourite(place: place);
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 10,
                            child: place.isFav?
                            Icon(Icons.favorite_outline_rounded,color: Colors.black,size: 10,):
                            Icon(Icons.favorite_rounded,color: Color(0xffFF54A0),size: 10,)
                        ),
                      )
                    ],
                  ),
                  Text(place.description, style: TextStyle(fontSize: textFactor*11,color: Colors.white,overflow: TextOverflow.ellipsis),maxLines: 1,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
