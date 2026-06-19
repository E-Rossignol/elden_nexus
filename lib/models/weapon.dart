import 'package:elden_nexus/constants/constant.dart';
import 'item.dart';

/// Weapon item representation.
///
/// Holds stats, scaling and damage values.
/// @param name Weapon name.
/// @param image Image path or URL.
/// @param weaponCategory WeaponCategory enum.
/// @param howToFind Acquisition description.
/// @param scaling Scaling object for attributes.
/// @param isSomber Whether the weapon is somber infused.
/// @param ashOfWar Associated ash of war name.
/// @param mapLink Map link reference.
/// @param weight Weapon weight.
/// @param requirements Stat requirements.
/// @param damages Damage breakdown.
/// @param status Optional status effect mapping.
/// @param passive Optional passive description.
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

  /// Create a Weapon instance.
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
          cat: ItemCategory.weapon,
        );

  /// Serialise to Map for storage.
  /// @return Map<String, dynamic> serialised representation.
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

  /// Create a Weapon from a Map (e.g. Firestore).
  /// @param data Map<String, dynamic>? source data.
  /// @return Weapon instance.
  static Weapon fromMap(Map<String, dynamic>? data) {
    String statusStr = data!['status'];
    Map<StatusEffect, double> mapStatus = {};
    if (statusStr.isNotEmpty) {
      // status string format: "<StatusEffectName> <value>" e.g. "poison 10"
      final parts = statusStr.split(' ');
      mapStatus = {
        StatusEffect.values.firstWhere(
                (e) => e.toString() == 'StatusEffect.${parts[0]}'):
            double.parse(parts[1])
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

/// Scaling grades for weapon attributes.
class Scaling {
  String str;
  String dex;
  String int;
  String fai;
  String arc;

  /// Create a Scaling instance.
  Scaling(
      {this.str = '-',
      this.dex = '-',
      this.int = '-',
      this.fai = '-',
      this.arc = '-'});
}

/// Damage breakdown for a weapon.
class Damage {
  double physical;
  double magic;
  double fire;
  double holy;
  double lightning;
  double critical;
  double sorc;

  /// Create a Damage instance.
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
