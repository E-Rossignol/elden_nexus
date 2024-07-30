import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class Armor extends Item {
  late String howToFind;
  late String mapLink;
  late ArmorPiece armorPiece;
  late double weight;
  late String passive;
  late String set;
  late DamageNegation damageNegation;

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
          cat: ItemCategory.armor, // Set the category directly here
        );

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

  static Armor fromMap(Map<String, dynamic>? data) {
    return Armor(
      name: data!['name'],
      image: data['image'],
      armorPiece: ArmorPiece.values
          .firstWhere((e) => e.toString() == 'ArmorPiece.${data['piece']}'),
      howToFind: data['howToFind'],
      mapLink: data['mapLink'],
      weight: data['weight'],
      damageNegation: DamageNegation(
        physical: data['damageNegation']['physical'],
        strike: data['damageNegation']['strike'],
        slash: data['damageNegation']['slash'],
        pierce: data['damageNegation']['pierce'],
        magic: data['damageNegation']['magic'],
        fire: data['damageNegation']['fire'],
        lightning: data['damageNegation']['lightning'],
        holy: data['damageNegation']['holy'],
      ),
      set: data['set'],
      passive: data['passive'],
    );
  }
}
