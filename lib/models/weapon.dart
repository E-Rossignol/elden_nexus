import 'package:elden_nexus/constants/constant.dart';
import 'ash_of_war.dart';
import 'item.dart';

class Weapon extends Item {
  late WeaponCategory weaponCategory;
  late String howToFind;
  late Scaling scaling;
  late bool isSomber;
  late AshOfWar ashOfWar;
  late String mapLink;
  late double weight;
  Weapon({
    required super.name,
    required super.image,
    required this.weaponCategory,
    required this.howToFind,
    required this.scaling,
    required this.isSomber,
    required this.ashOfWar,
    required this.mapLink,
    required this.weight,
  }) : super(
    cat: ItemCategory.weapon, // Set the category directly here
  );

  bool isDlc(){
    return image.contains('dlc');
  }
}

class Scaling {
  String str;
  String dex;
  String int;
  String fai;
  String arc;
  Scaling({this.str = '-' , this.dex = '-', this.int = '-', this.fai = '-', this.arc = '-'});
}