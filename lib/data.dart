// List of Governorates
import 'models/governrate_model.dart';
import 'models/place_model.dart';

final List<GovernerateModel> GOVERNERATES = [
  GovernerateModel(
    id: '1',
    name: 'Alexandria',
    description: 'A historic Mediterranean port city in Egypt.',
    image: 'assets/cities/alexandria.jpg', // Use one image for Alexandria
  ),
  GovernerateModel(
    id: '2',
    name: 'Cairo',
    description: 'The bustling capital of Egypt, home to ancient wonders and modern attractions.',
    image: 'assets/cities/cairo.jpg', // Use one image for Cairo
  ),
  GovernerateModel(
    id: '3',
    name: 'Giza',
    description: 'Famous for the Pyramids and the Sphinx.',
    image: 'assets/cities/giza.jpg', // Use one image for Giza
  ),
  GovernerateModel(
    id: '4',
    name: 'Hurghada',
    description: 'A popular Red Sea resort town known for its beaches and diving spots.',
    image: 'assets/cities/hurghada.jpg', // Use one image for Hurghada
  ),
  GovernerateModel(
    id: '5',
    name: 'Luxor',
    description: 'Known as the world\'s greatest open-air museum, with ancient temples and tombs.',
    image: 'assets/cities/luxor.jpg', // Use one image for Luxor
  ),
];

// List of Places
final List<PlacesModel> PLACES = [
  PlacesModel(
    id: 1,
    governerateId: 1, // Alexandria
    name: 'Corniche',
    description: 'A scenic waterfront promenade in Alexandria.',
    image: 'assets/cities/alexandria/corniche.jpg',
    isFav: true,
  ),
  PlacesModel(
    id: 2,
    governerateId: 1, // Alexandria
    name: 'Library of Alexandria',
    description: 'A modern library and cultural center commemorating the ancient Library of Alexandria.',
    image: 'assets/cities/alexandria/library_of_alexandria.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 3,
    governerateId: 1, // Alexandria
    name: 'Quitbai Citadel',
    description: 'A historic fortress located on the Mediterranean coast.',
    image: 'assets/cities/alexandria/quitbai_citidal.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 4,
    governerateId: 2, // Cairo
    name: 'Cairo Tower',
    description: 'A iconic tower offering panoramic views of Cairo.',
    image: 'assets/cities/cairo/cairo_tower.webp',
    isFav: false,
  ),
  PlacesModel(
    id: 5,
    governerateId: 2, // Cairo
    name: 'Elmoez Street',
    description: 'A historic street in Islamic Cairo with stunning architecture.',
    image: 'assets/cities/cairo/elmoez_street.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 6,
    governerateId: 2, // Cairo
    name: 'Mosque of Muhammad Ali',
    description: 'A stunning Ottoman-style mosque located in the Cairo Citadel.',
    image: 'assets/cities/cairo/mosque_of_muhammad_ali.webp',
    isFav: false,
  ),
  PlacesModel(
    id: 7,
    governerateId: 3, // Giza
    name: 'Pyramids of Giza',
    description: 'The last remaining wonder of the ancient world.',
    image: 'assets/cities/giza/pyramids.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 8,
    governerateId: 3, // Giza
    name: 'Sphinx',
    description: 'A mythical creature with the body of a lion and the head of a human.',
    image: 'assets/cities/giza/sphinx_and_pyramid_in_giza.jpeg',
    isFav: false,
  ),
  PlacesModel(
    id: 9,
    governerateId: 4, // Hurghada
    name: 'El Gouna',
    description: 'A luxurious resort town on the Red Sea.',
    image: 'assets/cities/hurghada/el_gouna_festival_plaza.jpeg',
    isFav: false,
  ),
  PlacesModel(
    id: 10,
    governerateId: 4, // Hurghada
    name: 'Hurghada Grand Aquarium',
    description: 'A large aquarium showcasing marine life from the Red Sea.',
    image: 'assets/cities/hurghada/hurghada_grand_aquarium.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 11,
    governerateId: 5, // Luxor
    name: 'Karnak Temple',
    description: 'A vast temple complex dedicated to the god Amun.',
    image: 'assets/cities/luxor/karnak_temple.jpg',
    isFav: false,
  ),
  PlacesModel(
    id: 12,
    governerateId: 5, // Luxor
    name: 'Colossi of Memnon',
    description: 'Two massive stone statues of Pharaoh Amenhotep III.',
    image: 'assets/cities/luxor/colossi_of_memnon.jpg',
    isFav: false,
  ),
];