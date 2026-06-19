import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

/// Representation of an armor piece item.
///
/// Contains metadata and defensive values.
/// @param name Armor name.
/// @param image Image path or URL.
/// @param armorPiece Piece identifier (head/chest/etc).
/// @param howToFind Description how to obtain.
/// @param mapLink Map link reference.
/// @param weight Armor weight.
/// @param damageNegation Defensive stats container.
/// @param set Optional armor set name.
/// @param passive Optional passive description.
class Armor extends Item {
  late String howToFind;
  late String mapLink;
  late ArmorPiece armorPiece;
  late double weight;
  late String passive;
  late String set;
  late DamageNegation damageNegation;

  /// Create an Armor instance.
  Armor({
    required super.name,
    required super.image,
    required this.armorPiece,
    required this.howToFind,
    required this.mapLink,
    required this.weight,
    required this.damageNegation,
    this.set = '',
    this.passive = '',
  }) : super(
          cat: ItemCategory.armor,
        );

  /// Convert this Armor to a Map suitable for Firestore or JSON encoding.
  /// @return Map<String, dynamic> serialised representation.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'piece': armorPiece.toString().split('.').last,
      'howToFind': howToFind,
      'mapLink': mapLink,
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
      'set': set,
      'passive': passive,
    };
  }

  /// Create an Armor from a Map (e.g. Firestore document).
  /// @param data Map<String, dynamic>? source data.
  /// @return Armor constructed instance.
  static Armor fromMap(Map<String, dynamic>? data) {
    // Map string value back to ArmorPiece enum by matching the name part.
    return Armor(
      name: data!['name'],
      image: data['image'],
      armorPiece: ArmorPiece.values
          .firstWhere((e) => e.toString() == 'ArmorPiece.${data['piece']}'),
      howToFind: data['howToFind'],
      mapLink: data['mapLink'],
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
      set: data['set'],
      passive: data['passive'],
    );
  }
}
