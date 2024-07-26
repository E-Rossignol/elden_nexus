import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class Sorcery extends Item {
  late String description;
  late String mapLink;
  late String howToFind;
  late double fPCost;
  late String damageType;
  late String effect;

  Sorcery({
    required super.name,
    required super.image,
    required this.description,
    required this.howToFind,
    required this.mapLink,
    required this.fPCost,
    required this.damageType,
    required this.effect,
  }) : super(
    cat: ItemCategory.sorcery, // Set the category directly here
  );

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'image': image,
      'description': description,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'fPCost': fPCost,
      'damageType': damageType,
      'effect': effect,
    };
  }

  static Sorcery fromMap(Map<String, dynamic>? data) {
    return Sorcery(
      name: data?['name'],
      image: data?['image'],
      description: data?['description'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      fPCost: data?['fPCost'],
      damageType: data?['damageType'],
      effect: data?['effect'],
    );
  }
}