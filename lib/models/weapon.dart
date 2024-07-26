import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

class Weapon extends Item {
  late WeaponCategory weaponCategory;
  late String howToFind;
  late Scaling scaling;
  late bool isSomber;
  late String ashOfWar;
  late String mapLink;
  late double weight;
  late Map<StatusEffect, double> status;
  late String passive;

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
    this.status = const {},
    this.passive = '',
  }) : super(
          cat: ItemCategory.weapon, // Set the category directly here
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'category': weaponCategory.toString().split('.').last,
      'howToFind': howToFind,
      'scaling': {
        'str': scaling.str,
        'dex': scaling.dex,
        'int': scaling.int,
        'fai': scaling.fai,
        'arc': scaling.arc,
      },
      'isSomber': isSomber,
      'ashOfWar': ashOfWar,
      'mapLink': mapLink,
      'weight': weight,
      'status': status.isNotEmpty
          ? '${status.keys.first.toString().split('.').last} ${status.values.first}'
          : '',
      'passive': passive,
    };
  }

  static Weapon fromMap(Map<String, dynamic>? data) {
    String statusStr = data!['status'];
    Map<StatusEffect, double> mapStatus = {};
    if (statusStr.isNotEmpty) {
      mapStatus = {
        StatusEffect.values.firstWhere((e) =>
                e.toString() == 'StatusEffect.${statusStr.split(' ')[0]}'):
            double.parse(statusStr.split(' ')[1])
      };
    }
    return Weapon(
      name: data['name'],
      image: data['image'],
      weaponCategory: WeaponCategory.values.firstWhere(
          (e) => e.toString() == 'WeaponCategory.${data['category']}'),
      howToFind: data['howToFind'],
      scaling: Scaling(
        str: data['scaling']['str'],
        dex: data['scaling']['dex'],
        int: data['scaling']['int'],
        fai: data['scaling']['fai'],
        arc: data['scaling']['arc'],
      ),
      isSomber: data['isSomber'],
      ashOfWar: data['ashOfWar'],
      mapLink: data['mapLink'],
      weight: data['weight'],
      status: mapStatus,
      passive: data['passive'],
    );
  }
}

class Scaling {
  String str;
  String dex;
  String int;
  String fai;
  String arc;

  Scaling(
      {this.str = '-',
      this.dex = '-',
      this.int = '-',
      this.fai = '-',
      this.arc = '-'});
}
