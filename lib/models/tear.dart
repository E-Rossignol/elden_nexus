import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

/// Flask (Tear) item representation.
///
/// @param name Tear name.
/// @param image Image path or URL.
/// @param howToFind Acquisition description.
/// @param mapLink Map link reference.
/// @param duration Effect duration.
/// @param effect Effect description.
class Tear extends Item {
  late String mapLink;
  late double duration;
  late String howToFind;
  late String effect;

  /// Create a Tear instance.
  Tear({
    required super.name,
    required super.image,
    required this.howToFind,
    required this.mapLink,
    required this.duration,
    required this.effect,
  }) : super(cat: ItemCategory.tear);

  /// Serialise to Map for storage.
  /// @return Map<String, dynamic> serialised representation.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'duration': duration,
      'effect': effect,
    };
  }

  /// Create a Tear from a Map (e.g. Firestore).
  /// @param data Map<String, dynamic>? source data.
  /// @return Tear instance.
  static Tear fromMap(Map<String, dynamic>? data) {
    return Tear(
      name: data?['name'],
      image: data?['image'],
      howToFind: data?['howToFind'],
      mapLink: data?['mapLink'],
      duration: data?['duration'],
      effect: data?['effect'],
    );
  }
}
