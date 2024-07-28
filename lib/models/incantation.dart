import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

class Incantation extends Item {
  late String description;
  late String mapLink;
  late String howToFind;
  late double fPCost;
  late String damageType;
  late String effect;
  late double slots;
  late SpellsRequirement requirement = SpellsRequirement();

  Incantation({
    required super.name,
    required super.image,
    required this.description,
    required this.slots,
    required this.howToFind,
    required this.mapLink,
    required this.fPCost,
    required this.damageType,
    required this.effect,
    required this.requirement,
  }) : super(
    cat: ItemCategory.incantation, // Set the category directly here
  );

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'image': image,
      'slots': slots,
      'description': description,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'fPCost': fPCost,
      'damageType': damageType,
      'effect': effect,
      'requirement': {
        'int': requirement.int,
        'fai': requirement.fai,
        'arc': requirement.arc,
      },
    };
  }

  static Incantation fromMap(Map<String, dynamic>? data) {
    return Incantation(
      name: data?['name'],
      image: data?['image'],
      slots: data?['slots'],
      description: data?['description'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      fPCost: data?['fPCost'],
      damageType: data?['damageType'],
      effect: data?['effect'],
      requirement: SpellsRequirement(
        int: data?['requirement']['int'],
        fai: data?['requirement']['fai'],
        arc: data?['requirement']['arc'],
      ),
    );
  }
}