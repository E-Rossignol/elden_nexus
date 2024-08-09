import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class ArmorSet extends Item {
  late double weight;
  late DamageNegation damageNegation;
  late String helmName;
  late String chestName;
  late String gauntletName;
  late String legName;

  ArmorSet({
    required super.name,
    required super.image,
    required this.weight,
    required this.damageNegation,
    this.helmName = '',
    this.chestName = '',
    this.gauntletName = '',
    this.legName = '',
  }) : super(
    cat: ItemCategory.armor, // Set the category directly here
  );

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
      'helmName': helmName,
      'chestName': chestName,
      'gauntletName': gauntletName,
      'legName': legName,
    };
  }

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
      helmName: data['helmName'],
      chestName: data['chestName'],
      gauntletName: data['gauntletName'],
      legName: data['legName'],
    );
  }
}
