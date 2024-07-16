import 'package:get/get.dart';
import 'constant.dart';

class Helper {
  static void snackbar(String title, String message) {
    Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true);
  }

  static String strCat(WeaponCategory category) {
    switch (category) {
      case WeaponCategory.axe:
        return 'Axe';
      case WeaponCategory.backhand_blade:
        return 'Backhand Blade';
      case WeaponCategory.ballista:
        return 'Ballista';
      case WeaponCategory.beast_claw:
        return 'Beast Claw';
      case WeaponCategory.bow:
        return 'Bow';
      case WeaponCategory.crossbow:
        return 'Crossbow';
      case WeaponCategory.claw:
        return 'Claw';
      case WeaponCategory.colossal_sword:
        return 'Colossal Sword';
      case WeaponCategory.colossal_weapon:
        return 'Colossal Weapon';
      case WeaponCategory.curved_greatsword:
        return 'Curved Greatsword';
      case WeaponCategory.curved_sword:
        return 'Curved Sword';
      case WeaponCategory.dagger:
        return 'Dagger';
      case WeaponCategory.fist:
        return 'Fist';
      case WeaponCategory.flail:
        return 'Flail';
      case WeaponCategory.glintstone_staff:
        return 'Glintstone Staff';
      case WeaponCategory.great_axe:
        return 'Great Axe';
      case WeaponCategory.great_bow:
        return 'Great Bow';
      case WeaponCategory.great_hammer:
        return 'Great Hammer';
      case WeaponCategory.great_katana:
        return 'Great Katana';
      case WeaponCategory.great_spear:
        return 'Great Spear';
      case WeaponCategory.greatshield:
        return 'Greatshield';
      case WeaponCategory.greatsword:
        return 'Greatsword';
      case WeaponCategory.halberd:
        return 'Hallberd';
      case WeaponCategory.hammer:
        return 'Hammer';
      case WeaponCategory.hand_to_hand_art:
        return 'Hand to Hand Art';
      case WeaponCategory.heavy_thrusting_sword:
        return 'Heavy Thrusting Sword';
      case WeaponCategory.katana:
        return 'Katana';
      case WeaponCategory.light_bow:
        return 'Light Bow';
      case WeaponCategory.light_greatsword:
        return 'Light Greatsword';
      case WeaponCategory.medium_shield:
        return 'Medium Shield';
      case WeaponCategory.perfume_bottle:
        return 'Perfume Bottle';
      case WeaponCategory.reaper:
        return 'Reaper';
      case WeaponCategory.sacred_seal:
        return 'Sacred Seal';
      case WeaponCategory.small_shield:
        return 'Small Shield';
      case WeaponCategory.spear:
        return 'Spear';
      case WeaponCategory.straight_sword:
        return 'Straight Sword';
      case WeaponCategory.throwing_blade:
        return 'Throwing Blade';
      case WeaponCategory.thrusting_shield:
        return 'Thrusting Shield';
      case WeaponCategory.thrusting_sword:
        return 'Thrusting Sword';
      case WeaponCategory.torch:
        return 'Torch';
      case WeaponCategory.twinblade:
        return 'Twinblade';
      case WeaponCategory.whip:
        return 'Whip';
    }
  }

  static String strLoc(Location loc){
    switch (loc) {
      case Location.ainsel_river:
        return 'Ainsel River';
      case Location.altus_plateau:
        return 'Altus Plateau';
      case Location.caria_manor:
        return 'Caria Manor';
      case Location.carian_study_hall:
        return 'Carian Study Hall';
      case Location.deeproot_depths:
        return 'Deeproot Depths';
      case Location.dragonbarrow:
        return 'Dragonbarrow';
      case Location.east_limgrave:
        return 'East Limgrave';
      case Location.forbidden_land:
        return 'Forbidden Land';
      case Location.lake_of_rot:
        return 'Lake of Rot';
      case Location.leyndell:
        return 'Leyndell';
      case Location.liurnia_of_the_lake:
        return 'Liurnia of the Lake';
      case Location.moonlight_altar:
        return 'Moonlight Altar';
      case Location.nokron_eternal_city:
        return 'Nokron Eternal City';
      case Location.nokstella:
        return 'Nokstella';
      case Location.raya_lucaria_academy:
        return 'Raya Lucaria Academy';
      case Location.siofra_aqueduct:
        return 'Siofra Aqueduct';
      case Location.siofra_river:
        return 'Siofra River';
      case Location.south_caelid:
        return 'South Caelid';
      case Location.stormveil_castle:
        return 'Stormveil Castle';
      case Location.west_limgrave:
        return 'West Limgrave';
      case Location.weeping_peninsula:
        return 'Weeping Peninsula';
      case Location.mountaintops:
        return 'Mountaintops';
      case Location.volcano_manor:
        return 'Volcano Manor';
      case Location.snowfield:
        return 'Snowfield';
      case Location.shunning_grounds:
        return 'Shunning Grounds';
      case Location.mohgwyn_palace:
        return 'Mohgwyn Palace';
      case Location.miquella_halligtree:
        return 'Miquella Halligtree';
      case Location.crumbling_farum_azula:
        return 'Crumbling Farum Azula';
      case Location.leyndell_ashen_capital:
        return 'Leyndell Ashen Capital';
        case Location.DLC_abyssal_woods:
        return 'DLC Abyssal Woods';
      case Location.DLC_gravesite_plain:
        return 'Gravesite Plain';
      case Location.DLC_cerulean_coast:
        return 'Cerulean Coast';
      case Location.DLC_finger_ruins_of_rhia:
        return 'Finger Ruins of Rhia';
      case Location.DLC_jagged_peak:
        return 'Jagged Peak';
      case Location.DLC_scadu_altus:
        return 'Scadu Altus';
      case Location.DLC_church_district:
        return 'Church District';
      case Location.DLC_shadow_keep:
        return 'Shadow Keep';
      case Location.DLC_scaduview:
        return 'Scaduview';
      case Location.DLC_rauh_ancient_ruins:
        return 'Rauh Ancient Ruins';
      case Location.DLC_enir_ilim:
        return 'Enir Ilim';
    }
  }

  static bool isDLCLoc(Location loc){
    return loc.name.contains('DLC');
  }

}
