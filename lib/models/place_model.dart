class PlacesModel{
  final int id;
  final int governerateId;
  final String name;
  final String description;
  final String image;
  bool isFav;

  PlacesModel({required this.id, required this.governerateId, required this.name, required this.description, required this.image, required this.isFav});
}