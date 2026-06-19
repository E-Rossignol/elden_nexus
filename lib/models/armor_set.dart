import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

/// Representation of an armor set aggregated as a single item.
///
/// @param name Set name.
/// @param image Image path or URL.
/// @param weight Combined weight.
/// @param damageNegation Defensive stats for the set.
/// @param passive Optional passive description.
class ArmorSet extends Item {
  late double weight;
  late DamageNegation damageNegation;
  late String passive;

  /// Create an ArmorSet instance.
  ArmorSet({
    required super.name,
    required super.image,
    required this.weight,
    required this.damageNegation,
    this.passive = "",
  }) : super(cat: ItemCategory.armor);

  /// Serialise the ArmorSet to a Map.
  /// @return Map<String, dynamic> serialised representation.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'damageNegation': {
        'physical': damageNegation.physical,
        'strike': damageNegation.strike,
        'slash': damageNegation.slash,
        'pierce': damageNegation.pierce,
        'magic': damageNegation.magic,
        'fire': damageNegation.fire,
        'lightning': damageNegation.lightning,
        'holy': damageNegation.holy,
      },
      'weight': weight,
      'passive': passive,
    };
  }

  /// Create an ArmorSet from a Map (e.g. Firestore).
  /// @param data Map<String, dynamic>? source data.
  /// @return ArmorSet instance.
  static ArmorSet fromMap(Map<String, dynamic>? data) {
    return ArmorSet(
      name: data!['name'],
      image: data['image'],
      weight: data['weight'],
      damageNegation: DamageNegation(
        physical: data['damageNegation']['physical'] ?? 0,
        strike: data['damageNegation']['strike'] ?? 0,
        slash: data['damageNegation']['slash'] ?? 0,
        pierce: data['damageNegation']['pierce'] ?? 0,
        magic: data['damageNegation']['magic'] ?? 0,
        fire: data['damageNegation']['fire'] ?? 0,
        lightning: data['damageNegation']['lightning'] ?? 0,
        holy: data['damageNegation']['holy'] ?? 0,
      ),
      passive: data['passive'] ?? "",
    );
  }
}
