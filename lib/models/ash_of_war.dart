import 'package:elden_nexus/models/item.dart';

import '../constants/constant.dart';

/// Ash of War item representation.
///
/// Contains usage restrictions and metadata.
/// @param name Ash name.
/// @param image Image path or URL.
/// @param howToFind Acquisition description.
/// @param description Text description of the ash effect.
/// @param mapLink Map link reference.
/// @param affinity Affinity string.
/// @param usableOn Description of usable weapon types.
class AshOfWar extends Item {
  late String howToFind;
  late String description;
  late String mapLink;
  late String affinity;
  late String usableOn;

  /// Create an AshOfWar instance.
  AshOfWar({
    required super.name,
    required super.image,
    required this.howToFind,
    required this.description,
    required this.mapLink,
    required this.affinity,
    required this.usableOn,
  }) : super(cat: ItemCategory.ashOfWar);

  /// Create from a Map (e.g. Firestore document).
  /// @param data Map<String, dynamic>? source data.
  /// @return AshOfWar instance.
  static AshOfWar fromMap(Map<String, dynamic>? data) {
    return AshOfWar(
      name: data!['name'],
      image: data['image'],
      howToFind: data['howToFind'],
      description: data['description'],
      mapLink: data['mapLink'],
      affinity: data['affinity'],
      usableOn: data['usableOn'],
    );
  }

  /// Serialise to Map.
  /// @return Map<String, dynamic> serialised representation.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'howToFind': howToFind,
      'description': description,
      'mapLink': mapLink,
      'affinity': affinity,
      'usableOn': usableOn,
    };
  }

  /// Convenience string representation (used for code generation or debugging).
  /// @return String textual representation.
  String toStr() {
    return 'AshOfWar(name: "$name", image: "$image", howToFind: "$howToFind", description: "$description", mapLink: "$mapLink", affinity: "", usableOn: ""),';
  }
}
