import 'package:get/get.dart';
import '../models/weapon.dart';
import 'constant.dart';

class Helper {
  static void snackbar(String title, String message) {
    Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true);
  }

  static List<Weapon> getAllWeapons(){
    List<Weapon> allWeapons = [];
    List<Weapon> axes = [
      Weapon(name: 'Battle Axe',image: 'lib/constants/images/axe/battle_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Celebrants Cleaver',image: 'lib/constants/images/axe/celebrants_cleaver.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Forked Hatchet',image: 'lib/constants/images/axe/forked_hatchet.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Hand Axe',image: 'lib/constants/images/axe/hand_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Highland Axe',image: 'lib/constants/images/axe/highland_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Icerind Hatchet',image: 'lib/constants/images/axe/icerind_hatchet.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Iron Cleaver',image: 'lib/constants/images/axe/iron_cleaver.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Jawbone Axe',image: 'lib/constants/images/axe/jawbone_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ripple Blade',image: 'lib/constants/images/axe/ripple_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rosuss Axe',image: 'lib/constants/images/axe/rosus_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Sacrificial Axe',image: 'lib/constants/images/axe/sacrificial_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Stormhawk Axe',image: 'lib/constants/images/axe/stormhawk_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Warped Axe',image: 'lib/constants/images/axe/warped_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> claws = [
      Weapon(name: 'Bloodhound Claws',image: 'lib/constants/images/claw/bloodhound_claws.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.claw, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Hookclaws',image: 'lib/constants/images/claw/hookclaws.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.claw, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Raptor Talons',image: 'lib/constants/images/claw/raptor_talons.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.claw, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Venomous Fang',image: 'lib/constants/images/claw/venomous_fang.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.claw, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> colossal_swords = [
      Weapon(name: 'Godslayers Greatsword',image: 'lib/constants/images/colossal_sword/godslayers_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Grafted Blade Greatsword',image: 'lib/constants/images/colossal_sword/grafted_blade_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Greatsword',image: 'lib/constants/images/colossal_sword/greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Malikeths Black Blade',image: 'lib/constants/images/colossal_sword/malikeths_black_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Royal Greatsword',image: 'lib/constants/images/colossal_sword/royal_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ruins Greatsword',image: 'lib/constants/images/colossal_sword/ruins_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Starscourge Greatsword',image: 'lib/constants/images/colossal_sword/starscourge_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Trolls Golden Sword',image: 'lib/constants/images/colossal_sword/trolls_golden_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Troll Knights Sword',image: 'lib/constants/images/colossal_sword/troll_knights_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Watchdogs Greatsword',image: 'lib/constants/images/colossal_sword/watchdogs_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Zweihander',image: 'lib/constants/images/colossal_sword/zweihander.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> colossal_weapons = [
      Weapon(name: 'Axe Of Godfrey',image: 'lib/constants/images/colossal_weapon/axe_of_godfrey.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dragon Greatclaw',image: 'lib/constants/images/colossal_weapon/dragon_greatclaw.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Duelist Greataxe',image: 'lib/constants/images/colossal_weapon/duelist_greataxe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Envoys Greathorn',image: 'lib/constants/images/colossal_weapon/envoys_greathorn.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Fallingstar Beast Jaw',image: 'lib/constants/images/colossal_weapon/fallingstar_beast_jaw.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ghizas Wheel',image: 'lib/constants/images/colossal_weapon/ghizas_wheel.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Giant Crusher',image: 'lib/constants/images/colossal_weapon/giant_crusher.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Golems Halberd',image: 'lib/constants/images/colossal_weapon/golems_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Club',image: 'lib/constants/images/colossal_weapon/great_club.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Prelates Inferno Crozier',image: 'lib/constants/images/colossal_weapon/prelates_inferno_crozier.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rotten Greataxe',image: 'lib/constants/images/colossal_weapon/rotten_greataxe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rotten Staff',image: 'lib/constants/images/colossal_weapon/rotten_staff.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Staff Of The Avatar',image: 'lib/constants/images/colossal_weapon/staff_of_the_avatar.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Trolls Hammer',image: 'lib/constants/images/colossal_weapon/trolls_hammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Watchdogs Staff',image: 'lib/constants/images/colossal_weapon/watchdogs_staff.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.colossal_weapon, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> curved_greatswords = [
      Weapon(name: 'Beastmans Cleaver',image: 'lib/constants/images/curved_greatsword/beastmans_cleaver.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Bloodhounds Fang',image: 'lib/constants/images/curved_greatsword/bloodhounds_fang.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dismounter',image: 'lib/constants/images/curved_greatsword/dismounter.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Magma Wyrms Scalesword',image: 'lib/constants/images/curved_greatsword/magma_wyrms_scalesword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Monks Flameblade',image: 'lib/constants/images/curved_greatsword/monks_flameblade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Morgotts Cursed Sword',image: 'lib/constants/images/curved_greatsword/morgotts_cursed_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Omen Cleaver',image: 'lib/constants/images/curved_greatsword/omen_cleaver.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Onyx Lords Greatsword',image: 'lib/constants/images/curved_greatsword/onyx_lords_greatsword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Zamor Curved Sword',image: 'lib/constants/images/curved_greatsword/zamor_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> curved_swords= [
      Weapon(name: 'Bandits Curved Sword',image: 'lib/constants/images/curved_sword/bandits_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Beastmans Curved Sword',image: 'lib/constants/images/curved_sword/beastmans_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Eclipse Shotel',image: 'lib/constants/images/curved_sword/eclipse_shotel.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Falchion',image: 'lib/constants/images/curved_sword/falchion.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Flowing Curved Sword',image: 'lib/constants/images/curved_sword/flowing_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Grossmesser',image: 'lib/constants/images/curved_sword/grossmesser.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Magma Blade',image: 'lib/constants/images/curved_sword/magma_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Mantis Blade',image: 'lib/constants/images/curved_sword/mantis_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nox Flowing Sword',image: 'lib/constants/images/curved_sword/nox_flowing_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Scavengers Curved Sword',image: 'lib/constants/images/curved_sword/scavengers_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Scimitar',image: 'lib/constants/images/curved_sword/scimitar.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Serpent-gods Curved Sword',image: 'lib/constants/images/curved_sword/serpent-gods_curved_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Shamshir',image: 'lib/constants/images/curved_sword/shamshir.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Shotel',image: 'lib/constants/images/curved_sword/shotel.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Wing Of Astel',image: 'lib/constants/images/curved_sword/wing_of_astel.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.curved_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> daggers = [
      Weapon(name: 'Black Knife',image: 'lib/constants/images/dagger/black_knife.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Blade Of Calling',image: 'lib/constants/images/dagger/blade_of_calling.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Bloodstained Dagger',image: 'lib/constants/images/dagger/bloodstained_dagger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Celebrants Sickle',image: 'lib/constants/images/dagger/celebrants_sickle.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cinquedea',image: 'lib/constants/images/dagger/cinquedea.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Crystal Knife',image: 'lib/constants/images/dagger/crystal_knife.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dagger',image: 'lib/constants/images/dagger/dagger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Erdsteel Dagger',image: 'lib/constants/images/dagger/erdsteel_dagger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Glintstone Kris',image: 'lib/constants/images/dagger/glintstone_kris.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Knife',image: 'lib/constants/images/dagger/great_knife.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ivory Sickle',image: 'lib/constants/images/dagger/ivory_sickle.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Misericorde',image: 'lib/constants/images/dagger/misericorde.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Parrying Dagger',image: 'lib/constants/images/dagger/parrying_dagger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Reduvia',image: 'lib/constants/images/dagger/reduvia.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Scorpions Stinger',image: 'lib/constants/images/dagger/scorpions_stinger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Wakizashi',image: 'lib/constants/images/dagger/wakizashi.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.dagger, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> fists = [
      Weapon(name: 'Caestus',image: 'lib/constants/images/fist/caestus.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cipher Pata',image: 'lib/constants/images/fist/cipher_pata.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Clinging Bone',image: 'lib/constants/images/fist/clinging_bone.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Grafted Dragon',image: 'lib/constants/images/fist/grafted_dragon.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Iron Ball',image: 'lib/constants/images/fist/iron_ball.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Katar',image: 'lib/constants/images/fist/katar.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Spiked Caestus',image: 'lib/constants/images/fist/spiked_caestus.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Star Fist',image: 'lib/constants/images/fist/star_fist.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Veterans Prosthesis',image: 'lib/constants/images/fist/veterans_prosthesis.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.fist, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> flails = [
      Weapon(name: 'Bastards Stars',image: 'lib/constants/images/flail/bastards_stars.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.flail, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Chainlink Flail',image: 'lib/constants/images/flail/chainlink_flail.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.flail, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Family Heads',image: 'lib/constants/images/flail/family_heads.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.flail, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Flail',image: 'lib/constants/images/flail/flail.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.flail,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nightrider Flail',image: 'lib/constants/images/flail/nightrider_flail.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.flail, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> great_axes = [
      Weapon(name: 'Axe Of Godrick',image: 'lib/constants/images/great_axe/axe_of_godrick.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Butchering Knife',image: 'lib/constants/images/great_axe/butchering_knife.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Crescent Moon Axe',image: 'lib/constants/images/great_axe/crescent_moon_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Executioners Greataxe',image: 'lib/constants/images/great_axe/executioners_greataxe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Black Axe',image: 'lib/constants/images/great_axe/gargoyles_black_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Great Axe',image: 'lib/constants/images/great_axe/gargoyles_great_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Greataxe',image: 'lib/constants/images/great_axe/greataxe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Omenkiller Cleaver',image: 'lib/constants/images/great_axe/great_omenkiller_cleaver.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Longhaft Axe',image: 'lib/constants/images/great_axe/longhaft_axe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rusted Anchor',image: 'lib/constants/images/great_axe/rusted_anchor.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Winged Greathorn',image: 'lib/constants/images/great_axe/winged_greathorn.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_axe, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> great_hammer = [
      Weapon(name: 'Battle Hammer',image: 'lib/constants/images/great_hammer/battle_hammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Beastclaw Greathammer',image: 'lib/constants/images/great_hammer/beastclaw_greathammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Brick Hammer',image: 'lib/constants/images/great_hammer/brick_hammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Celebrants Skull',image: 'lib/constants/images/great_hammer/celebrants_skull.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cranial Vessel Candlestand',image: 'lib/constants/images/great_hammer/cranial_vessel_candlestand.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Curved Great Club',image: 'lib/constants/images/great_hammer/curved_great_club.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Devourers Scepter',image: 'lib/constants/images/great_hammer/devourers_scepter.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Envoys Long Horn',image: 'lib/constants/images/great_hammer/envoys_long_horn.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Greathorn Hammer',image: 'lib/constants/images/great_hammer/greathorn_hammer.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Mace',image: 'lib/constants/images/great_hammer/great_mace.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Stars',image: 'lib/constants/images/great_hammer/great_stars.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Large Club',image: 'lib/constants/images/great_hammer/large_club.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Pickaxe',image: 'lib/constants/images/great_hammer/pickaxe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rotten Battle Hammer',image: 'lib/constants/images/great_hammer/rotten_battle_hammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> great_spear = [
      Weapon(name: 'Lance',image: 'lib/constants/images/great_spear/lance.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Mohgwyns Sacred Spear',image: 'lib/constants/images/great_spear/mohgwyns_sacred_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Serpent Hunter',image: 'lib/constants/images/great_spear/serpent_hunter.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Silurias Tree',image: 'lib/constants/images/great_spear/silurias_tree.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Treespear',image: 'lib/constants/images/great_spear/treespear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Vykes War Spear',image: 'lib/constants/images/great_spear/vykes_war_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.great_spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),

    ];
    List<Weapon> halberd = [
      Weapon(name: 'Banished Knights Halberd',image: 'lib/constants/images/halberd/banished_knights_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Commanders Standard',image: 'lib/constants/images/halberd/commanders_standard.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dragon Halberd',image: 'lib/constants/images/halberd/dragon_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Black Halberd',image: 'lib/constants/images/halberd/gargoyles_black_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Halberd',image: 'lib/constants/images/halberd/gargoyles_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Glaive',image: 'lib/constants/images/halberd/glaive.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Golden Halberd',image: 'lib/constants/images/halberd/golden_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Guardians Swordspear',image: 'lib/constants/images/halberd/guardians_swordspear.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Halberd',image: 'lib/constants/images/halberd/halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Lorettas War Sickle',image: 'lib/constants/images/halberd/lorettas_war_sickle.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Lucerne',image: 'lib/constants/images/halberd/lucerne.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nightrider Glaive',image: 'lib/constants/images/halberd/nightrider_glaive.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Pests Glaive',image: 'lib/constants/images/halberd/pests_glaive.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ripple Crescent Halberd',image: 'lib/constants/images/halberd/ripple_crescent_halberd.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Vulgar Militia Saw',image: 'lib/constants/images/halberd/vulgar_militia_saw.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Vulgar Militia Shotel',image: 'lib/constants/images/halberd/vulgar_militia_shotel.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.halberd,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> hammer = [
      Weapon(name: 'Club',image: 'lib/constants/images/hammer/club.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Curved Club',image: 'lib/constants/images/hammer/curved_club.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Envoys Horn',image: 'lib/constants/images/hammer/envoys_horn.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Hammer',image: 'lib/constants/images/hammer/hammer.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Mace',image: 'lib/constants/images/hammer/mace.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Marikas Hammer',image: 'lib/constants/images/hammer/marikas_hammer.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Monks Flamemace',image: 'lib/constants/images/hammer/monks_flamemace.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Morning Star',image: 'lib/constants/images/hammer/morning_star.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nox Flowing Hammer',image: 'lib/constants/images/hammer/nox_flowing_hammer.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ringed Finger',image: 'lib/constants/images/hammer/ringed_finger.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Scepter Of The All Knowing',image: 'lib/constants/images/hammer/scepter_of_the_all_knowing.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Spiked Club',image: 'lib/constants/images/hammer/spiked_club.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Stone Club',image: 'lib/constants/images/hammer/stone_club.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Warpick',image: 'lib/constants/images/hammer/warpick.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.hammer, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> heavy_thrusting_swords= [
      Weapon(name: 'Bloody Helice',image: 'lib/constants/images/heavy_thrusting_sword/bloody_helice.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.heavy_thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dragon Kings Cragblade',image: 'lib/constants/images/heavy_thrusting_sword/dragon_kings_cragblade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.heavy_thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Godskin Stitcher',image: 'lib/constants/images/heavy_thrusting_sword/godskin_stitcher.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.heavy_thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Great Epee',image: 'lib/constants/images/heavy_thrusting_sword/great_epee.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.heavy_thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> katanas = [
      Weapon(name: 'Dragonscale Blade',image: 'lib/constants/images/katana/dragonscale_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Hand Of Malenia',image: 'lib/constants/images/katana/hand_of_malenia.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Meteoric Ore Blade',image: 'lib/constants/images/katana/meteoric_ore_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Moonveil',image: 'lib/constants/images/katana/moonveil.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nagakiba',image: 'lib/constants/images/katana/nagakiba.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rivers Of Blood',image: 'lib/constants/images/katana/rivers_of_blood.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Serpentbone Blade',image: 'lib/constants/images/katana/serpentbone_blade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Uchigatana',image: 'lib/constants/images/katana/uchigatana.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.katana, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> reapers = [
      Weapon(name: 'Grave Scythe',image: 'lib/constants/images/reaper/grave_scythe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.reaper,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Halo Scythe',image: 'lib/constants/images/reaper/halo_scythe.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.reaper, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Scythe',image: 'lib/constants/images/reaper/scythe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.reaper, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Winged Scythe',image: 'lib/constants/images/reaper/winged_scythe.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.reaper, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> spears = [
      Weapon(name: 'Bolt Of Gransax',image: 'lib/constants/images/spear/bolt_of_gransax.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Celebrants Rib Rake',image: 'lib/constants/images/spear/celebrants_rib_rake.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Claymans Harpoon',image: 'lib/constants/images/spear/claymans_harpoon.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cleanrot Spear',image: 'lib/constants/images/spear/cleanrot_spear.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cross Naginata',image: 'lib/constants/images/spear/cross_naginata.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Crystal Spear',image: 'lib/constants/images/spear/crystal_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Death Ritual Spear',image: 'lib/constants/images/spear/death_ritual_spear.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Inquisitors Girandole',image: 'lib/constants/images/spear/inquisitors_girandole.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Iron Spear',image: 'lib/constants/images/spear/iron_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Partisan',image: 'lib/constants/images/spear/partisan.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Pike',image: 'lib/constants/images/spear/pike.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rotten Crystal Spear',image: 'lib/constants/images/spear/rotten_crystal_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Short Spear',image: 'lib/constants/images/spear/short_spear.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Spear',image: 'lib/constants/images/spear/spear.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Spiked Spear',image: 'lib/constants/images/spear/spiked_spear.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Torchpole',image: 'lib/constants/images/spear/torchpole.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.spear, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> straight_swords = [
      Weapon(name: 'Broadsword',image: 'lib/constants/images/straight_sword/broadsword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cane Sword',image: 'lib/constants/images/straight_sword/cane_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Carian Knights Sword',image: 'lib/constants/images/straight_sword/carian_knights_sword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Coded Sword',image: 'lib/constants/images/straight_sword/coded_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Crystal Sword',image: 'lib/constants/images/straight_sword/crystal_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Golden Epitaph',image: 'lib/constants/images/straight_sword/golden_epitaph.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Lazuli Glintstone Sword',image: 'lib/constants/images/straight_sword/lazuli_glintstone_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Longsword',image: 'lib/constants/images/straight_sword/longsword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Lordsworns Straight Sword',image: 'lib/constants/images/straight_sword/lordsworns_straight_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Miquellan Knights Sword',image: 'lib/constants/images/straight_sword/miquellan_knights_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nobles Slender Sword',image: 'lib/constants/images/straight_sword/nobles_slender_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ornamental Straight Sword',image: 'lib/constants/images/straight_sword/ornamental_straight_sword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Regalia Of Eochaid',image: 'lib/constants/images/straight_sword/regalia_of_eochaid.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rotten Crystal Sword',image: 'lib/constants/images/straight_sword/rotten_crystal_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Short Sword',image: 'lib/constants/images/straight_sword/short_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Sword Of Night And Flame',image: 'lib/constants/images/straight_sword/sword_of_night_and_flame.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Sword Of St Trina',image: 'lib/constants/images/straight_sword/sword_of_st_trina.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Warhawks Talon',image: 'lib/constants/images/straight_sword/warhawks_talon.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Weathered Straight Sword',image: 'lib/constants/images/straight_sword/weathered_straight_sword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.straight_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> thrusting_swords = [
      Weapon(name: 'Antspur Rapier',image: 'lib/constants/images/thrusting_sword/antspur_rapier.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Cleanrot Knights Sword',image: 'lib/constants/images/thrusting_sword/cleanrot_knights_sword.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Estoc',image: 'lib/constants/images/thrusting_sword/estoc.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Frozen Needle',image: 'lib/constants/images/thrusting_sword/frozen_needle.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Nobles Estoc',image: 'lib/constants/images/thrusting_sword/nobles_estoc.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rapier',image: 'lib/constants/images/thrusting_sword/rapier.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rogiers Rapier',image: 'lib/constants/images/thrusting_sword/rogiers_rapier.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.thrusting_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> twinblades = [
      Weapon(name: 'Eleonoras Poleblade',image: 'lib/constants/images/twinblade/eleonoras_poleblade.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Black Blades',image: 'lib/constants/images/twinblade/gargoyles_black_blades.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyles Twinblade',image: 'lib/constants/images/twinblade/gargoyles_twinblade.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Godskin Peeler',image: 'lib/constants/images/twinblade/godskin_peeler.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Twinblade',image: 'lib/constants/images/twinblade/twinblade.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Twinned Knight Swords',image: 'lib/constants/images/twinblade/twinned_knight_swords.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.twinblade, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> whips = [
      Weapon(name: 'Giants Red Braid',image: 'lib/constants/images/whip/giants_red_braid.png',
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Hoslows Petal Whip',image: 'lib/constants/images/whip/hoslows_petal_whip.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Magma Whip Candlestick',image: 'lib/constants/images/whip/magma_whip_candlestick.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Thorned Whip',image: 'lib/constants/images/whip/thorned_whip.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Urumi',image: 'lib/constants/images/whip/urumi.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Whip',image: 'lib/constants/images/whip/whip.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.whip, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> great_swords =  [
      Weapon(name: 'Alabaster\'s Lord Sword' , image: 'lib/constants/images/great_sword/alabasters_lord_sword.png', 
          way: ObtentionWay.boss, location: Location.west_limgrave, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Banished Knight\'s Greatsword' , image: 'lib/constants/images/great_sword/banished_knights_greatsword.png', 
          way: ObtentionWay.boss, location: Location.east_limgrave, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Bastard Sword' , image: 'lib/constants/images/great_sword/bastard_sword.png', 
          way: ObtentionWay.boss, location: Location.weeping_peninsula, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Blasphemous Blade' , image: 'lib/constants/images/great_sword/blasphemous_blade.png', 
          way: ObtentionWay.boss, location: Location.stormveil_castle, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Claymore' , image: 'lib/constants/images/great_sword/claymore.png', 
          way: ObtentionWay.boss, location: Location.liurnia_of_the_lake, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Dark Moon Greatsword' , image: 'lib/constants/images/great_sword/dark_moon_greatsword.png', 
          way: ObtentionWay.boss, location: Location.raya_lucaria_academy, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Death\s poker' , image: 'lib/constants/images/great_sword/death_poker.png', 
          way: ObtentionWay.boss, location: Location.caria_manor, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Flamberge' , image: 'lib/constants/images/great_sword/flamberge.png', 
          way: ObtentionWay.boss, location: Location.ainsel_river, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Forked Greatsword' , image: 'lib/constants/images/great_sword/forked_greatsword.png', 
          way: ObtentionWay.boss, location: Location.siofra_river, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyle\'s Blackblade' , image: 'lib/constants/images/great_sword/gargoyles_blackblade.png', 
          way: ObtentionWay.boss, location: Location.altus_plateau, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gargoyle\'s Greatsword' , image: 'lib/constants/images/great_sword/gargoyles_greatsword.png', 
          way: ObtentionWay.boss, location: Location.south_caelid, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Golden Order Greatsword' , image: 'lib/constants/images/great_sword/golden_order_greatsword.png', 
          way: ObtentionWay.boss, location: Location.nokron_eternal_city, weaponCategory: WeaponCategory.greatsword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Helphen\'s Steeple' , image: 'lib/constants/images/great_sword/helphens_steeple.png', 
          way: ObtentionWay.boss, location: Location.siofra_aqueduct, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Inseparable Sword' , image: 'lib/constants/images/great_sword/inseparable_sword.png', 
          way: ObtentionWay.boss, location: Location.carian_study_hall, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Iron Greatsword' , image: 'lib/constants/images/great_sword/iron_greatsword.png', 
          way: ObtentionWay.boss, location: Location.deeproot_depths, weaponCategory: WeaponCategory.greatsword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Knight Greatsword' , image: 'lib/constants/images/great_sword/knight_greatsword.png', 
          way: ObtentionWay.boss, location: Location.nokstella, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Lord\'s Worn\'s Greatsword' , image: 'lib/constants/images/great_sword/lordsworns_greatsword.png', 
          way: ObtentionWay.boss, location: Location.lake_of_rot, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Marais Executioner\'s Greatsword' , image: 'lib/constants/images/great_sword/marais_executioners_greatsword.png', 
          way: ObtentionWay.boss, location: Location.moonlight_altar, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ordovis\'s Greatsword' , image: 'lib/constants/images/great_sword/ordoviss_greatsword.png', 
          way: ObtentionWay.boss, location: Location.dragonbarrow, weaponCategory: WeaponCategory.greatsword, 
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Sacred Relic Sword' , image: 'lib/constants/images/great_sword/sacred_relic_sword.png', 
          way: ObtentionWay.boss, location: Location.leyndell, weaponCategory: WeaponCategory.greatsword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Sword of Milos' , image: 'lib/constants/images/great_sword/sword_of_milos.png', 
          way: ObtentionWay.boss, location: Location.forbidden_land, weaponCategory: WeaponCategory.greatsword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    List<Weapon> dlcWeapons = [
      Weapon(name: 'Ancient Meteoric Ore Greatsword', image: 'lib/constants/images/dlc/ancient_meteoric_ore_greatsword.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.colossal_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Ansbach\'s Longbow', image: 'lib/constants/images/dlc/ansbachs_longbow.png',
          way: ObtentionWay.quest, location: Location.DLC, weaponCategory: WeaponCategory.bow,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Anvil Hammer', image: 'lib/constants/images/dlc/anvil_hammer.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.colossal_weapon,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Backhand Blade', image: 'lib/constants/images/dlc/backhand_blade.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.backhand_blade,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Beast claw', image: 'lib/constants/images/dlc/beast_claw.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.beast_claw,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Bloodfiend\'s arm', image: 'lib/constants/images/dlc/bloodfiends_arm.png',
          way: ObtentionWay.farm, location: Location.DLC, weaponCategory: WeaponCategory.colossal_weapon,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Claws of Night', image: 'lib/constants/images/dlc/claws_of_night.png',
          way: ObtentionWay.quest, location: Location.DLC, weaponCategory: WeaponCategory.claw,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Curseblade\'s Cirque', image: 'lib/constants/images/dlc/curseblades_cirque.png',
          way: ObtentionWay.farm, location: Location.DLC, weaponCategory: WeaponCategory.backhand_blade,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Death Knight\'s Twin Axes', image: 'lib/constants/images/dlc/death_knights_twin_axes.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Devonia\'s Hammer', image: 'lib/constants/images/dlc/devonias_hammer.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.colossal_weapon,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Fire Knight\'s Greatsword', image: 'lib/constants/images/dlc/fire_knights_greatsword.png',
          way: ObtentionWay.farm, location: Location.DLC, weaponCategory: WeaponCategory.greatsword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Gazing Finger', image: 'lib/constants/images/dlc/gazing_finger.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.colossal_weapon,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Greatsword of Radahn (Light)', image: 'lib/constants/images/dlc/greatsword_of_radahn_light.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.colossal_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Greatsword of Radahn (Lord)', image: 'lib/constants/images/dlc/greatsword_of_radahn_lord.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.colossal_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Messmer Soldier\'s Axe', image: 'lib/constants/images/dlc/messmer_soldiers_axe.png',
          way: ObtentionWay.farm, location: Location.DLC, weaponCategory: WeaponCategory.axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Moonrithyll\'s Knight\'s Sword', image: 'lib/constants/images/dlc/moonrithylls_knights_sword.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.colossal_sword,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Rabbath\'s Cannon', image: 'lib/constants/images/dlc/rabbaths_cannon.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.ballista,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Red Bear\'s Claw', image: 'lib/constants/images/dlc/red_bears_claw.png',
          way: ObtentionWay.quest, location: Location.DLC, weaponCategory: WeaponCategory.beast_claw,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Shadow Sunflower Blossom', image: 'lib/constants/images/dlc/shadow_sunflower_blossom.png',
          way: ObtentionWay.boss, location: Location.DLC, weaponCategory: WeaponCategory.colossal_weapon,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Smithscript Axe', image: 'lib/constants/images/dlc/smithscript_axe.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.axe,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
      Weapon(name: 'Smithscript Cirque', image: 'lib/constants/images/dlc/smithscript_cirque.png',
          way: ObtentionWay.loot, location: Location.DLC, weaponCategory: WeaponCategory.backhand_blade,
          howToFind: 'It can be found inside the Deathtouched Catacombs in Stormhill, Limgrave. You need to turn the lever down in order to unlock the door of one of the previous halls. You will find the Uchigatana on a dead body hanging over the edge of the platform.'),
    ];
    allWeapons.addAll(axes);
    allWeapons.addAll(claws);
    allWeapons.addAll(colossal_swords);
    allWeapons.addAll(colossal_weapons);
    allWeapons.addAll(curved_greatswords);
    allWeapons.addAll(curved_swords);
    allWeapons.addAll(daggers);
    allWeapons.addAll(fists);
    allWeapons.addAll(flails);
    allWeapons.addAll(great_axes);
    allWeapons.addAll(great_hammer);
    allWeapons.addAll(great_spear);
    allWeapons.addAll(halberd);
    allWeapons.addAll(hammer);
    allWeapons.addAll(heavy_thrusting_swords);
    allWeapons.addAll(katanas);
    allWeapons.addAll(reapers);
    allWeapons.addAll(spears);
    allWeapons.addAll(straight_swords);
    allWeapons.addAll(thrusting_swords);
    allWeapons.addAll(twinblades);
    allWeapons.addAll(whips);
    allWeapons.addAll(great_swords);
    allWeapons.addAll(dlcWeapons);
    return allWeapons;
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
        case Location.DLC:
        return 'DLC';
    }
  }

}
