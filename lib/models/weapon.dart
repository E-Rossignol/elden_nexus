import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class Weapon extends Item {
  late WeaponCategory weaponCategory;
  late String howToFind;
  Weapon({
    required super.name,
    required super.image,
    required super.location,
    required super.way,
    required this.weaponCategory,
    required this.howToFind,
  }) : super(
    cat: ItemCategory.weapon, // Set the category directly here
  );

  bool isDlc(){
    return image.contains('dlc');
  }
}