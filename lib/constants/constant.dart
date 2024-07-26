// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:elden_nexus/models/sorcery.dart';
import 'package:elden_nexus/models/talisman.dart';
import 'package:elden_nexus/models/tear.dart';
import '../models/armor.dart';
import '../models/incantation.dart';
import '../models/weapon.dart';

enum ItemCategory {
  weapon,
  armor,
  tear,
  incantation,
  sorcery,
  ashOfWar,
  talisman,
}

enum ArmorPiece {
  head,
  chest,
  arms,
  legs,
}

enum WeaponCategory {
  axe,
  ballista,
  backhand_blade,
  beast_claw,
  bow,
  claw,
  colossal_sword,
  colossal_weapon,
  crossbow,
  curved_greatsword,
  curved_sword,
  dagger,
  fist,
  flail,
  glintstone_staff,
  great_hammer,
  great_katana,
  great_spear,
  great_axe,
  great_bow,
  greatsword,
  halberd,
  hammer,
  hand_to_hand_art,
  heavy_thrusting_sword,
  katana,
  light_bow,
  light_greatsword,
  perfume_bottle,
  reaper,
  sacred_seal,
  spear,
  straight_sword,
  throwing_blade,
  thrusting_sword,
  torch,
  twinblade,
  whip,
  small_shield,
  medium_shield,
  greatshield,
  thrusting_shield,
}

enum StatusEffect {
  poison,
  deadly_poison,
  scarlet_rot,
  blood_loss,
  frostbite,
  sleep,
  madness,
  death_blight,
  eternal_sleep,
}

List<Weapon> allWeapons() {
  List<Weapon> allWeapons = [];
  List<Weapon> axes = [
    Weapon(
        name: 'Battle Axe',
        image: 'lib/constants/images/main_game_weapons/axe/battle_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Celebrants Cleaver',
        image:
            'lib/constants/images/main_game_weapons/axe/celebrants_cleaver.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Forked Hatchet',
        image: 'lib/constants/images/main_game_weapons/axe/forked_hatchet.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Hand Axe',
        image: 'lib/constants/images/main_game_weapons/axe/hand_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Highland Axe',
        image: 'lib/constants/images/main_game_weapons/axe/highland_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Icerind Hatchet',
        image: 'lib/constants/images/main_game_weapons/axe/icerind_hatchet.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Iron Cleaver',
        image: 'lib/constants/images/main_game_weapons/axe/iron_cleaver.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Jawbone Axe',
        image: 'lib/constants/images/main_game_weapons/axe/jawbone_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ripple Blade',
        image: 'lib/constants/images/main_game_weapons/axe/ripple_blade.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rosuss Axe',
        image: 'lib/constants/images/main_game_weapons/axe/rosus_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Sacrificial Axe',
        image: 'lib/constants/images/main_game_weapons/axe/sacrificial_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Stormhawk Axe',
        image: 'lib/constants/images/main_game_weapons/axe/stormhawk_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Warped Axe',
        image: 'lib/constants/images/main_game_weapons/axe/warped_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> claws = [
    Weapon(
        name: 'Bloodhound Claws',
        image:
            'lib/constants/images/main_game_weapons/claw/bloodhound_claws.png',
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Hookclaws',
        image: 'lib/constants/images/main_game_weapons/claw/hookclaws.png',
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Raptor Talons',
        image: 'lib/constants/images/main_game_weapons/claw/raptor_talons.png',
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Venomous Fang',
        image: 'lib/constants/images/main_game_weapons/claw/venomous_fang.png',
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> colossal_swords = [
    Weapon(
        name: 'Godslayers Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/godslayers_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Grafted Blade Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/grafted_blade_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Malikeths Black Blade',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/malikeths_black_blade.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Royal Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/royal_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ruins Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/ruins_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Starscourge Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/starscourge_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Trolls Golden Sword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/trolls_golden_sword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Troll Knights Sword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/troll_knights_sword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Watchdogs Greatsword',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/watchdogs_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Zweihander',
        image:
            'lib/constants/images/main_game_weapons/colossal_sword/zweihander.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> colossal_weapons = [
    Weapon(
        name: 'Axe Of Godfrey',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/axe_of_godfrey.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dragon Greatclaw',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/dragon_greatclaw.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Duelist Greataxe',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/duelist_greataxe.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Envoys Greathorn',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/envoys_greathorn.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Fallingstar Beast Jaw',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/fallingstar_beast_jaw.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ghizas Wheel',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/ghizas_wheel.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Giant Crusher',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/giant_crusher.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Golems Halberd',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/golems_halberd.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Club',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/great_club.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Prelates Inferno Crozier',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/prelates_inferno_crozier.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rotten Greataxe',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/rotten_greataxe.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rotten Staff',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/rotten_staff.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Staff Of The Avatar',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/staff_of_the_avatar.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Trolls Hammer',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/trolls_hammer.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Watchdogs Staff',
        image:
            'lib/constants/images/main_game_weapons/colossal_weapon/watchdogs_staff.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> curved_greatswords = [
    Weapon(
        name: 'Beastmans Cleaver',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/beastmans_cleaver.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Bloodhounds Fang',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/bloodhounds_fang.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dismounter',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/dismounter.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Magma Wyrms Scalesword',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/magma_wyrms_scalesword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Monks Flameblade',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/monks_flameblade.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Morgotts Cursed Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/morgotts_cursed_sword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Omen Cleaver',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/omen_cleaver.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Onyx Lords Greatsword',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/onyx_lords_greatsword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Zamor Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_greatsword/zamor_curved_sword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> curved_swords = [
    Weapon(
        name: 'Bandits Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/bandits_curved_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Beastmans Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/beastmans_curved_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Eclipse Shotel',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/eclipse_shotel.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Falchion',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/falchion.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Flowing Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/flowing_curved_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Grossmesser',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/grossmesser.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Magma Blade',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/magma_blade.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Mantis Blade',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/mantis_blade.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nox Flowing Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/nox_flowing_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Scavengers Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/scavengers_curved_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Scimitar',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/scimitar.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Serpent-gods Curved Sword',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/serpent-gods_curved_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Shamshir',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/shamshir.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Shotel',
        image: 'lib/constants/images/main_game_weapons/curved_sword/shotel.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Wing Of Astel',
        image:
            'lib/constants/images/main_game_weapons/curved_sword/wing_of_astel.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> daggers = [
    Weapon(
        name: 'Black Knife',
        image: 'lib/constants/images/main_game_weapons/dagger/black_knife.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Blade Of Calling',
        image:
            'lib/constants/images/main_game_weapons/dagger/blade_of_calling.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Bloodstained Dagger',
        image:
            'lib/constants/images/main_game_weapons/dagger/bloodstained_dagger.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Celebrants Sickle',
        image:
            'lib/constants/images/main_game_weapons/dagger/celebrants_sickle.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cinquedea',
        image: 'lib/constants/images/main_game_weapons/dagger/cinquedea.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Crystal Knife',
        image:
            'lib/constants/images/main_game_weapons/dagger/crystal_knife.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dagger',
        image: 'lib/constants/images/main_game_weapons/dagger/dagger.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Erdsteel Dagger',
        image:
            'lib/constants/images/main_game_weapons/dagger/erdsteel_dagger.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Glintstone Kris',
        image:
            'lib/constants/images/main_game_weapons/dagger/glintstone_kris.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Knife',
        image: 'lib/constants/images/main_game_weapons/dagger/great_knife.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ivory Sickle',
        image: 'lib/constants/images/main_game_weapons/dagger/ivory_sickle.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Misericorde',
        image: 'lib/constants/images/main_game_weapons/dagger/misericorde.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Parrying Dagger',
        image:
            'lib/constants/images/main_game_weapons/dagger/parrying_dagger.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Reduvia',
        image: 'lib/constants/images/main_game_weapons/dagger/reduvia.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Scorpions Stinger',
        image:
            'lib/constants/images/main_game_weapons/dagger/scorpions_stinger.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Wakizashi',
        image: 'lib/constants/images/main_game_weapons/dagger/wakizashi.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> fists = [
    Weapon(
        name: 'Caestus',
        image: 'lib/constants/images/main_game_weapons/fist/caestus.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cipher Pata',
        image: 'lib/constants/images/main_game_weapons/fist/cipher_pata.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Clinging Bone',
        image: 'lib/constants/images/main_game_weapons/fist/clinging_bone.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Grafted Dragon',
        image: 'lib/constants/images/main_game_weapons/fist/grafted_dragon.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Iron Ball',
        image: 'lib/constants/images/main_game_weapons/fist/iron_ball.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Katar',
        image: 'lib/constants/images/main_game_weapons/fist/katar.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Spiked Caestus',
        image: 'lib/constants/images/main_game_weapons/fist/spiked_caestus.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Star Fist',
        image: 'lib/constants/images/main_game_weapons/fist/star_fist.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Veterans Prosthesis',
        image:
            'lib/constants/images/main_game_weapons/fist/veterans_prosthesis.png',
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> flails = [
    Weapon(
        name: 'Bastards Stars',
        image:
            'lib/constants/images/main_game_weapons/flail/bastards_stars.png',
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Chainlink Flail',
        image:
            'lib/constants/images/main_game_weapons/flail/chainlink_flail.png',
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Family Heads',
        image: 'lib/constants/images/main_game_weapons/flail/family_heads.png',
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Flail',
        image: 'lib/constants/images/main_game_weapons/flail/flail.png',
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nightrider Flail',
        image:
            'lib/constants/images/main_game_weapons/flail/nightrider_flail.png',
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> great_axes = [
    Weapon(
        name: 'Axe Of Godrick',
        image:
            'lib/constants/images/main_game_weapons/great_axe/axe_of_godrick.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Butchering Knife',
        image:
            'lib/constants/images/main_game_weapons/great_axe/butchering_knife.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Crescent Moon Axe',
        image:
            'lib/constants/images/main_game_weapons/great_axe/crescent_moon_axe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Executioners Greataxe',
        image:
            'lib/constants/images/main_game_weapons/great_axe/executioners_greataxe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Black Axe',
        image:
            'lib/constants/images/main_game_weapons/great_axe/gargoyles_black_axe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Great Axe',
        image:
            'lib/constants/images/main_game_weapons/great_axe/gargoyles_great_axe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Greataxe',
        image: 'lib/constants/images/main_game_weapons/great_axe/greataxe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Omenkiller Cleaver',
        image:
            'lib/constants/images/main_game_weapons/great_axe/great_omenkiller_cleaver.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Longhaft Axe',
        image:
            'lib/constants/images/main_game_weapons/great_axe/longhaft_axe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rusted Anchor',
        image:
            'lib/constants/images/main_game_weapons/great_axe/rusted_anchor.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Winged Greathorn',
        image:
            'lib/constants/images/main_game_weapons/great_axe/winged_greathorn.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> great_hammer = [
    Weapon(
        name: 'Battle Hammer',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/battle_hammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Beastclaw Greathammer',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/beastclaw_greathammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Brick Hammer',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/brick_hammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Celebrants Skull',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/celebrants_skull.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cranial Vessel Candlestand',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/cranial_vessel_candlestand.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Curved Great Club',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/curved_great_club.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Devourers Scepter',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/devourers_scepter.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Envoys Long Horn',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/envoys_long_horn.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Greathorn Hammer',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/greathorn_hammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Mace',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/great_mace.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Stars',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/great_stars.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Large Club',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/large_club.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Pickaxe',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/pickaxe.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rotten Battle Hammer',
        image:
            'lib/constants/images/main_game_weapons/great_hammer/rotten_battle_hammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> great_spear = [
    Weapon(
        name: 'Lance',
        image: 'lib/constants/images/main_game_weapons/great_spear/lance.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Mohgwyns Sacred Spear',
        image:
            'lib/constants/images/main_game_weapons/great_spear/mohgwyns_sacred_spear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Serpent Hunter',
        image:
            'lib/constants/images/main_game_weapons/great_spear/serpent_hunter.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Silurias Tree',
        image:
            'lib/constants/images/main_game_weapons/great_spear/silurias_tree.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Treespear',
        image:
            'lib/constants/images/main_game_weapons/great_spear/treespear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Vykes War Spear',
        image:
            'lib/constants/images/main_game_weapons/great_spear/vykes_war_spear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> halberd = [
    Weapon(
        name: 'Banished Knights Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/banished_knights_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Commanders Standard',
        image:
            'lib/constants/images/main_game_weapons/halberd/commanders_standard.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dragon Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/dragon_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Black Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/gargoyles_black_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/gargoyles_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Glaive',
        image: 'lib/constants/images/main_game_weapons/halberd/glaive.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Golden Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/golden_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Guardians Swordspear',
        image:
            'lib/constants/images/main_game_weapons/halberd/guardians_swordspear.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Halberd',
        image: 'lib/constants/images/main_game_weapons/halberd/halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Lorettas War Sickle',
        image:
            'lib/constants/images/main_game_weapons/halberd/lorettas_war_sickle.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Lucerne',
        image: 'lib/constants/images/main_game_weapons/halberd/lucerne.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nightrider Glaive',
        image:
            'lib/constants/images/main_game_weapons/halberd/nightrider_glaive.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Pests Glaive',
        image:
            'lib/constants/images/main_game_weapons/halberd/pests_glaive.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ripple Crescent Halberd',
        image:
            'lib/constants/images/main_game_weapons/halberd/ripple_crescent_halberd.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Vulgar Militia Saw',
        image:
            'lib/constants/images/main_game_weapons/halberd/vulgar_militia_saw.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Vulgar Militia Shotel',
        image:
            'lib/constants/images/main_game_weapons/halberd/vulgar_militia_shotel.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> hammer = [
    Weapon(
        name: 'Club',
        image: 'lib/constants/images/main_game_weapons/hammer/club.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Curved Club',
        image: 'lib/constants/images/main_game_weapons/hammer/curved_club.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Envoys Horn',
        image: 'lib/constants/images/main_game_weapons/hammer/envoys_horn.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Hammer',
        image: 'lib/constants/images/main_game_weapons/hammer/hammer.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Mace',
        image: 'lib/constants/images/main_game_weapons/hammer/mace.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Marikas Hammer',
        image:
            'lib/constants/images/main_game_weapons/hammer/marikas_hammer.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Monks Flamemace',
        image:
            'lib/constants/images/main_game_weapons/hammer/monks_flamemace.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Morning Star',
        image: 'lib/constants/images/main_game_weapons/hammer/morning_star.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nox Flowing Hammer',
        image:
            'lib/constants/images/main_game_weapons/hammer/nox_flowing_hammer.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ringed Finger',
        image:
            'lib/constants/images/main_game_weapons/hammer/ringed_finger.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Scepter Of The All Knowing',
        image:
            'lib/constants/images/main_game_weapons/hammer/scepter_of_the_all_knowing.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Spiked Club',
        image: 'lib/constants/images/main_game_weapons/hammer/spiked_club.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Stone Club',
        image: 'lib/constants/images/main_game_weapons/hammer/stone_club.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Warpick',
        image: 'lib/constants/images/main_game_weapons/hammer/warpick.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> heavy_thrusting_swords = [
    Weapon(
        name: 'Bloody Helice',
        image:
            'lib/constants/images/main_game_weapons/heavy_thrusting_sword/bloody_helice.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dragon Kings Cragblade',
        image:
            'lib/constants/images/main_game_weapons/heavy_thrusting_sword/dragon_kings_cragblade.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Godskin Stitcher',
        image:
            'lib/constants/images/main_game_weapons/heavy_thrusting_sword/godskin_stitcher.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Great Epee',
        image:
            'lib/constants/images/main_game_weapons/heavy_thrusting_sword/great_epee.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> katanas = [
    Weapon(
        name: 'Dragonscale Blade',
        image:
            'lib/constants/images/main_game_weapons/katana/dragonscale_blade.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Hand Of Malenia',
        image:
            'lib/constants/images/main_game_weapons/katana/hand_of_malenia.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Meteoric Ore Blade',
        image:
            'lib/constants/images/main_game_weapons/katana/meteoric_ore_blade.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Moonveil',
        image: 'lib/constants/images/main_game_weapons/katana/moonveil.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nagakiba',
        image: 'lib/constants/images/main_game_weapons/katana/nagakiba.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rivers Of Blood',
        image:
            'lib/constants/images/main_game_weapons/katana/rivers_of_blood.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Serpentbone Blade',
        image:
            'lib/constants/images/main_game_weapons/katana/serpentbone_blade.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Uchigatana',
        image: 'lib/constants/images/main_game_weapons/katana/uchigatana.png',
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> reapers = [
    Weapon(
        name: 'Grave Scythe',
        image: 'lib/constants/images/main_game_weapons/reaper/grave_scythe.png',
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Halo Scythe',
        image: 'lib/constants/images/main_game_weapons/reaper/halo_scythe.png',
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Scythe',
        image: 'lib/constants/images/main_game_weapons/reaper/scythe.png',
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Winged Scythe',
        image:
            'lib/constants/images/main_game_weapons/reaper/winged_scythe.png',
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> spears = [
    Weapon(
        name: 'Bolt Of Gransax',
        image:
            'lib/constants/images/main_game_weapons/spear/bolt_of_gransax.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Celebrants Rib Rake',
        image:
            'lib/constants/images/main_game_weapons/spear/celebrants_rib_rake.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Claymans Harpoon',
        image:
            'lib/constants/images/main_game_weapons/spear/claymans_harpoon.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cleanrot Spear',
        image:
            'lib/constants/images/main_game_weapons/spear/cleanrot_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cross Naginata',
        image:
            'lib/constants/images/main_game_weapons/spear/cross_naginata.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Crystal Spear',
        image: 'lib/constants/images/main_game_weapons/spear/crystal_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Death Ritual Spear',
        image:
            'lib/constants/images/main_game_weapons/spear/death_ritual_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Inquisitors Girandole',
        image:
            'lib/constants/images/main_game_weapons/spear/inquisitors_girandole.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Iron Spear',
        image: 'lib/constants/images/main_game_weapons/spear/iron_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Partisan',
        image: 'lib/constants/images/main_game_weapons/spear/partisan.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Pike',
        image: 'lib/constants/images/main_game_weapons/spear/pike.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rotten Crystal Spear',
        image:
            'lib/constants/images/main_game_weapons/spear/rotten_crystal_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Short Spear',
        image: 'lib/constants/images/main_game_weapons/spear/short_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Spear',
        image: 'lib/constants/images/main_game_weapons/spear/spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Spiked Spear',
        image: 'lib/constants/images/main_game_weapons/spear/spiked_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Torchpole',
        image: 'lib/constants/images/main_game_weapons/spear/torchpole.png',
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> straight_swords = [
    Weapon(
        name: 'Broadsword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/broadsword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cane Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/cane_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Carian Knights Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/carian_knights_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Coded Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/coded_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Crystal Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/crystal_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Golden Epitaph',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/golden_epitaph.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Lazuli Glintstone Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/lazuli_glintstone_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Longsword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/longsword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Lordsworns Straight Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/lordsworns_straight_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Miquellan Knights Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/miquellan_knights_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nobles Slender Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/nobles_slender_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ornamental Straight Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/ornamental_straight_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Regalia Of Eochaid',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/regalia_of_eochaid.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rotten Crystal Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/rotten_crystal_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Short Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/short_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Sword Of Night And Flame',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/sword_of_night_and_flame.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Sword Of St Trina',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/sword_of_st_trina.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Warhawks Talon',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/warhawks_talon.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Weathered Straight Sword',
        image:
            'lib/constants/images/main_game_weapons/straight_sword/weathered_straight_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> thrusting_swords = [
    Weapon(
        name: 'Antspur Rapier',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/antspur_rapier.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Cleanrot Knights Sword',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/cleanrot_knights_sword.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Estoc',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/estoc.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Frozen Needle',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/frozen_needle.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Nobles Estoc',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/nobles_estoc.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rapier',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/rapier.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Rogiers Rapier',
        image:
            'lib/constants/images/main_game_weapons/thrusting_sword/rogiers_rapier.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> twinblades = [
    Weapon(
        name: 'Eleonoras Poleblade',
        image:
            'lib/constants/images/main_game_weapons/twinblade/eleonoras_poleblade.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Black Blades',
        image:
            'lib/constants/images/main_game_weapons/twinblade/gargoyles_black_blades.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyles Twinblade',
        image:
            'lib/constants/images/main_game_weapons/twinblade/gargoyles_twinblade.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Godskin Peeler',
        image:
            'lib/constants/images/main_game_weapons/twinblade/godskin_peeler.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Twinblade',
        image: 'lib/constants/images/main_game_weapons/twinblade/twinblade.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Twinned Knight Swords',
        image:
            'lib/constants/images/main_game_weapons/twinblade/twinned_knight_swords.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> whips = [
    Weapon(
        name: 'Giants Red Braid',
        image:
            'lib/constants/images/main_game_weapons/whip/giants_red_braid.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Hoslows Petal Whip',
        image:
            'lib/constants/images/main_game_weapons/whip/hoslows_petal_whip.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Magma Whip Candlestick',
        image:
            'lib/constants/images/main_game_weapons/whip/magma_whip_candlestick.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Thorned Whip',
        image: 'lib/constants/images/main_game_weapons/whip/thorned_whip.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Urumi',
        image: 'lib/constants/images/main_game_weapons/whip/urumi.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Whip',
        image: 'lib/constants/images/main_game_weapons/whip/whip.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
  ];
  List<Weapon> great_swords = [
    Weapon(
        name: 'Alabaster\'s Lord Sword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/alabasters_lord_sword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Banished Knight\'s Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/banished_knights_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Bastard Sword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/bastard_sword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Blasphemous Blade',
        image:
            'lib/constants/images/main_game_weapons/great_sword/blasphemous_blade.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Claymore',
        image:
            'lib/constants/images/main_game_weapons/great_sword/claymore.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Dark Moon Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/dark_moon_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Death\'s poker',
        image:
            'lib/constants/images/main_game_weapons/great_sword/death_poker.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Flamberge',
        image:
            'lib/constants/images/main_game_weapons/great_sword/flamberge.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Forked Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/forked_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyle\'s Blackblade',
        image:
            'lib/constants/images/main_game_weapons/great_sword/gargoyles_blackblade.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Gargoyle\'s Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/gargoyles_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Golden Order Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/golden_order_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Helphen\'s Steeple',
        image:
            'lib/constants/images/main_game_weapons/great_sword/helphens_steeple.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Inseparable Sword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/inseparable_sword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Iron Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/iron_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Knight Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/knight_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Lord\'s Worn\'s Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/lordsworns_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Marais Executioner\'s Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/marais_executioners_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Ordovis\'s Greatsword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/ordoviss_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Sacred Relic Sword',
        image:
            'lib/constants/images/main_game_weapons/great_sword/sacred_relic_sword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
    Weapon(
        name: 'Sword of Milos',
        image:
            'lib/constants/images/main_game_weapons/great_sword/sword_of_milos.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        scaling: Scaling(),
        weight: -1,
        isSomber: true,
        ashOfWar: "Unsheathe",
        mapLink: ""),
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
  return allWeapons;
}

List<Talisman> allTalismans() {
  List<Talisman> talismans = [
    Talisman(
        name: "Godfrey Icon",
        image:
            'lib/constants/images/talismans/main_game_talismans/godfrey_icon.png',
        howToFind:
            "Drops from Godefroy the Grafted, found in Golden Lineage Evergaol.",
        weight: 0.8,
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=3354&lat=-109.36719&lng=81.1123&code=mapA",
        description:
            "A legendary talisman depicting the Elden Lord Godfrey. Raises charge attack power of sorceries, incantations, and skills. Godfrey was a ferocious warrior. When he vowed to become a lord, he took the Beast Regent Serosh upon on his back to suppress the ceaseless lust for battle that raged within.",
        effect: "Raises attack power of charged  Spells and  Skills by 15%"),
  ];
  return talismans;
}

List<Tear> allSOTETears() {
  List<Tear> allTears = [];
  return allTears;
}

List<Tear> allTears() {
  List<Tear> allTears = [
    Tear(
        name: "Ruptured Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/ruptured_crystal_tear.png',
        howToFind: "Dropped by the Erdtree Avatar that resides in Liurnia of the Lakes.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1065&code=mapA",
        effect: "Causes concoction to explode in mixed physick.",
        duration: 3),
    Tear(
        name: "Greenspill Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/greenspill_crystal_tear.png',
        howToFind: "Mistwood: Found on an altar next to the Minor Erdtree in Mistwood along with the Spiked Cracked Tear.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=735&code=mapA",
        effect: "Temporarily boosts stamina in mixed physick (+15%).",
        duration: 180),
    Tear(
        name: "Cerulean Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/cerulean_crystal_tear.png',
        howToFind: "One dropped by the Erdtree Avatar that resides in Liurnia of the Lakes.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1064&code=mapA",
        effect: "Restores half of total FP in mixed physick.",
        duration: 0),
    Tear(
        name: "Cerulean Hidden Tear",
        image:
            'lib/constants/images/tears/main_game_tears/cerulean_hidden_tear.png',
        howToFind: "Mt. Gelmir: Minor Erdtree, drops from Ulcerated Tree Spirit. Directly East of the Road of Iniquity Site of Grace.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=3404&lat=-84.3125&lng=68.86496&code=mapA",
        effect: "Eliminates all FP consumption in mixed physick.",
        duration: 15),
    Tear(
        name: "Crimson Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/crimson_crystal_tear.png',
        howToFind: "In front of the statue in Third Church of Marika.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=789&code=mapA",
        effect: "Restores half of total HP in mixed physick.",
        duration: 0),
    Tear(
        name: "Crimsonburst Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/crimsonburst_crystal_tear.png',
        howToFind: "Weeping Peninsula beneath the Minor Erdtree: Dropped by the Erdtree Avatar boss upon defeat.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=716&code=mapA",
        effect: "Steadily restores HP for a time in mixed physick. (7 HP/s)",
        duration: 180),
    Tear(
        name: "Faith-knot Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/faith-knot_crystal_tear.png',
        howToFind: "North of the Demi-Human Forest Ruins. Directly east of the Church of Pilgrimage, just down the cliff. It's in a bowl under a tree and surrounded by poison flower enemies.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=3916&lat=-205.26094&lng=108.12919&code=mapA",
        effect: "Temporarily boosts faith in mixed physick (+10 faith)",
        duration: 180),
    Tear(
        name: "Strength-knot Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/strength-knot_crystal_tear.png',
        howToFind: "Stormhill: Head Northeast from Stormhill Shack to the cliffs. Look for a small, stone receptacle on the ground next to a troll.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1350&code=mapA",
        effect: "Temporarily boosts strength in mixed physick (+10 strength)",
        duration: 180),
    Tear(
        name: "Opaline Bubbletear",
        image:
            'lib/constants/images/tears/main_game_tears/opaline_bubbletear.png',
        howToFind: "Weeping Peninsula, beneath the Minor Erdtree: Dropped by the Erdtree Avatar boss upon defeat.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=715&code=mapA",
        effect: "Significantly negates next instance of damage.",
        duration: 180),
    Tear(
        name: "Spiked Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/spiked_cracked_tear.png',
        howToFind: "Found on an altar next to the Minor Erdtree in Mistwood along with the Greenspill Crystal Tear.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=734&code=mapA",
        effect: "Enhances charged attacks for a time in mixed physick (+15% damage)",
        duration: 180),
    Tear(
        name: "Dexterity-knot Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/dexterity-knot_crystal_tear.png',
        howToFind: "Can be found at the top of a small island at Liurnia of the Lakes Southwest of Boilprawn Shack.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1057&code=mapA",
        effect: "Temporarily boosts dexterity in mixed physick (+10 dex)",
        duration: 180),
    Tear(
        name: "Lightning-shrouding Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/lightning-shrouding_cracked_tear.png',
        howToFind: "Dropped by Erdtree Avatar in Northeastern Liurnia of the Lakes.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1863&code=mapA",
        effect: "Temporarily boosts lightning attacks in mixed physick (+20%).",
        duration: 180),
    Tear(
        name: "Magic-shrouding Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/magic-shrouding_cracked_tear.png',
        howToFind: "Defeat the Erdtree Avatar found in Liurnia of the Lakes, under the Minor Erdtree (Liurnia Northeast) east of the Mausoleum Compound Site of Grace.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1862&lat=-122.57812&lng=75.22759&code=mapA",
        effect: "Temporarily boosts magic attacks in mixed physick (+20%).",
        duration: 180),
    Tear(
        name: "Winged Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/winged_crystal_tear.png',
        howToFind: "Found on an altar surrounded by Skull enemies and large gravestones just inside the Capital Outskirts.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1143&code=mapA",
        effect: "Temporarily reduces equip load in mixed physick (+450%).",
        duration: 180),
    Tear(
        name: "Holy-shrouding Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/holy-shrouding_cracked_tear.png',
        howToFind: "Dropped by Erdtree Avatar in Northeastern Liurnia of the Lakes.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1864&code=mapA",
        effect: "Temporarily boosts holy attacks in mixed physick (+20%).",
        duration: 180),
    Tear(
        name: "Twiggy Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/twiggy_cracked_tear.png',
        howToFind: "Found on an altar guarded by enemies at the base of the Minor Erdtree in Capital Outskirts.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=1145&code=mapA",
        effect: "Briefly stop rune loss on death in mixed physick.",
        duration: 180),
    Tear(
        name: "Leaden Hardtear",
        image: 'lib/constants/images/tears/main_game_tears/leaden_hardtear.png',
        howToFind: "Drops from Ulcerated Tree Spirit in Mt. Gelmir.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=2558&lat=-84.50&lng=68.54&code=mapA",
        effect: "Temporarily boosts poise in mixed physick.",
        duration: 10),
    Tear(
        name: "Crimsonspill Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/crimsonspill_crystal_tear.png',
        howToFind: "Dropped by Wormface in Altus Plateau.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=5781&lat=-87.20&lng=94.43576&code=mapA",
        effect: "Temporarily boosts max HP in mixed physick (+10%)",
        duration: 180),
    Tear(
        name: "Greenburst Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/greenburst_crystal_tear.png',
        howToFind: "Dropped by the Erdtree Avatar found at the Minor Erdtree in Caelid, east of Smoldering Church.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=2928&lat=-166.670313&lng=128.698045&code=mapA",
        effect:
            "Temporarily boosts stamina recovery speed in mixed physick. (+15 stamina recovery per second)",
        duration: 180),
    Tear(
        name: "Speckled Hardtear",
        image:
            'lib/constants/images/tears/main_game_tears/speckled_hardtear.png',
        howToFind: "Defeat Wormface at Minor Erdtree (Altus Plateau).",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=5780&lat=-86.96875&lng=91.56022&code=mapA",
        effect: "Boosts resistance and heals status in mixed physick (+90 resistance).",
        duration: 180),
    Tear(
        name: "Flame-shrouding Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/flame-shrouding_cracked_tear.png',
        howToFind: "Dropped by the Erdtree Avatar found at the Minor Erdtree in Caelid, east of Smoldering Church.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=2929&lat=-166.995312&lng=129.17451&code=mapA",
        effect: "Temporarily boosts the power of one's fire attacks. (+20%)",
        duration: 180),
    Tear(
        name: "Crimson Bubbletear",
        image:
            'lib/constants/images/tears/main_game_tears/crimson_bubbletear.png',
        howToFind: "Dropped by the Erdtree Avatar guarding the Minor Erdtree in the east of the Mountaintops of the Giants.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=3419&lat=-67.792188&lng=162.230176&code=mapA",
        effect: "Restores HP when near death in mixed physick.",
        duration: 180),
    Tear(
        name: "Crimsonwhorl Bubbletear",
        image:
            'lib/constants/images/tears/main_game_tears/crimsonwhorl_bubbletear.png',
        howToFind: "Mountaintops of the Giants: On a cliff ledge south of Giants' Gravepost (above the grace point, the ledge is accessed by going north-east from the Foot of the Forge grace point, Just follow the edge of the cliff until you see the path going above Giant's Gravepost).",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=3573&lat=-80.71&lng=163.31&code=mapA",
        effect: "Converts damage received into HP in mixed physick. (5% of max HP when hit)",
        duration: 15),
    Tear(
        name: "Thorny Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/thorny_cracked_tear.png',
        howToFind: "Dropped by the Putrid Avatar at the Minor Erdtree in the Consecrated Snowfield, east of Ordina, Liturgical Town.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=8901&code=mapA",
        effect: "Makes consecutive attacks grow stronger in mixed physick. (Increases damage by 9%, 13%, and 20%)",
        duration: 180),
    Tear(
        name: "Stonebarb Cracked Tear",
        image:
            'lib/constants/images/tears/main_game_tears/stonebarb_cracked_tear.png',
        howToFind: "Obtained by defeating the Putrid Avatar near the second Minor Erdtree in Caelid.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=5927&lat=-166.976562&lng=131.316543&code=mapA",
        effect:
            "Make attacks more likely to break enemy stances in a mixed physick (+30% stance damage)",
        duration: 30),
    Tear(
        name: "Windy Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/windy_crystal_tear.png',
        howToFind: "The item can be found in Caelid in a pit southeast of the Nomadic Merchant near the Southern Aeonia Swamp Bank grace. One of the birds watches over it, facing south.",
        mapLink: "https://eldenring.wiki.fextralife.com/interactive+map?id=5933&lat=-188.906&lng=145.106&code=mapA",
        effect: "Enhances dodge rolls for a time in mixed physick (~22% more I-Frames).",
        duration: 180),
    Tear(
        name: "Opaline Hardtear",
        image:
            'lib/constants/images/tears/main_game_tears/opaline_hardtear.png',
        howToFind: "Dropped by Putrid Avatar in Northeastern Caelid.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+Map?id=5929&lat=-167.487&lng=130.378&code=mapA",
        effect: "Temporarily boosts all damage negations in physick (+15% damage negation).",
        duration: 180),
    Tear(
        name: "Purifying Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/purifying_crystal_tear.png',
        howToFind: "It can be found at the Second Church of Marika after defeating the invader Bloody Finger Eleonora.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=5778&lat=-93.75&lng=81.9647&code=mapA",
        effect: "Purifies the Lord of Blood's curse in a mixed physick.",
        duration: 0),
    Tear(
        name: "Intelligence-knot Crystal Tear",
        image:
            'lib/constants/images/tears/main_game_tears/intelligence-knot_crystal_tear.png',
        howToFind: "From Road to the Manor Site of Grace, head southeast down the slope and turn back towards north. Loot from a small, half-bowl structure guarded by a few Lesser Spider Hand and one Spider Hand.",
        mapLink: "https://eldenring.wiki.fextralife.com/Interactive+map?id=5920&lat=-112.1328&lng=54.722&code=mapA",
        effect: "Temporarily boosts intelligence in mixed physick. (+10 int)",
        duration: 180),
  ];
  return allTears;
}

List<Armor> allArmors() {
  List<Armor> allArmors = [
    Armor(name: "Test armor", image: '', armorPiece: ArmorPiece.arms, howToFind: "NTM", mapLink: '', weight: 14)
  ];
  return allArmors;
}

List<Armor> allSOTEArmors() {
  List<Armor> allArmors = [
    Armor(name: "Test armor DLC", image: '', armorPiece: ArmorPiece.legs, howToFind: "NTM DLC", mapLink: '', weight: 14)
  ];
  return allArmors;
}

List<Incantation> allIncantations() {
  List<Incantation> allIncantations = [
    Incantation(
        name: "Test incantation",
        image: '',
        howToFind: "NTM",
        mapLink: '',
        description: "NTM",
        effect: "NTM",
    damageType: 'fire',
    fPCost: 10),
  ];
  return allIncantations;
}

List<Incantation> allSOTEIncantations(){
  List<Incantation> allIncantations = [
    Incantation(
        name: "Test incantation DLC",
        image: '',
        howToFind: "NTM DLC",
        mapLink: '',
        description: "NTM DLC",
        effect: "NTM DLC",
        damageType: 'fire',
        fPCost: 10),
  ];
  return allIncantations;
}

List<Sorcery> allSorceries(){
  List<Sorcery> allSorceries = [
    Sorcery(
        name: "Test sorcery DLC",
        image: '',
        howToFind: "NTM DLC",
        mapLink: '',
        description: "NTM DLC",
        effect: "NTM DLC",
        damageType: 'fire',
        fPCost: 10),
  ];
  return allSorceries;
}

List<Sorcery> allSOTESorceries(){
  List<Sorcery> allSorceries = [
    Sorcery(
        name: "Test sorcery DLC",
        image: '',
        howToFind: "NTM DLC",
        mapLink: '',
        description: "NTM DLC",
        effect: "NTM DLC",
        damageType: 'fire',
        fPCost: 10),
  ];
  return allSorceries;
}
