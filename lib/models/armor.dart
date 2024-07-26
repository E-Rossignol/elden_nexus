import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class Armor extends Item {
  late String howToFind;
  late String mapLink;
  late ArmorPiece armorPiece;
  late double weight;
  late String passive;
  late String set;

  Armor({
    required super.name,
    required super.image,
    required this.armorPiece,
    required this.howToFind,
    required this.mapLink,
    required this.weight,
    this.set = '',
    this.passive = '',
  }) : super(
    cat: ItemCategory.armor, // Set the category directly here
  );

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'image': image,
      'piece': armorPiece.toString().split('.').last,
      'howToFind': howToFind,
      'mapLink': mapLink,
      'weight': weight,
      'set': set,
      'passive': passive,
    };
  }
  static Armor fromMap(Map<String, dynamic>? data) {
    return Armor(
      name: data!['name'],
      image: data['image'],
      armorPiece: ArmorPiece.values.firstWhere(
          (e) => e.toString() == 'ArmorPiece.${data['piece']}'),
      howToFind: data['howToFind'],
      mapLink: data['mapLink'],
      weight: data['weight'],
      set: data['set'],
      passive: data['passive'],
    );
  }
}
