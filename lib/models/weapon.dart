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
  late Requirement requirements;
  late Damage damages;

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
    required this.requirements,
    required this.damages,
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
      'requirements': {
        'str': requirements.str,
        'dex': requirements.dex,
        'int': requirements.int,
        'fai': requirements.fai,
        'arc': requirements.arc,
      },
      'damages': {
        'physical': damages.physical,
        'magic': damages.magic,
        'fire': damages.fire,
        'dark': damages.holy,
        'lightning': damages.lightning,
        'critical': damages.critical,
        'sorc': damages.sorc,
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
      requirements: Requirement(
        str: data['requirements']['str'] ?? 0,
        dex: data['requirements']['dex'] ?? 0,
        int: data['requirements']['int'] ?? 0,
        fai: data['requirements']['fai'] ?? 0,
        arc: data['requirements']['arc'] ?? 0,
      ),
      damages: Damage(
        physical: data['damages']['physical'] ?? 0,
        magic: data['damages']['magic'] ?? 0,
        fire: data['damages']['fire'] ?? 0,
        holy: data['damages']['holy'] ?? 0,
        lightning: data['damages']['lightning'] ?? 0,
        critical: data['damages']['critical'] ?? 0,
        sorc: data['damages']['sorc'] ?? 0,
      ),
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

class Damage {
  double physical;
  double magic;
  double fire;
  double holy;
  double lightning;
  double critical;
  double sorc;

  Damage({
    this.physical = 0,
    this.magic = 0,
    this.fire = 0,
    this.holy = 0,
    this.lightning = 0,
    this.critical = 0,
    this.sorc = 0,
  });
}
