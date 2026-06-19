import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

/// Talisman item representation.
///
/// @param name Talisman name.
/// @param image Image path or URL.
/// @param description Text description.
/// @param howToFind Acquisition description.
/// @param mapLink Map link reference.
/// @param weight Weight value.
/// @param effect Effect description.
class Talisman extends Item {
  late String description;
  late String mapLink;
  late double weight;
  late String howToFind;
  late String effect;

  /// Create a Talisman instance.
  Talisman({
    required super.name,
    required super.image,
    required this.description,
    required this.howToFind,
    required this.mapLink,
    required this.weight,
    required this.effect,
  }) : super(
          cat: ItemCategory.talisman,
        );

  /// Create a Talisman from a Map (e.g. Firestore).
  /// @param data Map<String, dynamic>? source data.
  /// @return Talisman instance.
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

  /// Serialise to Map for storage.
  /// @return Map<String, dynamic> serialised representation.
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
