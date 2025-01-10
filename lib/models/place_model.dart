class PlacesModel {
  final int id;
  final int governorateId;
  final String name;
  final String description;
  final String image;
  bool isFav;

  PlacesModel({
    required this.id,
    required this.governorateId,
    required this.name,
    required this.description,
    required this.image,
    required this.isFav,
  });
}
