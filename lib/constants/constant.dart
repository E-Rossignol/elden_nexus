// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import '../models/ash_of_war.dart';
import '../models/weapon.dart';

enum ItemCategory {
  weapon,
  armor,
  tear,
  incantation,
  sorcery,
  ashOfWar,
}

enum ObtentionWay { farm, buy, quest, loot, boss }

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

List<Weapon> allDlcWeapons() {
  List<Weapon> dlcWeapons = [
    Weapon(
        name: 'Death Knight\'s Twin Axes',
        image: 'lib/constants/images/dlc_weapons/death_knights_twin_axes.png',
        weaponCategory: WeaponCategory.axe,
        howToFind:
            'Fog Rift Catacombs: The weapon is obtained as a reward for defeating the Death Knight boss.',
        scaling: Scaling(str: 'C', dex: 'D', fai: 'C'),
        weight: 5.5,
        isSomber: true,
        ashOfWar: "Blinkbolt: Twinaxe",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655221&code=mapD'),
    Weapon(
        name: 'Messmer Soldier\'s Axe',
        image: 'lib/constants/images/dlc_weapons/messmer_soldiers_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind: 'Dropped by Messmer Soldiers.',
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 5.5,
        isSomber: false,
        ashOfWar: "War Cry",
        mapLink: ""),
    Weapon(
        name: 'Forked Tongue Hatchet',
        image: 'lib/constants/images/dlc_weapons/forked_tongue_hatchet.png',
        weaponCategory: WeaponCategory.axe,
        howToFind:
            'Dropped by Imps in catacombs (you can farm it in Scorpion River Catacombs)',
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 4,
        isSomber: false,
        ashOfWar: "Dragonform Flame",
        mapLink: 'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655267&code=mapD',
        status: {StatusEffect.blood_loss: 50}),
    Weapon(
        name: 'Smithscript Axe',
        image: 'lib/constants/images/dlc_weapons/smithscript_axe.png',
        weaponCategory: WeaponCategory.axe,
        howToFind:
            "Taylew's Ruined Forge: From the initial site of grace, continue following the path, get past the enemy, and take the ladder down then jump across the other platforms and turn left. You will find a Golem there. Behind it, at the back of the room, you will find the Smithscript Axe.",
        scaling: Scaling(str: 'C', dex: 'D', int: 'E', fai: 'E'),
        weight: 5.0,
        isSomber: false,
        ashOfWar: "Wild Strikes",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655350&code=mapD'),
    Weapon(
        name: 'Ancient Meteoric Ore Greatsword',
        image:
            'lib/constants/images/dlc_weapons/ancient_meteoric_ore_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Ruined Forge Starfall Past: The weapon is acquired after examining the altar of the Ruined Forge of Starfall Past. The altar is found on the second level. To reach the altar, you must pull the lever to make the iron door rise, and use it as a platform to jump across to the second level where the altar is.',
        scaling: Scaling(str: 'B', dex: 'E', arc: 'D'),
        weight: 22,
        isSomber: true,
        ashOfWar: "White Light Charge",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=658911&code=mapD'),
    Weapon(
        name: 'Ansbach\'s Longbow',
        image: 'lib/constants/images/dlc_weapons/ansbachs_longbow.png',
        weaponCategory: WeaponCategory.bow,
        howToFind:
            'Assist or Kill Sir Ansbach during his questline in Shadow Keep against the enemy invader.',
        scaling: Scaling(str: 'D', dex: 'D'),
        weight: 4.5,
        isSomber: true,
        ashOfWar: "Fan Shot",
        mapLink: ""),
    Weapon(
        name: 'Anvil Hammer',
        image: 'lib/constants/images/dlc_weapons/anvil_hammer.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Ruined Forge Lava Intake. Use the column you have lowered with the lever as a bridge and climb it until the end. Beware of the fire blob, and then at the top, turn right and jump to reach the stairs. Climb them up and interact with a furnace to obtain this weapon and an Ancient Dragon Smithing Stone.',
        scaling: Scaling(str: 'B', dex: 'E', int: 'E', fai: 'D'),
        weight: 22,
        isSomber: true,
        ashOfWar: "Smithing Art Spears",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655189&code=mapD'),
    Weapon(
        name: 'Backhand Blade',
        image: 'lib/constants/images/dlc_weapons/backhand_blade.png',
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'Besides a coffin, in the Inquisitor enemies area of Gravesite Plain, not far from the first site of grace.',
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 2.0,
        isSomber: false,
        ashOfWar: "Blind Spot",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655035&code=mapD'),
    Weapon(
        name: 'Beast claw',
        image: 'lib/constants/images/dlc_weapons/beast_claw.png',
        weaponCategory: WeaponCategory.beast_claw,
        howToFind:
            'Drops from killing Logur the Beast Claw in Gravesite Plains in the forest, southeast of the Gravesite Plain Site of Grace.',
        scaling: Scaling(str: 'C', dex: 'D'),
        weight: 3,
        isSomber: false,
        ashOfWar: "Savage Claw",
        status: {StatusEffect.blood_loss: 45},
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=248595&code=mapD'),
    Weapon(
        name: 'Bloodfiend\'s arm',
        image: 'lib/constants/images/dlc_weapons/bloodfiends_arm.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Guaranteed SINGLE drop from a Bloodfiends group in Prospect Town, which can be found earlygame.',
        scaling: Scaling(str: 'C', dex: 'E', arc: 'C'),
        weight: 20,
        isSomber: false,
        ashOfWar: "Endure",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659417&code=mapD'),
    Weapon(
        name: 'Claws of Night',
        image: 'lib/constants/images/dlc_weapons/claws_of_night.png',
        weaponCategory: WeaponCategory.claw,
        howToFind:
            'Dropped by NPC invader Swordhand of Night Anna, found in the Finger Ruins of Miyr underneath Cathedral of Manus Metyr. This area can only be accessed by progressing Ymir\'s questline.',
        scaling: Scaling(dex: 'B'),
        weight: 3,
        isSomber: true,
        status: {StatusEffect.blood_loss: 45},
        ashOfWar: "Scattershot Throw",
        mapLink: ""),
    Weapon(
        name: 'Curseblade\'s Cirque',
        image: 'lib/constants/images/dlc_weapons/curseblades_cirque.png',
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'Drops from Curseblade enemies who wield it (one is located on top of an arch 10 seconds from the very first site of grace, and another is located right next to the Stage Front Site of Grace in Belurat, Tower Settlement, which is quite easy to farm).',
        scaling: Scaling(str: 'D', dex: 'B'),
        weight: 4.5,
        isSomber: true,
        ashOfWar: "Deadly Dance",
        mapLink: "",
        status: {StatusEffect.blood_loss: 45}),
    Weapon(
        name: 'Devonia\'s Hammer',
        image: 'lib/constants/images/dlc_weapons/devonias_hammer.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Defeat Crucible Knight near Rauh Ancient Ruins, East Grace.',
        scaling: Scaling(str: 'B', dex: 'D', fai: 'C'),
        weight: 20,
        isSomber: true,
        ashOfWar: "Devonia's Vortex",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655653&code=mapD'),
    Weapon(
        name: 'Fire Knight\'s Greatsword',
        image: 'lib/constants/images/dlc_weapons/fire_knights_greatsword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: 'Drop by Fire Knights (Shadow Keep)',
        scaling: Scaling(str: 'D', dex: 'C', fai: 'D'),
        weight: 16,
        isSomber: false,
        ashOfWar: "Stamp (Upward Cut)",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Shadow+of+the+Erdtree+Map?id=655353&code=mapD'),
    Weapon(
        name: 'Gazing Finger',
        image: 'lib/constants/images/dlc_weapons/gazing_finger.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Trade Remembrance of the Mother of Fingers at Enia to receive this weapon.',
        scaling: Scaling(str: 'B', int: 'D', fai: 'E'),
        weight: 15,
        isSomber: true,
        ashOfWar: "Kowtower's Resentment",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655728&code=mapD'),
    Weapon(
        name: 'Greatsword of Radahn (Light)',
        image:
            'lib/constants/images/dlc_weapons/greatsword_of_radahn_light.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Trade Remembrance of a God and a Lord with Enia at Roundtable Hold.',
        scaling: Scaling(str: 'C', dex: 'C', int: 'D'),
        weight: 20,
        isSomber: true,
        ashOfWar: "Lightspeed Slash",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655561&code=mapD'),
    Weapon(
        name: 'Greatsword of Radahn (Lord)',
        image: 'lib/constants/images/dlc_weapons/greatsword_of_radahn_lord.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Trade Remembrance of a God and a Lord with Enia at Roundtable Hold.',
        scaling: Scaling(str: 'C', dex: 'C', int: 'D'),
        weight: 20,
        isSomber: true,
        ashOfWar: "Promised Consort",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655561&code=mapD'),
    Weapon(
        name: 'Moonrithyll\'s Knight\'s Sword',
        image:
            'lib/constants/images/dlc_weapons/moonrithylls_knights_sword.png',
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'The weapon drops from defeating the hostile NPC Invader, Moonrithyll, Carian Knight.',
        scaling: Scaling(str: 'C', dex: 'C', int: 'D'),
        weight: 18,
        isSomber: true,
        ashOfWar: "Tremendous Phalanx",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655166&code=mapD'),
    Weapon(
        name: 'Rabbath\'s Cannon',
        image: 'lib/constants/images/dlc_weapons/rabbaths_cannon.png',
        weaponCategory: WeaponCategory.ballista,
        howToFind:
            'Rabbath\'s Rise. After you free the Spiritspring, head outside and use it while mounted on Torrent to reach the higher part of the tower. Loot the chest at the top to obtain this weapon.',
        scaling: Scaling(),
        weight: 15,
        isSomber: true,
        ashOfWar: "Kick",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655104&code=mapD'),
    Weapon(
        name: 'Red Bear\'s Claw',
        image: 'lib/constants/images/dlc_weapons/red_bears_claw.png',
        weaponCategory: WeaponCategory.beast_claw,
        howToFind:
            'Northern Nameless Mausoleum: Weapon drops upon defeating the Red Bear located at the Northern Nameless Mausoleum.',
        scaling: Scaling(str: 'B', dex: 'D'),
        weight: 4,
        isSomber: true,
        ashOfWar: "Red Bear Hunt",
        status: {StatusEffect.blood_loss: 45},
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655217&code=mapD'),
    Weapon(
        name: 'Shadow Sunflower Blossom',
        image: 'lib/constants/images/dlc_weapons/shadow_sunflower_blossom.png',
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Trade Remembrance of the Shadow Sunflower at Enia to receive this weapon.',
        scaling: Scaling(str: 'C', dex: 'E', fai: 'B'),
        weight: 16,
        isSomber: true,
        ashOfWar: "Shadow Sunflower Headbutt",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655367&code=mapD'),
    Weapon(
        name: 'Smithscript Cirque',
        image: 'lib/constants/images/dlc_weapons/smithscript_cirque.png',
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'The weapon is looted from a body in the Ruined Forge of Starfall Past. The body is located by the edge of the sewage waterfall.',
        scaling: Scaling(str: 'D', dex: 'C', int: 'E', fai: 'E'),
        weight: 2,
        isSomber: false,
        ashOfWar: "Blind Spot",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=658906&code=mapD'),
    Weapon(
        name: 'Barbed Staff-Spear',
        image: 'lib/constants/images/dlc_weapons/barbed_staff-spear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "This can be dropped by Jori Elder Inquisitor who can be found in the Abyssal Woods.",
        scaling: Scaling(str: 'D', dex: 'D', fai: 'A'),
        weight: 7.5,
        status: {StatusEffect.blood_loss: 55},
        isSomber: true,
        ashOfWar: "Jori's Inquisition",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655841&code=mapD"),
    Weapon(
        name: 'Black Steel Greathammer',
        image: 'lib/constants/images/dlc_weapons/black_steel_greathammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind:
            "Guaranteed drop from the black knight found at the Church of Consolation.",
        scaling: Scaling(str: 'B', dex: 'E', fai: 'C'),
        weight: 12,
        isSomber: false,
        ashOfWar: "Endure",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659045&code=mapD"),
    Weapon(
        name: 'Black Steel GreatShield',
        image: 'lib/constants/images/dlc_weapons/black_steel_greatshield.png',
        weaponCategory: WeaponCategory.greatshield,
        howToFind:
            "Dropped by Black Knight Garrew that can be found by Fog Rift Fort.",
        scaling: Scaling(str: 'B'),
        weight: 19.5,
        isSomber: false,
        ashOfWar: "Shield Bash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655219&code=mapD"),
    Weapon(
        name: 'Black Steel Twinblade',
        image: 'lib/constants/images/dlc_weapons/black_steel_twinblade.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind:
            "Drops from the Black Knight located at the top of western camp in Scadu Altus (Northeast of Church of the Crusade).",
        scaling: Scaling(str: 'D', dex: 'C', fai: 'D'),
        weight: 8,
        isSomber: false,
        ashOfWar: "Spinning Slash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658996&code=mapD"),
    Weapon(
        name: 'Bloodfiend\'s Fork',
        image: 'lib/constants/images/dlc_weapons/bloodfiends_fork.png',
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Dropped from Bloodfiends who wield it (you can find two in a melee battle not far from Ruined Forge Lave Intake).",
        scaling: Scaling(str: 'C', dex: 'E', arc: 'D'),
        weight: 4.5,
        isSomber: false,
        ashOfWar: "Barbaric Roar",
        status: {StatusEffect.blood_loss: 30},
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=654994&code=mapD"),
    Weapon(
        name: 'Bloodfiend\'s Sacred Spear',
        image: 'lib/constants/images/dlc_weapons/bloodfiends_sacred_spear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "The Bloodfiend west of Taylew's Ruined Forge drops this when killed.",
        scaling: Scaling(str: 'D', dex: 'E', arc: 'B'),
        weight: 8,
        status: {StatusEffect.blood_loss: 55},
        isSomber: true,
        ashOfWar: "Bloodfiend's Bloodboon",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659336&code=mapD"),
    Weapon(
        name: 'Bone Bow',
        image: 'lib/constants/images/dlc_weapons/bone_bow.png',
        weaponCategory: WeaponCategory.light_bow,
        howToFind:
            "Belurat Tower Settlement: Can be found being protected by 2 giant Spider-Scorpions, inside the massive tower with a broken spiral staircase.",
        scaling: Scaling(str: 'D', dex: 'D'),
        weight: 3,
        isSomber: true,
        ashOfWar: "Rancor Shot",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=654950&code=mapD"),
    Weapon(
        name: 'Bonny Butchering Knife',
        image: 'lib/constants/images/dlc_weapons/bonny_butchering_knife.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "Bonny Village: Below a small shed, outside a house. Near the broken bridge.",
        scaling: Scaling(str: 'B', dex: 'D'),
        weight: 8.5,
        isSomber: true,
        ashOfWar: "Hone Blade",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655082&code=mapD"),
    Weapon(
        name: 'Carian Sorcery Sword',
        image: 'lib/constants/images/dlc_weapons/carian_sorcery_sword.png',
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind:
            "In a chest after dropping down into Castle Ensis from Scadu Altus.",
        scaling: Scaling(str: 'E', dex: 'D', int: 'S'),
        weight: 2.5,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659099&code=mapD"),
    Weapon(
        name: 'Carian Thrusting Shield',
        image: 'lib/constants/images/dlc_weapons/carian_thrusting_shield.png',
        weaponCategory: WeaponCategory.thrusting_shield,
        howToFind:
            "Shadow Keep: From the \"Storehouse, Back Section\" site of grace, go west and you will reach a room where you find a Fire Knight and a few other enemies. The item is right past the Fire Knight and can be found on a corpse under the table.",
        scaling: Scaling(str: 'C', dex: 'C', int: 'D'),
        weight: 10.5,
        isSomber: false,
        ashOfWar: "Shield Strike",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655499&code=mapD"),
    Weapon(
        name: 'Chilling Perfume Bottle',
        image: 'lib/constants/images/dlc_weapons/chilling_perfume_bottle.png',
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Lamenter's Gaol, after using the Upper Gaol key on the door, descending the ladder, and walking into the room with the frozen floor, some Jar Innards will come out of a door to your right. The Chilling Perfume Bottle is in that room.",
        scaling: Scaling(dex: 'C', int: 'C'),
        weight: 1,
        status: {StatusEffect.frostbite: 60},
        isSomber: false,
        ashOfWar: "Kick",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659038&code=mapD"),
    Weapon(
        name: 'Deadly Poison Perfume Bottle',
        image:
            'lib/constants/images/dlc_weapons/deadly_poison_perfume_bottle.png',
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind: "Can be purchased from the Thiollier for 6000 Runes.",
        scaling: Scaling(dex: 'C', arc: 'C'),
        weight: 1,
        isSomber: true,
        status: {StatusEffect.deadly_poison: 66},
        ashOfWar: "Deadly Poison Spray",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655447&code=mapD"),
    Weapon(
        name: 'Dancing Blade of Ranah',
        image: 'lib/constants/images/dlc_weapons/dancing_blade_of_ranah.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'Dropped by defeating Dancer of Ranah at the Southern Nameless Mausoleum.',
        scaling: Scaling(dex: 'A'),
        weight: 3.5,
        isSomber: true,
        ashOfWar: "Unending Dance",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655762&code=mapD'),
    Weapon(
        name: 'Death Knight\'s Longhaft Axe',
        image:
            'lib/constants/images/dlc_weapons/death_knights_longhaft_axe.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "The weapon is obtained as a reward for defeating the Death Knight boss located at the Scorpion River Catacombs.",
        scaling: Scaling(str: 'B', dex: 'E', fai: 'D'),
        weight: 11.5,
        isSomber: true,
        ashOfWar: "Blinkbolt: Long-hafted Axe",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655278&code=mapD"),
    Weapon(
        name: 'Dragon-Hunter\'s Great Katana',
        image: 'lib/constants/images/dlc_weapons/dragon-hunters.png',
        weaponCategory: WeaponCategory.great_katana,
        howToFind: "Dropped by the Ancient Dragon-Man in the Dragon's Pit.",
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 10.5,
        isSomber: true,
        status: {StatusEffect.blood_loss: 55},
        ashOfWar: "Dragonwound Slash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655545&code=mapD"),
    Weapon(
        name: 'Dane\'s Footwork',
        image: 'lib/constants/images/dlc_weapons/danes_footwork.png',
        weaponCategory: WeaponCategory.hand_to_hand_art,
        howToFind:
            "Enir-Ilim: Can be obtained by looting Dryleaf Dane's body after defeating him in Enir-Ilim.",
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 1,
        isSomber: false,
        ashOfWar: "Palm Blast",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658973&code=mapD"),
    Weapon(
        name: 'Dryleaf Arts',
        image: 'lib/constants/images/dlc_weapons/dryleaf_arts.png',
        weaponCategory: WeaponCategory.hand_to_hand_art,
        howToFind:
            "This weapon is obtained as a drop upon defeating Dryleaf Dane.",
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 1,
        isSomber: false,
        ashOfWar: "Palm Blast",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655679&code=mapD"),
    Weapon(
        name: 'Maternal Staff',
        image: 'lib/constants/images/dlc_weapons/maternal_staff.png',
        weaponCategory: WeaponCategory.glintstone_staff,
        howToFind:
            "Cathedral of Manus Metyr: Dropped by Count Ymir, Mother of Fingers.",
        scaling: Scaling(str: 'E', int: 'D', arc: 'D'),
        weight: 2.5,
        isSomber: false,
        ashOfWar: "No Skill",
        passive: 'Boosts Finger Sorcery',
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655736&code=mapD"),
    Weapon(
        name: 'Dryleaf Seal',
        image: 'lib/constants/images/dlc_weapons/dryleaf_seal.png',
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Found on a ledge under a cave guarded by gravebirds in the area under Bonny Village.",
        scaling: Scaling(str: 'D', fai: 'S'),
        weight: 1.5,
        isSomber: false,
        passive: "Boosts Miquella's Incantations",
        ashOfWar: "No Skill",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655820&code=mapD"),
    Weapon(
        name: 'Dueling Shield',
        image: 'lib/constants/images/dlc_weapons/dueling_shield.png',
        weaponCategory: WeaponCategory.thrusting_shield,
        howToFind:
            "Shadow Keep: From the middle area, take the set of stairs to the next floor. Move to the eastern side, climb the wooden platform, and fight the Vulgar Militiamen. Use the stone platforms to reach the other side, the item is against the wall.",
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 9,
        isSomber: false,
        ashOfWar: "Shield Strike",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Shadow+of+the+Erdtree+Map?id=655353&code=mapD"),
    Weapon(
        name: 'Euporia',
        image: 'lib/constants/images/dlc_weapons/euporia.png',
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "Follow a full guide on the internet to unlock this weapon.",
        scaling: Scaling(str: 'D', dex: 'D', fai: 'B'),
        weight: 8.5,
        isSomber: true,
        ashOfWar: "Euporia Vortex",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658802&code=mapD"),
    Weapon(
        name: 'Falx',
        image: 'lib/constants/images/dlc_weapons/falx.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'Dropped by Hornsent when invaded close to the Rauh Ancient Ruins site of grace.',
        scaling: Scaling(str: 'D', dex: 'B'),
        weight: 4,
        isSomber: true,
        status: {StatusEffect.blood_loss: 55},
        ashOfWar: "Revenger's Blade",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659539&code=mapD'),
    Weapon(
        name: 'Fire Knight\'s Seal',
        image: 'lib/constants/images/dlc_weapons/fire_knights_seal.png',
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Shadow Keep: In the area with the giant Queen Marika statue, it is behind the statue. You have to use the lever to lower the water level.",
        scaling: Scaling(str: 'D', fai: 'S'),
        weight: 1.5,
        isSomber: false,
        passive: "Boosts Messmer Fire Incantations",
        ashOfWar: "No Skill",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655486&code=mapD"),
    Weapon(
        name: 'Fire Knight\'s Shortsword',
        image: 'lib/constants/images/dlc_weapons/fire_knights_shortsword.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind: "Drop by Fire Knights wielding this weapon in Shadow Keep.",
        scaling: Scaling(str: 'D', dex: 'C', fai: 'D'),
        weight: 2,
        isSomber: false,
        ashOfWar: "Quickstep",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Shadow+of+the+Erdtree+Map?id=655353&code=mapD'),
    Weapon(
        name: 'Firespark Perfume Bottle',
        image: 'lib/constants/images/dlc_weapons/firespark_perfume_bottle.png',
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Found in an elevated area South of the Castle Front Site of Grace, in a chest guarded by both Perfumers and Messmer Soldiers. ",
        scaling: Scaling(dex: 'B'),
        weight: 1,
        isSomber: false,
        ashOfWar: "Kick",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655459&code=mapD"),
    Weapon(
        name: 'Flowerstone Gavel',
        image: 'lib/constants/images/dlc_weapons/flowerstone_gavel.png',
        weaponCategory: WeaponCategory.hammer,
        howToFind:
            "The Dragon Communion Priestess drops this item at the Grand Altar of Dragon Communion after defeating Bayle The Dread.",
        scaling: Scaling(str: 'C', dex: 'D', arc: 'C'),
        weight: 6.0,
        isSomber: true,
        ashOfWar: "Flower Dragonbolt",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659031&code=mapD"),
    Weapon(
        name: 'Frenzyflame Perfume Bottle',
        image:
            'lib/constants/images/dlc_weapons/frenzyflame_perfume_bottle.png',
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Looted from a dead body located at the northern interior of the Abandoned Church in Abyssal Woods.",
        scaling: Scaling(str: 'D', dex: 'C', int: 'D', fai: 'D'),
        weight: 1,
        isSomber: false,
        status: {StatusEffect.madness: 60},
        ashOfWar: "Kick",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655304&code=mapD"),
    Weapon(
        name: 'Freyja\'s Greatsword',
        image: 'lib/constants/images/dlc_weapons/freyjas_greatsword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind:
            "Can be looted from Freyja's body after defeating her in the duel in Enir-Ilim. If her quest did not proceed further to Enir-Ilim, after the duel it can be obtained at the location that Freyja was inspecting the tablets, right in front of the Storehouse, Seventh Floor site of grace in the Specimen Storehouse. Freyja's armour can also be found in this location.",
        scaling: Scaling(str: 'B', dex: 'E'),
        weight: 14,
        isSomber: false,
        ashOfWar: "Spinning Slash",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=658971&code=mapD'),
    Weapon(
        name: 'Golden Lion Shield',
        image: 'lib/constants/images/dlc_weapons/golden_lion_shield.png',
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Shadow Keep: Given by Redmane Freyja after you hand her over the Letter for Freyja, received from Sir Anbsach.",
        scaling: Scaling(str: 'C'),
        weight: 5.5,
        isSomber: true,
        ashOfWar: "Roaring Bash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655617&code=mapD"),
    Weapon(
        name: 'Golem Fist',
        image: 'lib/constants/images/dlc_weapons/golem_fist.png',
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Looted from certain golems that wield them in Taylew's Ruined Forge.",
        scaling: Scaling(str: 'B', dex: 'E', int: 'E', fai: 'E'),
        weight: 5,
        isSomber: false,
        ashOfWar: "Endure",
        mapLink: "https://eldenring.wiki.fextralife.com/Taylew's+Ruined+Forge"),
    Weapon(
        name: 'Great Katana',
        image: 'lib/constants/images/dlc_weapons/great_katana.png',
        weaponCategory: WeaponCategory.great_katana,
        howToFind:
            "Gravesite Plains: The Great Katana can be found next to the sleeping Ghostflame Dragon on the lake, west of the Abandoned Ailing Village site of grace.",
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 9,
        isSomber: false,
        status: {StatusEffect.blood_loss: 55},
        ashOfWar: "Overhead Stance",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=654989&code=mapD"),
    Weapon(
        name: 'Greatsword of Solitude',
        image: 'lib/constants/images/dlc_weapons/greatsword_of_solitude.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "This item is obtained after defeating the Blackgaol Knight. This boss is located inside the Western Nameless Mausoleum.",
        scaling: Scaling(str: 'B', dex: 'E'),
        weight: 15.5,
        isSomber: true,
        ashOfWar: "Solitary Moon Slash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=654977&code=mapD"),
    Weapon(
        name: 'Greatsword of Damnation',
        image: 'lib/constants/images/dlc_weapons/greatsword_of_damnation.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "Midra, Lord Of Frenzied Flame's Remembrance at Midra's Manse",
        scaling: Scaling(str: 'C', dex: 'D', fai: 'D'),
        weight: 8,
        isSomber: true,
        ashOfWar: "Golden Crux",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655461&code=mapD'),
    Weapon(
        name: 'Horned Warrior\'s Greatsword',
        image:
            'lib/constants/images/dlc_weapons/horned_warriors_greatsword.png',
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind:
            'Guaranteed drop from the Wind-Aspected Horned Warrior towards the end of Enir-Ilim.',
        scaling: Scaling(str: 'D', dex: 'D', fai: 'D'),
        weight: 13,
        isSomber: true,
        ashOfWar: "Horned Calling: Storm",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659408&code=mapD'),
    Weapon(
        name: 'Horned Warrior\'s Sword',
        image: 'lib/constants/images/dlc_weapons/horned_warriors_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'This can be obtained by eliminating the Horned Warrior in the Belurat Tower Settlement Swamp.',
        scaling: Scaling(str: 'D', dex: 'C', fai: 'D'),
        weight: 5,
        isSomber: true,
        ashOfWar: "Horn Calling",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659121&code=mapD'),
    Weapon(
        name: 'Igon\'s Greatbow',
        image: 'lib/constants/images/dlc_weapons/igons_greatbow.png',
        weaponCategory: WeaponCategory.great_bow,
        howToFind: "Defeat Igon on the eastern side of Gravesite Plain.",
        scaling: Scaling(str: 'C', dex: 'E'),
        weight: 12.5,
        isSomber: false,
        ashOfWar: "Igon's Drake Hunt",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659035&code=mapD"),
    Weapon(
        name: 'Lamenting Visage',
        image: 'lib/constants/images/dlc_weapons/lamenting_visage.png',
        weaponCategory: WeaponCategory.torch,
        howToFind:
            "Inside a room on the lower level of the Lamenter's Gaol, hidden behind an illusory wall. In the area you fall through the floor, go up the stairs and into the the first doorway. Roll into the end of the passageway, and use the Gaol Lower Level Key to open the door.",
        scaling: Scaling(str: 'A'),
        weight: 2,
        isSomber: true,
        ashOfWar: "Blindfold of Happiness",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659339&code=mapD"),
    Weapon(
        name: 'Leda\'s Sword',
        image: 'lib/constants/images/dlc_weapons/ledas_sword.png',
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Found on Needle Knight Leda's corpse in Enir-Ilim along with Leda's Armor after she and the rest of Miquella's followers are defeated.",
        scaling: Scaling(str: 'D', dex: 'B', fai: 'D'),
        weight: 7.5,
        isSomber: true,
        ashOfWar: "Needle Piercer",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658966&code=mapD"),
    Weapon(
        name: 'Lightning Perfume Bottle',
        image: 'lib/constants/images/dlc_weapons/lightning_perfume_bottle.png',
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Found on a corpse a ways northeast of the Cerulean Coast Site of Grace, laying in a pool of water guarded by a lightning ram.",
        scaling: Scaling(dex: 'C', fai: 'C'),
        weight: 1,
        isSomber: false,
        ashOfWar: "Kick",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=248587&code=mapD"),
    Weapon(
        name: 'Lizard Greatsword',
        image: 'lib/constants/images/dlc_weapons/lizard_greatsword.png',
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "Dropped by the imps in the Fog Rift Catacombs (can be farmed from first fought imp).",
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 9.5,
        isSomber: false,
        ashOfWar: "Stamp (Upward Cut)",
        mapLink: "https://eldenring.wiki.fextralife.com/Fog+Rift+Catacombs"),
    Weapon(
        name: 'Madding Hand',
        image: 'lib/constants/images/dlc_weapons/madding_hand.png',
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "South of Woodland Trail site of grace in the Abyssal Woods. Drop by Madding Hand enemy.",
        scaling: Scaling(str: 'D', dex: 'D', int: 'D', fai: 'D'),
        weight: 1,
        isSomber: true,
        status: {StatusEffect.madness: 55},
        ashOfWar: "Madding Spear-Hand Strike",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659235&code=mapD"),
    Weapon(
        name: 'Main-Gauche',
        image: 'lib/constants/images/dlc_weapons/main_gauche.png',
        weaponCategory: WeaponCategory.dagger,
        howToFind:
            "Shadow Keep: Midway through the Stairs, turn right and enter the room. Enter the room on the right, and defeat the enemies to find the body that contains this weapon on the other side.",
        scaling: Scaling(str: 'D', dex: 'B'),
        weight: 2.5,
        isSomber: false,
        ashOfWar: "Parry",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655577&code=mapD'),
    Weapon(
        name: 'Messmer Soldier\'s Shield',
        image: 'lib/constants/images/dlc_weapons/messmer_soldiers_shield.png',
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Drops from shield-wielding Messmer Soldiers. Found in camps across Gravesite Plain and Scadu Altus, and inside Castle Ensis and Shadow Keep.",
        scaling: Scaling(str: 'C'),
        weight: 5,
        isSomber: false,
        ashOfWar: "No Skill",
        mapLink: "https://eldenring.wiki.fextralife.com/Shadow+Keep"),
    Weapon(
        name: 'Messmer Soldier\'s Spear',
        image: 'lib/constants/images/dlc_weapons/messmer_soldiers_spear.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "Dropped by Messmer Soldiers.",
        scaling: Scaling(str: 'C', dex: 'C'),
        weight: 8.5,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink: ""),
    Weapon(
        name: 'Milady',
        image: 'lib/constants/images/dlc_weapons/milady.png',
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Castle Ensis: The Milady Light Greatsword weapon can be found inside a chest. The chest is located at the top of a watchtower.",
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 6.5,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655119&code=mapD"),
    Weapon(
        name: 'Nanaya\'s Torch',
        image: 'lib/constants/images/dlc_weapons/nanayas_torch.png',
        weaponCategory: WeaponCategory.torch,
        howToFind:
            "Looted from a balcony in Midra's Manse in the Abyssal Woods.",
        scaling: Scaling(str: 'E', dex: 'E', int: 'E', fai: 'E'),
        weight: 3.5,
        status: {StatusEffect.madness: 65},
        isSomber: true,
        ashOfWar: "Feeble Lord's Frenzied Flame",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659290&code=mapD"),
    Weapon(
        name: 'Obsidian Lamina',
        image: 'lib/constants/images/dlc_weapons/obsidian_lamina.png',
        weaponCategory: WeaponCategory.reaper,
        howToFind:
            "Complete the entirety of Sir Ansbach's questline by assisting him. This weapon will be available at the end of his questline after the Final Boss where he will be by the entrance to the arena after the fight.",
        scaling: Scaling(str: 'E', dex: 'B', arc: 'D'),
        weight: 6.5,
        isSomber: true,
        status: {StatusEffect.blood_loss: 55},
        ashOfWar: "Dynatic Sickleplay",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659411&code=mapD"),
    Weapon(
        name: 'Pata',
        image: 'lib/constants/images/dlc_weapons/pata.png',
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Found inside a hanging body, just outside the Church of Benediction.",
        scaling: Scaling(str: 'D', dex: 'C'),
        weight: 4,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink: "https://eldenring.wiki.fextralife.com/Church+of+Benediction"),
    Weapon(
        name: 'Poisoned Hand',
        image: 'lib/constants/images/dlc_weapons/poisoned_hand.png',
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "There is a Horned Warrior, in the sewer level of the Belurat Tower Settlement legacy dungeon. To that area's right, there is a medium-sized building, similar to a church, and beside it, you will find the Poisoned Hand weapon.",
        scaling: Scaling(str: 'E', arc: 'A'),
        weight: 1,
        isSomber: true,
        status: {StatusEffect.deadly_poison: 36},
        ashOfWar: "Poison Spear-Hand Strike",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659415&code=mapD"),
    Weapon(
        name: 'Poleblade of the Bud',
        image: 'lib/constants/images/dlc_weapons/poleblade_of_the_bud.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind:
            "Trade Remembrance of the Saint of the Bud with Enia to be able to receive this weapon.",
        scaling: Scaling(str: 'E', dex: 'D', arc: 'B'),
        weight: 10,
        status: {StatusEffect.scarlet_rot: 55},
        isSomber: true,
        ashOfWar: "Romina's Purification",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655463&code=mapD'),
    Weapon(
        name: 'Putrescence Cleaver',
        image: 'lib/constants/images/dlc_weapons/putrescence_cleaver.png',
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "Trade Remembrance of Putrescence with Enia at the Roundtable Hold to receive this item.",
        scaling: Scaling(str: 'C', dex: 'E', arc: 'C'),
        weight: 13.5,
        isSomber: true,
        status: {StatusEffect.frostbite: 55},
        ashOfWar: "Spinning Guillotine",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655538&code=mapD'),
    Weapon(
        name: 'Queelign\'s Greatsword',
        image: 'lib/constants/images/dlc_weapons/queeligns_greatsword.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind:
            "Shadow Keep: Use Iris of Occultation on the NPC in the Prayer Room to receive Queelign's Greatsword.",
        scaling: Scaling(str: 'D', dex: 'C', fai: 'D'),
        weight: 7.5,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655495&code=mapD"),
    Weapon(
        name: 'Rakshasa\'s Great Katana',
        image: 'lib/constants/images/dlc_weapons/rakshasas_great_katana.png',
        weaponCategory: WeaponCategory.great_katana,
        howToFind:
            "Dropped by Rakshasa in Eastern Nameless Mausoleum. This area can only be accessed by using the ladder in Shadow Keep to get down to a special teleport coffin . This will take you to Ruins of Unte and you must follow the cliffs downstream and then carefully drop down to bottom level to reach the mausoleum.",
        scaling: Scaling(str: 'D', dex: 'B'),
        weight: 9.5,
        status: {StatusEffect.blood_loss: 55},
        isSomber: true,
        ashOfWar: "Weed Cutter",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655822&code=mapD"),
    Weapon(
        name: 'Rellana\'s Twinblade',
        image: 'lib/constants/images/dlc_weapons/rellanas_twinblade.png',
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Trade Remembrance of the Twin Moon Knight with Enia at the Roundtable Hold, to receive this weapon.",
        scaling: Scaling(str: 'C', dex: 'C', int: 'C', fai: 'C'),
        weight: 8,
        isSomber: true,
        ashOfWar: "Moon-and-Fire Stance",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655153&code=mapD'),
    Weapon(
        name: 'Repeating Crossbow',
        image: 'lib/constants/images/dlc_weapons/repeating_crossbow.png',
        weaponCategory: WeaponCategory.crossbow,
        howToFind:
            'Along the road next to the Ghostflame Dragon north of the Moorth Highway, South site of Grace.',
        scaling: Scaling(),
        weight: 6,
        isSomber: true,
        ashOfWar: "Repeating Fire",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659323&code=mapD'),
    Weapon(
        name: 'Serpent Crest Shield',
        image: 'lib/constants/images/dlc_weapons/serpent_crest_shield.png',
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Can be obtained by completing the \"Incursion\" Painting Puzzle.",
        scaling: Scaling(str: 'C'),
        weight: 6,
        isSomber: false,
        ashOfWar: "No Skill",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655740&code=mapD"),
    Weapon(
        name: 'Serpent Flail',
        image: 'lib/constants/images/dlc_weapons/serpent_flail.png',
        weaponCategory: WeaponCategory.flail,
        howToFind:
            "Fog Rift Fort: Head down using the ladder past the first tower, and defeat the enemies. Beware of the flamethrowers. Use spells or arrows if you have them. Reach the end of the area to find a chest that contains this item.",
        scaling: Scaling(str: 'E', arc: 'C', fai: 'B'),
        weight: 6,
        isSomber: true,
        ashOfWar: "Flare, O Serpent",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655442&code=mapD"),
    Weapon(
        name: 'Shield of Night',
        image: 'lib/constants/images/dlc_weapons/shield_of_night.png',
        weaponCategory: WeaponCategory.small_shield,
        howToFind:
            "Can be found in Bonny Gaol. The top level of this gaol can be accessed after using the jar lift near the bridge twice. You need to jump off at the bridge level, activate the switch, and then ride the jar going up. You will find this on the ledge behind the corpse on top of a table.",
        scaling: Scaling(dex: 'D'),
        weight: 2,
        isSomber: true,
        ashOfWar: "Revenge of the Night",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658965&code=mapD"),
    Weapon(
        name: 'Smithscript Dagger',
        image: 'lib/constants/images/dlc_weapons/smithscript_dagger.png',
        weaponCategory: WeaponCategory.throwing_blade,
        howToFind:
            "Ruined Forge Lava Intake. Take the first ladder down, past the golem, and after the fire blob turn right. As soon as you enter the room past the Fire Blob, slightly to the left. You can also drop down to this area from the lever's location. At the end of the hallway, you will find a golem and this weapon on a corpse near the back wall.",
        scaling: Scaling(str: 'D', dex: 'B', int: 'E', fai: 'E'),
        weight: 1.5,
        isSomber: false,
        ashOfWar: "Piercing Throw",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655188&code=mapD"),
    Weapon(
        name: 'Smithscript Greathammer',
        image: 'lib/constants/images/dlc_weapons/smithscript_greathammer.png',
        weaponCategory: WeaponCategory.great_hammer,
        howToFind:
            "Taylew's Ruined Forge: Use the giant platform in the middle to jump to the other side. Once there, keep moving forward and on the left side there will be a fire blob enemy protecting the item. Defeat the enemy and loot the corpse behind it to obtain the weapon.",
        scaling: Scaling(str: 'C', dex: 'E', int: 'E', fai: 'E'),
        weight: 9,
        isSomber: false,
        ashOfWar: "Endure",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655357&code=mapD"),
    Weapon(
        name: 'Smithscript Shield',
        image: 'lib/constants/images/dlc_weapons/smithscript_shield.png',
        weaponCategory: WeaponCategory.small_shield,
        howToFind:
            "Can be found in: Taylew's Ruined Forge (north of Ancient Ruins Base), on a corpse inside the forge. Jump from the opening left to the Lever, and instead of heading forward turn left. There are two Smithing Golems there, one that uses fire. Once defeated, stick to the right and go up to the upper platform using the crumbled column. You will find the item at the end of the hallway. Beware of the fire blob that falls from the ceiling.",
        scaling: Scaling(str: 'C', dex: 'D', int: 'E', fai: 'E'),
        weight: 2.5,
        isSomber: false,
        ashOfWar: "Discus Hurl",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655375&code=mapD"),
    Weapon(
        name: 'Smithscript Spear',
        image: 'lib/constants/images/dlc_weapons/smithscript_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Ruined Forge Starfall Past: The weapon is looted from a body located on the main floor of the Ruined Forge of Starfall Past.",
        scaling: Scaling(str: 'D', dex: 'C', int: 'E', fai: 'E'),
        weight: 4,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658904&code=mapD"),
    Weapon(
        name: 'Spear of the Impaler',
        image: 'lib/constants/images/dlc_weapons/spear_of_the_impaler.png',
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "Trade Remembrance of the Impaler at Enia to receive this weapon.",
        scaling: Scaling(str: 'E', dex: 'B', fai: 'C'),
        weight: 9.5,
        isSomber: true,
        ashOfWar: "Messmer's Assault",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655484&code=mapD'),
    Weapon(
        name: 'Spiraltree Seal',
        image: 'lib/constants/images/dlc_weapons/spiraltree_seal.png',
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Reward for completing \"The Sacred Tower\" Painting Puzzle.",
        scaling: Scaling(str: 'D', fai: 'S'),
        weight: 1.5,
        isSomber: false,
        passive: "Boosts Spiral Incantations",
        ashOfWar: "No Skill",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655748&code=mapD"),
    Weapon(
        name: 'Spirit Glaive',
        image: 'lib/constants/images/dlc_weapons/spirit_glaive.png',
        weaponCategory: WeaponCategory.halberd,
        howToFind:
            "Start at the Charo's Hidden Grave site of grace and walk through the arch to the northwest, turn right directly after and take the path that ramps up north, follow it to where it meets the edge of the Gravesite Plains and it will be on a grave.",
        scaling: Scaling(str: 'D', dex: 'C', int: 'D'),
        weight: 6.5,
        isSomber: true,
        ashOfWar: "Rancor Slash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659029&code=mapD"),
    Weapon(
        name: 'Spirit Sword',
        image: 'lib/constants/images/dlc_weapons/spirit_sword.png',
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'You can find this weapon in Cerulean Coast. Northeast from the Cerulean Coast West site of grace, the entrance to a triangular ravine can be accessed. It\'s in the right corner in that lower area, near some demi-humans.',
        scaling: Scaling(str: 'E', dex: 'C', int: 'C'),
        weight: 2.5,
        isSomber: true,
        ashOfWar: "Rancor Slash",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=659009&code=mapD'),
    Weapon(
        name: 'Spread Crossbow',
        image: 'lib/constants/images/dlc_weapons/spread_crossbow.png',
        weaponCategory: WeaponCategory.crossbow,
        howToFind:
            'A Spread Crossbow can be found on a body by the riverside and the Ellac Greatbridge. Past the Ellac Greatbridge turn right and head to the lower level. There is a smaller camp with three Messmer Soldiers. There you will find the Spread Crossbow.',
        scaling: Scaling(),
        weight: 5.0,
        isSomber: false,
        ashOfWar: "Kick",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655155&code=mapD'),
    Weapon(
        name: 'Staff of the Great Beyond',
        image: 'lib/constants/images/dlc_weapons/staff_of_the_great_beyond.png',
        weaponCategory: WeaponCategory.glintstone_staff,
        howToFind:
            "Exchange Remembrance of the Mother of Fingers with Finger Reader Enia in Roundtable Hold.",
        scaling: Scaling(str: 'D', int: 'B', fai: 'B'),
        weight: 2.5,
        isSomber: true,
        ashOfWar: "No Skill",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655728&code=mapD'),
    Weapon(
        name: 'Star-Lined Sword',
        image: 'lib/constants/images/dlc_weapons/star-lined_sword.png',
        weaponCategory: WeaponCategory.katana,
        howToFind:
            "Dropped by Demi-Human Queen Marigga, who can be found in the Cerulean Coast starting from Cerulean Coast West Site of Grace to follow the path northeast populated with demi-humans.",
        scaling: Scaling(str: 'D', dex: 'B', int: 'D'),
        weight: 5.0,
        status: {StatusEffect.blood_loss: 45},
        isSomber: true,
        ashOfWar: "Onze's Line of Stars",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658536&code=mapD"),
    Weapon(
        name: 'Stone-Sheathed Sword',
        image: 'lib/constants/images/dlc_weapons/stone-sheathed_sword.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Can be acquired at one of the 3 Altar locations: Fog Rift Catacombs (on top of the 3 trap platforms and run to the furthest right corner), Ruins of Unte (flowery courtyard), or Ancient Ruins of Rauh (on a tower connected by an invisible floor).",
        scaling: Scaling(str: 'B', dex: 'B'),
        weight: 5,
        isSomber: true,
        ashOfWar: "Square Off",
        mapLink: "https://eldenring.wiki.fextralife.com/Fog+Rift+Catacombs"),
    Weapon(
        name: 'Swift Spear',
        image: 'lib/constants/images/dlc_weapons/swift_spear.png',
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Can be found lying on a corpse guarded by 3 Messmer Soldiers along the road north of the Pillar Path Waypoint site of grace.",
        scaling: Scaling(dex: 'B'),
        weight: 3,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655445&code=mapD"),
    Weapon(
        name: 'Sword Lance',
        image: 'lib/constants/images/dlc_weapons/sword_lance.png',
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind:
            "Can be selected as one of the possible rewards when trading Remembrance of the Wild Boar Rider with Enia at the Roundtable Hold.",
        scaling: Scaling(str: 'B', dex: 'E'),
        weight: 9,
        isSomber: false,
        ashOfWar: "Impaling Thrust",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655366&code=mapD'),
    Weapon(
        name: 'Sword of Darkness',
        image: 'lib/constants/images/dlc_weapons/sword_of_darkness.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Obtained by raising Stone-Sheathed Sword or Sword of Light at the Altar located in Fog Rift Catacombs.",
        scaling: Scaling(str: 'C', dex: 'D', fai: 'D'),
        weight: 4,
        isSomber: true,
        ashOfWar: "Darkness",
        mapLink: "https://eldenring.wiki.fextralife.com/Fog+Rift+Catacombs"),
    Weapon(
        name: 'Sword of Light',
        image: 'lib/constants/images/dlc_weapons/sword_of_light.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Obtained by raising the Stone-Sheathed Sword at the Altar in the Ruins of Unte. The altar area is normally accessible after using a Hefty Furnace Pot and throwing it at the head of the deactivated Furnace Golem that blocks the entrance so that it moves away. The player can also access this inner area with the use of Torrent, jumping on the small borders the southern tower and then through the broken outer walls.",
        scaling: Scaling(str: 'C', dex: 'D', fai: 'D'),
        weight: 4,
        isSomber: true,
        ashOfWar: "Light",
        mapLink: "https://eldenring.wiki.fextralife.com/Ancient+Ruins+of+Rauh"),
    Weapon(
        name: 'Sword of Night',
        image: 'lib/constants/images/dlc_weapons/sword_of_night.png',
        weaponCategory: WeaponCategory.katana,
        howToFind:
            "Cathedral of Manus Metyr: After completing the whole finger questline for Count Ymir, Jolan will be dejected nearby. Give her an Iris of Occultation to get the Sword of Night.",
        scaling: Scaling(dex: 'C'),
        weight: 6.5,
        isSomber: true,
        status: {StatusEffect.blood_loss: 45},
        ashOfWar: "Witching Hour Slash",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=248601&code=mapD"),
    Weapon(
        name: 'Thiollier\'s Hidden Needle',
        image: 'lib/constants/images/dlc_weapons/thiolliers_hidden_needle.png',
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Finish the St. Trina and Thiollier quests and loot it after defeating the final boss.",
        scaling: Scaling(str: 'D', dex: 'B', int: 'C'),
        weight: 0.5,
        isSomber: true,
        status: {StatusEffect.eternal_sleep: 42},
        ashOfWar: "Sleep Evermore",
        mapLink: ""),
    Weapon(
        name: 'Tooth Whip',
        image: 'lib/constants/images/dlc_weapons/tooth_whip.png',
        weaponCategory: WeaponCategory.whip,
        howToFind: "Found inside the Whipping Hut.",
        scaling: Scaling(str: 'D', dex: 'B'),
        status: {StatusEffect.poison: 66},
        weight: 3,
        isSomber: true,
        ashOfWar: "Painful Strike",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655101&code=mapD"),
    Weapon(
        name: 'Velvet Sword of St-Trina',
        image: 'lib/constants/images/dlc_weapons/velvet_sword_of_st_trina.png',
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Stone Coffin Fissure: From the Fissure Cross site of grace, walk immediately north-west to the closest giant coffin that's tilted nearly vertical. Climb down to a ledge that passes underneath the brick platform nearest the site of grace. The sword is in a small cave network there and guarded by several putrescent oozes.",
        scaling: Scaling(str: 'D', dex: 'D', int: 'D'),
        weight: 2.5,
        isSomber: true,
        status: {StatusEffect.eternal_sleep: 42},
        ashOfWar: "Mists of Eternal Sleep",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=659165&code=mapD"),
    Weapon(
        name: 'Verdigris Greatshield',
        image: 'lib/constants/images/dlc_weapons/verdigris_greatshield.png',
        weaponCategory: WeaponCategory.greatshield,
        howToFind:
            "Rewarded upon killing the NPC invader Moore, who appears north of the Church of the Crusade in Scadu Altus in the Realm of Shadow.",
        scaling: Scaling(str: 'B'),
        weight: 28,
        isSomber: true,
        ashOfWar: "Moore's Charge",
        mapLink:
            "https://eldenring.wiki.fextralife.com/Interactive+Map?id=658970&code=mapD"),
    Weapon(
      name: 'Wolf Crest Shield',
      image: 'lib/constants/images/dlc_weapons/wolf_crest_shield.png',
      weaponCategory: WeaponCategory.medium_shield,
      howToFind:
          "Can be found in: Castle Ensis. Located inside a storeroom you'll find a treasure chest that has the Wolf Crest Shield.",
      scaling: Scaling(str: 'C'),
      weight: 6,
      isSomber: false,
      ashOfWar: "No Skill",
      mapLink:
          "https://eldenring.wiki.fextralife.com/Interactive+Map?id=655147&code=mapD",
    ),
  ];
  return dlcWeapons;
}

List<AshOfWar> allAshesOfWar() {
  List<AshOfWar> ashesOfWar = [
    AshOfWar(
        name: "Unsheathe",
        image: 'lib/constants/images/ash_of_war/unsheathe.png',
        howToFind:
            "Ash of War: Unsheathe' is dropped by a Teardrop Scarab in the water in the South East portion of Agheel Lake, North West of the Agheel Lake South Site of Grace.",
        description:
            "Skill of swordsmen from the Land of Reeds. Sheathe blade, holding it at the hip in a composed stance. Follow up with a normal or strong attack to perform a swift slash attack.",
        mapLink:
            'https://eldenring.wiki.fextralife.com/Interactive+Map?id=655056&code=mapD'),
  ];
  return ashesOfWar;
}
