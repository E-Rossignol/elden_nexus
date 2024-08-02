import 'package:elden_nexus/models/item.dart';
import '../constants/constant.dart';

class Incantation extends Item {
  late String description;
  late String mapLink;
  late String howToFind;
  late double fPCost;
  late SpellType element;
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
    required this.element,
    required this.effect,
    required this.requirement,
  }) : super(
          cat: ItemCategory.incantation, // Set the category directly here
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'slots': slots,
      'description': description,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'fPCost': fPCost,
      'element': element.toString().split('.').last,
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
      element: SpellType.values
          .firstWhere((e) => e.toString() == 'SpellType.${data?['element']}'),
      effect: data?['effect'],
      requirement: SpellsRequirement(
        int: data?['requirement']['int'] ?? 0,
        fai: data?['requirement']['fai'] ?? 0,
        arc: data?['requirement']['arc'] ?? 0,
      ),
    );
  }
}
