import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class Talisman extends Item {
  late String description;
  late String mapLink;
  late double weight;
  late String howToFind;
  late String effect;

  Talisman({
    required super.name,
    required super.image,
    required this.description,
    required this.howToFind,
    required this.mapLink,
    required this.weight,
    required this.effect,
  }) : super(
          cat: ItemCategory.talisman, // Set the category directly here
        );

  static Talisman fromMap(Map<String, dynamic>? data) {
    return Talisman(
      name: data?['name'],
      image: data?['image'],
      description: data?['description'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      weight: data?['weight'],
      effect: data?['effect'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'weight': weight,
      'effect': effect,
    };
  }
}
