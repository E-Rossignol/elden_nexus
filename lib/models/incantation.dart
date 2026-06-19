import 'package:elden_nexus/models/item.dart';
import '../constants/constant.dart';

/// Incantation spell representation.
///
/// @param name Spell name.
/// @param image Image path or URL.
/// @param description Description text.
/// @param slots Number of slots required.
/// @param howToFind Acquisition description.
/// @param mapLink Map link reference.
/// @param fPCost Focus point cost.
/// @param element SpellType element.
/// @param effect Effect description.
/// @param requirement Stat requirements for the spell.
class Incantation extends Item {
  late String description;
  late String mapLink;
  late String howToFind;
  late double fPCost;
  late SpellType element;
  late String effect;
  late double slots;
  late SpellsRequirement requirement = SpellsRequirement();

  /// Create an Incantation instance.
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
  }) : super(cat: ItemCategory.incantation);

  /// Serialise to Map for storage.
  /// @return Map<String, dynamic> serialised representation.
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

  /// Create an Incantation from a Map (e.g. Firestore).
  /// @param data Map<String, dynamic>? source data.
  /// @return Incantation instance.
  static Incantation fromMap(Map<String, dynamic>? data) {
    return Incantation(
      name: data?['name'],
      image: data?['image'],
      slots: data?['slots'],
      description: data?['description'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      fPCost: data?['fPCost'],
      element: SpellType.values.firstWhere(
        (e) => e.toString() == 'SpellType.${data?['element']}',
      ),
      effect: data?['effect'],
      requirement: SpellsRequirement(
        int: data?['requirement']['int'] ?? 0,
        fai: data?['requirement']['fai'] ?? 0,
        arc: data?['requirement']['arc'] ?? 0,
      ),
    );
  }
}
