import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class Weapon extends Item {
  late WeaponCategory weaponCategory;
  late String howToFind;
  late List<String> infos;
  late bool isSomber;
  Weapon({
    required super.name,
    required super.image,
    required super.location,
    required this.weaponCategory,
    required this.howToFind,
    required this.infos,
    required this.isSomber,
  }) : super(
    cat: ItemCategory.weapon, // Set the category directly here
  );

  bool isDlc(){
    return image.contains('dlc');
  }
}