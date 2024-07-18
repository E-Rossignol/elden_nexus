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
}