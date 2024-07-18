// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import '../models/weapon.dart';

enum ItemCategory {
  weapon,
  armor,
  tear,
  incantation,
  sorcery,
}

enum ObtentionWay { farm, buy, quest, loot, boss }

enum Location {
  west_limgrave,
  east_limgrave,
  weeping_peninsula,
  stormveil_castle,
  liurnia_of_the_lake,
  raya_lucaria_academy,
  caria_manor,
  ainsel_river,
  siofra_river,
  altus_plateau,
  south_caelid,
  nokron_eternal_city,
  siofra_aqueduct,
  carian_study_hall,
  deeproot_depths,
  nokstella,
  lake_of_rot,
  moonlight_altar,
  dragonbarrow,
  leyndell,
  forbidden_land,
  mountaintops,
  volcano_manor,
  snowfield,
  shunning_grounds,
  mohgwyn_palace,
  miquella_halligtree,
  crumbling_farum_azula,
  leyndell_ashen_capital,
  DLC_gravesite_plain,
  DLC_cerulean_coast,
  DLC_finger_ruins_of_rhia,
  DLC_jagged_peak,
  DLC_scadu_altus,
  DLC_church_district,
  DLC_shadow_keep,
  DLC_abyssal_woods,
  DLC_scaduview,
  DLC_rauh_ancient_ruins,
  DLC_enir_ilim
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

List<Weapon> allWeapons() {
  List<Weapon> allWeapons = [];
  List<Weapon> axes = [
    Weapon(
        name: 'Battle Axe',
        image: 'lib/constants/images/axe/battle_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Celebrants Cleaver',
        image: 'lib/constants/images/axe/celebrants_cleaver.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Forked Hatchet',
        image: 'lib/constants/images/axe/forked_hatchet.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Hand Axe',
        image: 'lib/constants/images/axe/hand_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Highland Axe',
        image: 'lib/constants/images/axe/highland_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Icerind Hatchet',
        image: 'lib/constants/images/axe/icerind_hatchet.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Iron Cleaver',
        image: 'lib/constants/images/axe/iron_cleaver.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Jawbone Axe',
        image: 'lib/constants/images/axe/jawbone_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ripple Blade',
        image: 'lib/constants/images/axe/ripple_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rosuss Axe',
        image: 'lib/constants/images/axe/rosus_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sacrificial Axe',
        image: 'lib/constants/images/axe/sacrificial_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Stormhawk Axe',
        image: 'lib/constants/images/axe/stormhawk_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Warped Axe',
        image: 'lib/constants/images/axe/warped_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.axe,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> claws = [
    Weapon(
        name: 'Bloodhound Claws',
        image: 'lib/constants/images/claw/bloodhound_claws.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Hookclaws',
        image: 'lib/constants/images/claw/hookclaws.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Raptor Talons',
        image: 'lib/constants/images/claw/raptor_talons.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Venomous Fang',
        image: 'lib/constants/images/claw/venomous_fang.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.claw,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> colossal_swords = [
    Weapon(
        name: 'Godslayers Greatsword',
        image: 'lib/constants/images/colossal_sword/godslayers_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Grafted Blade Greatsword',
        image:
            'lib/constants/images/colossal_sword/grafted_blade_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Greatsword',
        image: 'lib/constants/images/colossal_sword/greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Malikeths Black Blade',
        image: 'lib/constants/images/colossal_sword/malikeths_black_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Royal Greatsword',
        image: 'lib/constants/images/colossal_sword/royal_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ruins Greatsword',
        image: 'lib/constants/images/colossal_sword/ruins_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Starscourge Greatsword',
        image: 'lib/constants/images/colossal_sword/starscourge_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Trolls Golden Sword',
        image: 'lib/constants/images/colossal_sword/trolls_golden_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Troll Knights Sword',
        image: 'lib/constants/images/colossal_sword/troll_knights_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Watchdogs Greatsword',
        image: 'lib/constants/images/colossal_sword/watchdogs_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Zweihander',
        image: 'lib/constants/images/colossal_sword/zweihander.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> colossal_weapons = [
    Weapon(
        name: 'Axe Of Godfrey',
        image: 'lib/constants/images/colossal_weapon/axe_of_godfrey.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dragon Greatclaw',
        image: 'lib/constants/images/colossal_weapon/dragon_greatclaw.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Duelist Greataxe',
        image: 'lib/constants/images/colossal_weapon/duelist_greataxe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Envoys Greathorn',
        image: 'lib/constants/images/colossal_weapon/envoys_greathorn.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Fallingstar Beast Jaw',
        image: 'lib/constants/images/colossal_weapon/fallingstar_beast_jaw.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ghizas Wheel',
        image: 'lib/constants/images/colossal_weapon/ghizas_wheel.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Giant Crusher',
        image: 'lib/constants/images/colossal_weapon/giant_crusher.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golems Halberd',
        image: 'lib/constants/images/colossal_weapon/golems_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Club',
        image: 'lib/constants/images/colossal_weapon/great_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Prelates Inferno Crozier',
        image:
            'lib/constants/images/colossal_weapon/prelates_inferno_crozier.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rotten Greataxe',
        image: 'lib/constants/images/colossal_weapon/rotten_greataxe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rotten Staff',
        image: 'lib/constants/images/colossal_weapon/rotten_staff.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Staff Of The Avatar',
        image: 'lib/constants/images/colossal_weapon/staff_of_the_avatar.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Trolls Hammer',
        image: 'lib/constants/images/colossal_weapon/trolls_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Watchdogs Staff',
        image: 'lib/constants/images/colossal_weapon/watchdogs_staff.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> curved_greatswords = [
    Weapon(
        name: 'Beastmans Cleaver',
        image: 'lib/constants/images/curved_greatsword/beastmans_cleaver.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bloodhounds Fang',
        image: 'lib/constants/images/curved_greatsword/bloodhounds_fang.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dismounter',
        image: 'lib/constants/images/curved_greatsword/dismounter.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Magma Wyrms Scalesword',
        image:
            'lib/constants/images/curved_greatsword/magma_wyrms_scalesword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Monks Flameblade',
        image: 'lib/constants/images/curved_greatsword/monks_flameblade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Morgotts Cursed Sword',
        image:
            'lib/constants/images/curved_greatsword/morgotts_cursed_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Omen Cleaver',
        image: 'lib/constants/images/curved_greatsword/omen_cleaver.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Onyx Lords Greatsword',
        image:
            'lib/constants/images/curved_greatsword/onyx_lords_greatsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Zamor Curved Sword',
        image: 'lib/constants/images/curved_greatsword/zamor_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> curved_swords = [
    Weapon(
        name: 'Bandits Curved Sword',
        image: 'lib/constants/images/curved_sword/bandits_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Beastmans Curved Sword',
        image: 'lib/constants/images/curved_sword/beastmans_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Eclipse Shotel',
        image: 'lib/constants/images/curved_sword/eclipse_shotel.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Falchion',
        image: 'lib/constants/images/curved_sword/falchion.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Flowing Curved Sword',
        image: 'lib/constants/images/curved_sword/flowing_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Grossmesser',
        image: 'lib/constants/images/curved_sword/grossmesser.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Magma Blade',
        image: 'lib/constants/images/curved_sword/magma_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Mantis Blade',
        image: 'lib/constants/images/curved_sword/mantis_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nox Flowing Sword',
        image: 'lib/constants/images/curved_sword/nox_flowing_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Scavengers Curved Sword',
        image: 'lib/constants/images/curved_sword/scavengers_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Scimitar',
        image: 'lib/constants/images/curved_sword/scimitar.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Serpent-gods Curved Sword',
        image:
            'lib/constants/images/curved_sword/serpent-gods_curved_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Shamshir',
        image: 'lib/constants/images/curved_sword/shamshir.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Shotel',
        image: 'lib/constants/images/curved_sword/shotel.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Wing Of Astel',
        image: 'lib/constants/images/curved_sword/wing_of_astel.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> daggers = [
    Weapon(
        name: 'Black Knife',
        image: 'lib/constants/images/dagger/black_knife.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Blade Of Calling',
        image: 'lib/constants/images/dagger/blade_of_calling.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bloodstained Dagger',
        image: 'lib/constants/images/dagger/bloodstained_dagger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Celebrants Sickle',
        image: 'lib/constants/images/dagger/celebrants_sickle.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cinquedea',
        image: 'lib/constants/images/dagger/cinquedea.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Crystal Knife',
        image: 'lib/constants/images/dagger/crystal_knife.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dagger',
        image: 'lib/constants/images/dagger/dagger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Erdsteel Dagger',
        image: 'lib/constants/images/dagger/erdsteel_dagger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Glintstone Kris',
        image: 'lib/constants/images/dagger/glintstone_kris.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Knife',
        image: 'lib/constants/images/dagger/great_knife.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ivory Sickle',
        image: 'lib/constants/images/dagger/ivory_sickle.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Misericorde',
        image: 'lib/constants/images/dagger/misericorde.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Parrying Dagger',
        image: 'lib/constants/images/dagger/parrying_dagger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Reduvia',
        image: 'lib/constants/images/dagger/reduvia.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Scorpions Stinger',
        image: 'lib/constants/images/dagger/scorpions_stinger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Wakizashi',
        image: 'lib/constants/images/dagger/wakizashi.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> fists = [
    Weapon(
        name: 'Caestus',
        image: 'lib/constants/images/fist/caestus.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cipher Pata',
        image: 'lib/constants/images/fist/cipher_pata.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Clinging Bone',
        image: 'lib/constants/images/fist/clinging_bone.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Grafted Dragon',
        image: 'lib/constants/images/fist/grafted_dragon.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Iron Ball',
        image: 'lib/constants/images/fist/iron_ball.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Katar',
        image: 'lib/constants/images/fist/katar.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spiked Caestus',
        image: 'lib/constants/images/fist/spiked_caestus.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Star Fist',
        image: 'lib/constants/images/fist/star_fist.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Veterans Prosthesis',
        image: 'lib/constants/images/fist/veterans_prosthesis.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.fist,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> flails = [
    Weapon(
        name: 'Bastards Stars',
        image: 'lib/constants/images/flail/bastards_stars.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Chainlink Flail',
        image: 'lib/constants/images/flail/chainlink_flail.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Family Heads',
        image: 'lib/constants/images/flail/family_heads.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Flail',
        image: 'lib/constants/images/flail/flail.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nightrider Flail',
        image: 'lib/constants/images/flail/nightrider_flail.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.flail,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> great_axes = [
    Weapon(
        name: 'Axe Of Godrick',
        image: 'lib/constants/images/great_axe/axe_of_godrick.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Butchering Knife',
        image: 'lib/constants/images/great_axe/butchering_knife.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Crescent Moon Axe',
        image: 'lib/constants/images/great_axe/crescent_moon_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Executioners Greataxe',
        image: 'lib/constants/images/great_axe/executioners_greataxe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Black Axe',
        image: 'lib/constants/images/great_axe/gargoyles_black_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Great Axe',
        image: 'lib/constants/images/great_axe/gargoyles_great_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Greataxe',
        image: 'lib/constants/images/great_axe/greataxe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Omenkiller Cleaver',
        image: 'lib/constants/images/great_axe/great_omenkiller_cleaver.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Longhaft Axe',
        image: 'lib/constants/images/great_axe/longhaft_axe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rusted Anchor',
        image: 'lib/constants/images/great_axe/rusted_anchor.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Winged Greathorn',
        image: 'lib/constants/images/great_axe/winged_greathorn.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_axe,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> great_hammer = [
    Weapon(
        name: 'Battle Hammer',
        image: 'lib/constants/images/great_hammer/battle_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Beastclaw Greathammer',
        image: 'lib/constants/images/great_hammer/beastclaw_greathammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Brick Hammer',
        image: 'lib/constants/images/great_hammer/brick_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Celebrants Skull',
        image: 'lib/constants/images/great_hammer/celebrants_skull.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cranial Vessel Candlestand',
        image:
            'lib/constants/images/great_hammer/cranial_vessel_candlestand.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Curved Great Club',
        image: 'lib/constants/images/great_hammer/curved_great_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Devourers Scepter',
        image: 'lib/constants/images/great_hammer/devourers_scepter.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Envoys Long Horn',
        image: 'lib/constants/images/great_hammer/envoys_long_horn.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Greathorn Hammer',
        image: 'lib/constants/images/great_hammer/greathorn_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Mace',
        image: 'lib/constants/images/great_hammer/great_mace.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Stars',
        image: 'lib/constants/images/great_hammer/great_stars.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Large Club',
        image: 'lib/constants/images/great_hammer/large_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Pickaxe',
        image: 'lib/constants/images/great_hammer/pickaxe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rotten Battle Hammer',
        image: 'lib/constants/images/great_hammer/rotten_battle_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> great_spear = [
    Weapon(
        name: 'Lance',
        image: 'lib/constants/images/great_spear/lance.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Mohgwyns Sacred Spear',
        image: 'lib/constants/images/great_spear/mohgwyns_sacred_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Serpent Hunter',
        image: 'lib/constants/images/great_spear/serpent_hunter.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Silurias Tree',
        image: 'lib/constants/images/great_spear/silurias_tree.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Treespear',
        image: 'lib/constants/images/great_spear/treespear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Vykes War Spear',
        image: 'lib/constants/images/great_spear/vykes_war_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> halberd = [
    Weapon(
        name: 'Banished Knights Halberd',
        image: 'lib/constants/images/halberd/banished_knights_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Commanders Standard',
        image: 'lib/constants/images/halberd/commanders_standard.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dragon Halberd',
        image: 'lib/constants/images/halberd/dragon_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Black Halberd',
        image: 'lib/constants/images/halberd/gargoyles_black_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Halberd',
        image: 'lib/constants/images/halberd/gargoyles_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Glaive',
        image: 'lib/constants/images/halberd/glaive.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golden Halberd',
        image: 'lib/constants/images/halberd/golden_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Guardians Swordspear',
        image: 'lib/constants/images/halberd/guardians_swordspear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Halberd',
        image: 'lib/constants/images/halberd/halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lorettas War Sickle',
        image: 'lib/constants/images/halberd/lorettas_war_sickle.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lucerne',
        image: 'lib/constants/images/halberd/lucerne.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nightrider Glaive',
        image: 'lib/constants/images/halberd/nightrider_glaive.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Pests Glaive',
        image: 'lib/constants/images/halberd/pests_glaive.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ripple Crescent Halberd',
        image: 'lib/constants/images/halberd/ripple_crescent_halberd.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Vulgar Militia Saw',
        image: 'lib/constants/images/halberd/vulgar_militia_saw.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Vulgar Militia Shotel',
        image: 'lib/constants/images/halberd/vulgar_militia_shotel.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.halberd,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> hammer = [
    Weapon(
        name: 'Club',
        image: 'lib/constants/images/hammer/club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Curved Club',
        image: 'lib/constants/images/hammer/curved_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Envoys Horn',
        image: 'lib/constants/images/hammer/envoys_horn.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Hammer',
        image: 'lib/constants/images/hammer/hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Mace',
        image: 'lib/constants/images/hammer/mace.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Marikas Hammer',
        image: 'lib/constants/images/hammer/marikas_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Monks Flamemace',
        image: 'lib/constants/images/hammer/monks_flamemace.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Morning Star',
        image: 'lib/constants/images/hammer/morning_star.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nox Flowing Hammer',
        image: 'lib/constants/images/hammer/nox_flowing_hammer.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ringed Finger',
        image: 'lib/constants/images/hammer/ringed_finger.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Scepter Of The All Knowing',
        image: 'lib/constants/images/hammer/scepter_of_the_all_knowing.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spiked Club',
        image: 'lib/constants/images/hammer/spiked_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Stone Club',
        image: 'lib/constants/images/hammer/stone_club.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Warpick',
        image: 'lib/constants/images/hammer/warpick.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.hammer,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> heavy_thrusting_swords = [
    Weapon(
        name: 'Bloody Helice',
        image: 'lib/constants/images/heavy_thrusting_sword/bloody_helice.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dragon Kings Cragblade',
        image:
            'lib/constants/images/heavy_thrusting_sword/dragon_kings_cragblade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Godskin Stitcher',
        image:
            'lib/constants/images/heavy_thrusting_sword/godskin_stitcher.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Epee',
        image: 'lib/constants/images/heavy_thrusting_sword/great_epee.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> katanas = [
    Weapon(
        name: 'Dragonscale Blade',
        image: 'lib/constants/images/katana/dragonscale_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Hand Of Malenia',
        image: 'lib/constants/images/katana/hand_of_malenia.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Meteoric Ore Blade',
        image: 'lib/constants/images/katana/meteoric_ore_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Moonveil',
        image: 'lib/constants/images/katana/moonveil.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nagakiba',
        image: 'lib/constants/images/katana/nagakiba.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rivers Of Blood',
        image: 'lib/constants/images/katana/rivers_of_blood.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Serpentbone Blade',
        image: 'lib/constants/images/katana/serpentbone_blade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Uchigatana',
        image: 'lib/constants/images/katana/uchigatana.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.katana,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> reapers = [
    Weapon(
        name: 'Grave Scythe',
        image: 'lib/constants/images/reaper/grave_scythe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Halo Scythe',
        image: 'lib/constants/images/reaper/halo_scythe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Scythe',
        image: 'lib/constants/images/reaper/scythe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Winged Scythe',
        image: 'lib/constants/images/reaper/winged_scythe.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.reaper,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> spears = [
    Weapon(
        name: 'Bolt Of Gransax',
        image: 'lib/constants/images/spear/bolt_of_gransax.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Celebrants Rib Rake',
        image: 'lib/constants/images/spear/celebrants_rib_rake.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Claymans Harpoon',
        image: 'lib/constants/images/spear/claymans_harpoon.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cleanrot Spear',
        image: 'lib/constants/images/spear/cleanrot_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cross Naginata',
        image: 'lib/constants/images/spear/cross_naginata.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Crystal Spear',
        image: 'lib/constants/images/spear/crystal_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Death Ritual Spear',
        image: 'lib/constants/images/spear/death_ritual_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Inquisitors Girandole',
        image: 'lib/constants/images/spear/inquisitors_girandole.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Iron Spear',
        image: 'lib/constants/images/spear/iron_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Partisan',
        image: 'lib/constants/images/spear/partisan.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Pike',
        image: 'lib/constants/images/spear/pike.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rotten Crystal Spear',
        image: 'lib/constants/images/spear/rotten_crystal_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Short Spear',
        image: 'lib/constants/images/spear/short_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spear',
        image: 'lib/constants/images/spear/spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spiked Spear',
        image: 'lib/constants/images/spear/spiked_spear.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Torchpole',
        image: 'lib/constants/images/spear/torchpole.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.spear,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> straight_swords = [
    Weapon(
        name: 'Broadsword',
        image: 'lib/constants/images/straight_sword/broadsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cane Sword',
        image: 'lib/constants/images/straight_sword/cane_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Carian Knights Sword',
        image: 'lib/constants/images/straight_sword/carian_knights_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Coded Sword',
        image: 'lib/constants/images/straight_sword/coded_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Crystal Sword',
        image: 'lib/constants/images/straight_sword/crystal_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golden Epitaph',
        image: 'lib/constants/images/straight_sword/golden_epitaph.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lazuli Glintstone Sword',
        image:
            'lib/constants/images/straight_sword/lazuli_glintstone_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Longsword',
        image: 'lib/constants/images/straight_sword/longsword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lordsworns Straight Sword',
        image:
            'lib/constants/images/straight_sword/lordsworns_straight_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Miquellan Knights Sword',
        image:
            'lib/constants/images/straight_sword/miquellan_knights_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nobles Slender Sword',
        image: 'lib/constants/images/straight_sword/nobles_slender_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ornamental Straight Sword',
        image:
            'lib/constants/images/straight_sword/ornamental_straight_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Regalia Of Eochaid',
        image: 'lib/constants/images/straight_sword/regalia_of_eochaid.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rotten Crystal Sword',
        image: 'lib/constants/images/straight_sword/rotten_crystal_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Short Sword',
        image: 'lib/constants/images/straight_sword/short_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword Of Night And Flame',
        image:
            'lib/constants/images/straight_sword/sword_of_night_and_flame.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword Of St Trina',
        image: 'lib/constants/images/straight_sword/sword_of_st_trina.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Warhawks Talon',
        image: 'lib/constants/images/straight_sword/warhawks_talon.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Weathered Straight Sword',
        image:
            'lib/constants/images/straight_sword/weathered_straight_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> thrusting_swords = [
    Weapon(
        name: 'Antspur Rapier',
        image: 'lib/constants/images/thrusting_sword/antspur_rapier.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Cleanrot Knights Sword',
        image:
            'lib/constants/images/thrusting_sword/cleanrot_knights_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Estoc',
        image: 'lib/constants/images/thrusting_sword/estoc.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Frozen Needle',
        image: 'lib/constants/images/thrusting_sword/frozen_needle.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nobles Estoc',
        image: 'lib/constants/images/thrusting_sword/nobles_estoc.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rapier',
        image: 'lib/constants/images/thrusting_sword/rapier.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rogiers Rapier',
        image: 'lib/constants/images/thrusting_sword/rogiers_rapier.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> twinblades = [
    Weapon(
        name: 'Eleonoras Poleblade',
        image: 'lib/constants/images/twinblade/eleonoras_poleblade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Black Blades',
        image: 'lib/constants/images/twinblade/gargoyles_black_blades.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyles Twinblade',
        image: 'lib/constants/images/twinblade/gargoyles_twinblade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Godskin Peeler',
        image: 'lib/constants/images/twinblade/godskin_peeler.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Twinblade',
        image: 'lib/constants/images/twinblade/twinblade.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Twinned Knight Swords',
        image: 'lib/constants/images/twinblade/twinned_knight_swords.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> whips = [
    Weapon(
        name: 'Giants Red Braid',
        image: 'lib/constants/images/whip/giants_red_braid.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Hoslows Petal Whip',
        image: 'lib/constants/images/whip/hoslows_petal_whip.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Magma Whip Candlestick',
        image: 'lib/constants/images/whip/magma_whip_candlestick.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Thorned Whip',
        image: 'lib/constants/images/whip/thorned_whip.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Urumi',
        image: 'lib/constants/images/whip/urumi.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Whip',
        image: 'lib/constants/images/whip/whip.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.whip,
        howToFind: "",
        infos: [], isSomber: true),
  ];
  List<Weapon> great_swords = [
    Weapon(
        name: 'Alabaster\'s Lord Sword',
        image: 'lib/constants/images/great_sword/alabasters_lord_sword.png',
        location: Location.west_limgrave,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Banished Knight\'s Greatsword',
        image:
            'lib/constants/images/great_sword/banished_knights_greatsword.png',
        location: Location.east_limgrave,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bastard Sword',
        image: 'lib/constants/images/great_sword/bastard_sword.png',
        location: Location.weeping_peninsula,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Blasphemous Blade',
        image: 'lib/constants/images/great_sword/blasphemous_blade.png',
        location: Location.stormveil_castle,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Claymore',
        image: 'lib/constants/images/great_sword/claymore.png',
        location: Location.liurnia_of_the_lake,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dark Moon Greatsword',
        image: 'lib/constants/images/great_sword/dark_moon_greatsword.png',
        location: Location.raya_lucaria_academy,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Death\'s poker',
        image: 'lib/constants/images/great_sword/death_poker.png',
        location: Location.caria_manor,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Flamberge',
        image: 'lib/constants/images/great_sword/flamberge.png',
        location: Location.ainsel_river,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Forked Greatsword',
        image: 'lib/constants/images/great_sword/forked_greatsword.png',
        location: Location.siofra_river,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyle\'s Blackblade',
        image: 'lib/constants/images/great_sword/gargoyles_blackblade.png',
        location: Location.altus_plateau,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Gargoyle\'s Greatsword',
        image: 'lib/constants/images/great_sword/gargoyles_greatsword.png',
        location: Location.south_caelid,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golden Order Greatsword',
        image: 'lib/constants/images/great_sword/golden_order_greatsword.png',
        location: Location.nokron_eternal_city,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Helphen\'s Steeple',
        image: 'lib/constants/images/great_sword/helphens_steeple.png',
        location: Location.siofra_aqueduct,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Inseparable Sword',
        image: 'lib/constants/images/great_sword/inseparable_sword.png',
        location: Location.carian_study_hall,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Iron Greatsword',
        image: 'lib/constants/images/great_sword/iron_greatsword.png',
        location: Location.deeproot_depths,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Knight Greatsword',
        image: 'lib/constants/images/great_sword/knight_greatsword.png',
        location: Location.nokstella,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lord\'s Worn\'s Greatsword',
        image: 'lib/constants/images/great_sword/lordsworns_greatsword.png',
        location: Location.lake_of_rot,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Marais Executioner\'s Greatsword',
        image:
            'lib/constants/images/great_sword/marais_executioners_greatsword.png',
        location: Location.moonlight_altar,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ordovis\'s Greatsword',
        image: 'lib/constants/images/great_sword/ordoviss_greatsword.png',
        location: Location.dragonbarrow,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sacred Relic Sword',
        image: 'lib/constants/images/great_sword/sacred_relic_sword.png',
        location: Location.leyndell,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword of Milos',
        image: 'lib/constants/images/great_sword/sword_of_milos.png',
        location: Location.forbidden_land,
        weaponCategory: WeaponCategory.greatsword,
        howToFind: "",
        infos: [], isSomber: true),
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
        image: 'lib/constants/images/dlc/death_knights_twin_axes.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.axe,
        howToFind:
            'Fog Rift Catacombs: The weapon is obtained as a reward for defeating the Death Knight boss.',
        infos: ["C","D","-","C","-","5.5","Blinkbolt: Twinaxe"],
    isSomber: true),
    Weapon(
        name: 'Messmer Soldier\'s Axe',
        image: 'lib/constants/images/dlc/messmer_soldiers_axe.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.axe,
        howToFind: 'Dropped by Messmer Soldiers.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Forked Tongue Hatchet',
        image: 'lib/constants/images/dlc/forked_tongue_hatchet.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.axe,
        howToFind:
            'Dropped by Imps in catacombs (you can farm it in Scorpion River Catacombs)',
        infos: [],
    isSomber: false),
    Weapon(
        name: 'Smithscript Axe',
        image: 'lib/constants/images/dlc/smithscript_axe.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.axe,
        howToFind:
            "Taylew's Ruined Forge: From the initial site of grace, continue following the path, get past the enemy, and take the ladder down then jump across the other platforms and turn left. You will find a Golem there. Behind it, at the back of the room, you will find the Smithscript Axe.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Ancient Meteoric Ore Greatsword',
        image: 'lib/constants/images/dlc/ancient_meteoric_ore_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Ruined Forge Starfall Past: The weapon is acquired after examining the altar of the Ruined Forge of Starfall Past. The altar is found on the second level. To reach the altar, you must pull the lever to make the iron door rise, and use it as a platform to jump across to the second level where the altar is.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Ansbach\'s Longbow',
        image: 'lib/constants/images/dlc/ansbachs_longbow.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.bow,
        howToFind:
            'Assist or Kill Sir Ansbach during his questline in Shadow Keep against the enemy invader.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Anvil Hammer',
        image: 'lib/constants/images/dlc/anvil_hammer.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Ruined Forge Lava Intake. Use the column you have lowered with the lever as a bridge and climb it until the end. Beware of the fire blob, and then at the top, turn right and jump to reach the stairs. Climb them up and interact with a furnace to obtain this weapon and an Ancient Dragon Smithing Stone.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Backhand Blade',
        image: 'lib/constants/images/dlc/backhand_blade.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'Besides a coffin, in the Inquisitor enemies area of Gravesite Plain, not far from the first site of grace.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Beast claw',
        image: 'lib/constants/images/dlc/beast_claw.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.beast_claw,
        howToFind:
            'Drops from killing Logur the Beast Claw in Gravesite Plains in the forest, southeast of the Gravesite Plain Site of Grace.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Bloodfiend\'s arm',
        image: 'lib/constants/images/dlc/bloodfiends_arm.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Guaranteed SINGLE drop from a Bloodfiends group in Prospect Town, which can be found earlygame.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Claws of Night',
        image: 'lib/constants/images/dlc/claws_of_night.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.claw,
        howToFind:
            'Dropped by NPC invader Swordhand of Night Anna, found in the Finger Ruins of Miyr underneath Cathedral of Manus Metyr. This area can only be accessed by progressing Ymir\'s questline.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Curseblade\'s Cirque',
        image: 'lib/constants/images/dlc/curseblades_cirque.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'Drops from Curseblade enemies who wield it (one is located on top of an arch 10 seconds from the very first site of grace, and another is located right next to the Stage Front Site of Grace in Belurat, Tower Settlement, which is quite easy to farm).',
        infos: [], isSomber: true),
    Weapon(
        name: 'Devonia\'s Hammer',
        image: 'lib/constants/images/dlc/devonias_hammer.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Defeat Crucible Knight near Rauh Ancient Ruins, East Grace.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Fire Knight\'s Greatsword',
        image: 'lib/constants/images/dlc/fire_knights_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind: 'Drop by Fire Knights (Shadow Keep)',
        infos: [], isSomber: true),
    Weapon(
        name: 'Gazing Finger',
        image: 'lib/constants/images/dlc/gazing_finger.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Trade Remembrance of the Mother of Fingers at Enia to receive this weapon.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Greatsword of Radahn (Light)',
        image: 'lib/constants/images/dlc/greatsword_of_radahn_light.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Trade Remembrance of a God and a Lord with Enia at Roundtable Hold.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Greatsword of Radahn (Lord)',
        image: 'lib/constants/images/dlc/greatsword_of_radahn_lord.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'Trade Remembrance of a God and a Lord with Enia at Roundtable Hold.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Moonrithyll\'s Knight\'s Sword',
        image: 'lib/constants/images/dlc/moonrithylls_knights_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_sword,
        howToFind:
            'The weapon drops from defeating the hostile NPC Invader, Moonrithyll, Carian Knight.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Rabbath\'s Cannon',
        image: 'lib/constants/images/dlc/rabbaths_cannon.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.ballista,
        howToFind:
            'Rabbath\'s Rise. After you free the Spiritspring, head outside and use it while mounted on Torrent to reach the higher part of the tower. Loot the chest at the top to obtain this weapon.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Red Bear\'s Claw',
        image: 'lib/constants/images/dlc/red_bears_claw.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.beast_claw,
        howToFind:
            'Northern Nameless Mausoleum: Weapon drops upon defeating the Red Bear located at the Northern Nameless Mausoleum.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Shadow Sunflower Blossom',
        image: 'lib/constants/images/dlc/shadow_sunflower_blossom.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.colossal_weapon,
        howToFind:
            'Trade Remembrance of the Shadow Sunflower at Enia to receive this weapon.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Smithscript Cirque',
        image: 'lib/constants/images/dlc/smithscript_cirque.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.backhand_blade,
        howToFind:
            'The weapon is looted from a body in the Ruined Forge of Starfall Past. The body is located by the edge of the sewage waterfall.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Barbed Staff-Spear',
        image: 'lib/constants/images/dlc/barbed_staff-spear.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "This can be dropped by Jori Elder Inquisitor who can be found in the Abyssal Woods.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Black Steel Greathammer',
        image: 'lib/constants/images/dlc/black_steel_greathammer.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind:
            "Guaranteed drop from the black knight found at the Church of Consolation.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Black Steel GreatShield',
        image: 'lib/constants/images/dlc/black_steel_greatshield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.greatshield,
        howToFind:
            "Dropped by Black Knight Garrew that can be found by Fog Rift Fort.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Black Steel Twinblade',
        image: 'lib/constants/images/dlc/black_steel_twinblade.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.twinblade,
        howToFind:
            "Drops from the Black Knight located at the top of western camp in Scadu Altus (Northeast of Church of the Crusade).",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bloodfiend\'s Fork',
        image: 'lib/constants/images/dlc/bloodfiends_fork.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Dropped from Bloodfiends who wield it (you can find two in a melee battle not far from Ruined Forge Lave Intake).",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bloodfiend\'s Sacred Spear',
        image: 'lib/constants/images/dlc/bloodfiends_sacred_spear.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "The Bloodfiend west of Taylew's Ruined Forge drops this when killed.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bone Bow',
        image: 'lib/constants/images/dlc/bone_bow.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.light_bow,
        howToFind:
            "Belurat Tower Settlement: Can be found being protected by 2 giant Spider-Scorpions, inside the massive tower with a broken spiral staircase.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Bonny Butchering Knife',
        image: 'lib/constants/images/dlc/bonny_butchering_knife.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "Bonny Village: Below a small shed, outside a house. Near the broken bridge.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Carian Sorcery Sword',
        image: 'lib/constants/images/dlc/carian_sorcery_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.thrusting_sword,
        howToFind:
            "In a chest after dropping down into Castle Ensis from Scadu Altus.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Carian Thrusting Shield',
        image: 'lib/constants/images/dlc/carian_thrusting_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.thrusting_shield,
        howToFind:
            "Shadow Keep: From the \"Storehouse, Back Section\" site of grace, go west and you will reach a room where you find a Fire Knight and a few other enemies. The item is right past the Fire Knight and can be found on a corpse under the table.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Chilling Perfume Bottle',
        image: 'lib/constants/images/dlc/chilling_perfume_bottle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Lamenter's Gaol, after using the Upper Gaol key on the door, descending the ladder, and walking into the room with the frozen floor, some Jar Innards will come out of a door to your right. The Chilling Perfume Bottle is in that room.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Deadly Poison Perfume Bottle',
        image: 'lib/constants/images/dlc/deadly_poison_perfume_bottle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind: "Can be purchased from the Thiollier for 6000 Runes.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dancing Blade of Ranah',
        image: 'lib/constants/images/dlc/dancing_blade_of_ranah.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'Dropped by defeating Dancer of Ranah at the Southern Nameless Mausoleum.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Death Knight\'s Longhaft Axe',
        image: 'lib/constants/images/dlc/death_knights_longhaft_axe.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "The weapon is obtained as a reward for defeating the Death Knight boss located at the Scorpion River Catacombs.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dragon-Hunter\'s Great Katana',
        image: 'lib/constants/images/dlc/dragon-hunters.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_katana,
        howToFind: "Dropped by the Ancient Dragon-Man in the Dragon's Pit.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dane\'s Footwork',
        image: 'lib/constants/images/dlc/danes_footwork.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.hand_to_hand_art,
        howToFind:
            "Enir-Ilim: Can be obtained by looting Dryleaf Dane's body after defeating him in Enir-Ilim.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dryleaf Arts',
        image: 'lib/constants/images/dlc/dryleaf_arts.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.hand_to_hand_art,
        howToFind:
            "This weapon is obtained as a drop upon defeating Dryleaf Dane.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Maternal Staff',
        image: 'lib/constants/images/dlc/maternal_staff.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.glintstone_staff,
        howToFind:
            "Cathedral of Manus Metyr: Dropped by Count Ymir, Mother of Fingers.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dryleaf Seal',
        image: 'lib/constants/images/dlc/dryleaf_seal.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Found on a ledge under a cave guarded by gravebirds in the area under Bonny Village.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Dueling Shield',
        image: 'lib/constants/images/dlc/dueling_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.thrusting_shield,
        howToFind:
            "Shadow Keep: From the middle area, take the set of stairs to the next floor. Move to the eastern side, climb the wooden platform, and fight the Vulgar Militiamen. Use the stone platforms to reach the other side, the item is against the wall.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Euporia',
        image: 'lib/constants/images/dlc/euporia.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.twinblade,
        howToFind: "Follow a full guide on the internet to unlock this weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Falx',
        image: 'lib/constants/images/dlc/falx.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'Dropped by Hornsent when invaded close to the Rauh Ancient Ruins site of grace.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Fire Knight\'s Seal',
        image: 'lib/constants/images/dlc/fire_knights_seal.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Shadow Keep: In the area with the giant Queen Marika statue, it is behind the statue. You have to use the lever to lower the water level.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Fire Knight\'s Shortsword',
        image: 'lib/constants/images/dlc/fire_knights_shortsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.dagger,
        howToFind: "Drop by Fire Knights wielding this weapon in Shadow Keep.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Firespark Perfume Bottle',
        image: 'lib/constants/images/dlc/firespark_perfume_bottle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Found in an elevated area South of the Castle Front Site of Grace, in a chest guarded by both Perfumers and Messmer Soldiers. ",
        infos: [], isSomber: true),
    Weapon(
        name: 'Flowerstone Gavel',
        image: 'lib/constants/images/dlc/flowerstone_gavel.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.hammer,
        howToFind:
            "The Dragon Communion Priestess drops this item at the Grand Altar of Dragon Communion after defeating Bayle The Dread.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Frenzyflame Perfume Bottle',
        image: 'lib/constants/images/dlc/frenzyflame_perfume_bottle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Looted from a dead body located at the northern interior of the Abandoned Church in Abyssal Woods.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Freyja\'s Greatsword',
        image: 'lib/constants/images/dlc/freyjas_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind:
            "Can be looted from Freyja\'s body after defeating her in the duel in Enir-Ilim. If her quest did not proceed further to Enir-Ilim, after the duel it can be obtained at the location that Freyja was inspecting the tablets, right in front of the Storehouse, Seventh Floor site of grace in the Specimen Storehouse. Freyja\'s armour can also be found in this location.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golden Lion Shield',
        image: 'lib/constants/images/dlc/golden_lion_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Shadow Keep: Given by Redmane Freyja after you hand her over the Letter for Freyja, received from Sir Anbsach.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Golem Fist',
        image: 'lib/constants/images/dlc/golem_fist.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Looted from certain golems that wield them in Taylew's Ruined Forge.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Great Katana',
        image: 'lib/constants/images/dlc/great_katana.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_katana,
        howToFind:
            "Gravesite Plains: The Great Katana can be found next to the sleeping Ghostflame Dragon on the lake, west of the Abandoned Ailing Village site of grace.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Greatsword of Solitude',
        image: 'lib/constants/images/dlc/greatsword_of_solitude.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "This item is obtained after defeating the Blackgaol Knight. This boss is located inside the Western Nameless Mausoleum.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Greatsword of Damnation',
        image: 'lib/constants/images/dlc/greatsword_of_damnation.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "Midra, Lord Of Frenzied Flame's Remembrance at Midra's Manse",
        infos: [], isSomber: true),
    Weapon(
        name: 'Horned Warrior\'s Greatsword',
        image: 'lib/constants/images/dlc/horned_warriors_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_greatsword,
        howToFind:
            'Guaranteed drop from the Wind-Aspected Horned Warrior towards the end of Enir-Ilim.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Horned Warrior\'s Sword',
        image: 'lib/constants/images/dlc/horned_warriors_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'This can be obtained by eliminating the Horned Warrior in the Belurat Tower Settlement Swamp.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Igon\'s Greatbow',
        image: 'lib/constants/images/dlc/igons_greatbow.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_bow,
        howToFind: "Defeat Igon on the eastern side of Gravesite Plain.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lamenting Visage',
        image: 'lib/constants/images/dlc/lamenting_visage.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.torch,
        howToFind:
            "Inside a room on the lower level of the Lamenter's Gaol, hidden behind an illusory wall. In the area you fall through the floor, go up the stairs and into the the first doorway. Roll into the end of the passageway, and use the Gaol Lower Level Key to open the door.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Leda\'s Sword',
        image: 'lib/constants/images/dlc/ledas_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Found on Needle Knight Leda's corpse in Enir-Ilim along with Leda's Armor after she and the rest of Miquella's followers are defeated.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lightning Perfume Bottle',
        image: 'lib/constants/images/dlc/lightning_perfume_bottle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.perfume_bottle,
        howToFind:
            "Found on a corpse a ways northeast of the Cerulean Coast Site of Grace, laying in a pool of water guarded by a lightning ram.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Lizard Greatsword',
        image: 'lib/constants/images/dlc/lizard_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.greatsword,
        howToFind:
            "Dropped by the imps in the Fog Rift Catacombs (can be farmed from first fought imp).",
        infos: [], isSomber: true),
    Weapon(
        name: 'Madding Hand',
        image: 'lib/constants/images/dlc/madding_hand.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "South of Woodland Trail site of grace in the Abyssal Woods. Drop by Madding Hand enemy.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Main-Gauche',
        image: 'lib/constants/images/dlc/main_gauche.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.dagger,
        howToFind:
            "Shadow Keep: Midway through the Stairs, turn right and enter the room. Enter the room on the right, and defeat the enemies to find the body that contains this weapon on the other side.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Messmer Soldier\'s Shield',
        image: 'lib/constants/images/dlc/messmer_soldiers_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Drops from shield-wielding Messmer Soldiers. Found in camps across Gravesite Plain and Scadu Altus, and inside Castle Ensis and Shadow Keep.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Messmer Soldier\'s Spear',
        image: 'lib/constants/images/dlc/messmer_soldiers_spear.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_spear,
        howToFind: "Dropped by Messmer Soldiers.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Milady',
        image: 'lib/constants/images/dlc/milady.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Castle Ensis: The Milady Light Greatsword weapon can be found inside a chest. The chest is located at the top of a watchtower.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Nanaya\'s Torch',
        image: 'lib/constants/images/dlc/nanayas_torch.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.torch,
        howToFind:
            "Looted from a balcony in Midra's Manse in the Abyssal Woods.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Obsidian Lamina',
        image: 'lib/constants/images/dlc/obsidian_lamina.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.reaper,
        howToFind:
            "Complete the entirety of Sir Ansbach's questline by assisting him. This weapon will be available at the end of his questline after the Final Boss where he will be by the entrance to the arena after the fight.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Pata',
        image: 'lib/constants/images/dlc/pata.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Found inside a hanging body, just outside the Church of Benediction.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Poisoned Hand',
        image: 'lib/constants/images/dlc/poisoned_hand.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "There is a Horned Warrior, in the sewer level of the Belurat Tower Settlement legacy dungeon. To that area's right, there is a medium-sized building, similar to a church, and beside it, you will find the Poisoned Hand weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Poleblade of the Bud',
        image: 'lib/constants/images/dlc/poleblade_of_the_bud.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.halberd,
        howToFind:
            "Trade Remembrance of the Saint of the Bud with Enia to be able to receive this weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Putrescence Cleaver',
        image: 'lib/constants/images/dlc/putrescence_cleaver.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_axe,
        howToFind:
            "Trade Remembrance of Putrescence with Enia at the Roundtable Hold to receive this item.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Queelign\'s Greatsword',
        image: 'lib/constants/images/dlc/queeligns_greatsword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind:
            "Shadow Keep: Use Iris of Occultation on the NPC in the Prayer Room to receive Queelign's Greatsword.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rakshasa\'s Great Katana',
        image: 'lib/constants/images/dlc/rakshasas_great_katana.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_katana,
        howToFind:
            "Dropped by Rakshasa in Eastern Nameless Mausoleum. This area can only be accessed by using the ladder in Shadow Keep to get down to a special teleport coffin . This will take you to Ruins of Unte and you must follow the cliffs downstream and then carefully drop down to bottom level to reach the mausoleum.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Rellana\'s Twinblade',
        image: 'lib/constants/images/dlc/rellanas_twinblade.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.light_greatsword,
        howToFind:
            "Trade Remembrance of the Twin Moon Knight with Enia at the Roundtable Hold, to receive this weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Repeating Crossbow',
        image: 'lib/constants/images/dlc/repeating_crossbow.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.crossbow,
        howToFind:
            'Along the road next to the Ghostflame Dragon north of the Moorth Highway, South site of Grace.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Serpent Crest Shield',
        image: 'lib/constants/images/dlc/serpent_crest_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Can be obtained by completing the \"Incursion\" Painting Puzzle.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Serpent Flail',
        image: 'lib/constants/images/dlc/serpent_flail.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.flail,
        howToFind:
            "Fog Rift Fort: Head down using the ladder past the first tower, and defeat the enemies. Beware of the flamethrowers. Use spells or arrows if you have them. Reach the end of the area to find a chest that contains this item.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Shield of Night',
        image: 'lib/constants/images/dlc/shield_of_night.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.small_shield,
        howToFind:
            "Can be found in Bonny Gaol. The top level of this gaol can be accessed after using the jar lift near the bridge twice. You need to jump off at the bridge level, activate the switch, and then ride the jar going up. You will find this on the ledge behind the corpse on top of a table.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Smithscript Dagger',
        image: 'lib/constants/images/dlc/smithscript_dagger.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.throwing_blade,
        howToFind:
            "Ruined Forge Lava Intake. Take the first ladder down, past the golem, and after the fire blob turn right. As soon as you enter the room past the Fire Blob, slightly to the left. You can also drop down to this area from the lever's location. At the end of the hallway, you will find a golem and this weapon on a corpse near the back wall.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Smithscript Greathammer',
        image: 'lib/constants/images/dlc/smithscript_greathammer.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_hammer,
        howToFind:
            "Taylew's Ruined Forge: Use the giant platform in the middle to jump to the other side. Once there, keep moving forward and on the left side there will be a fire blob enemy protecting the item. Defeat the enemy and loot the corpse behind it to obtain the weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Smithscript Shield',
        image: 'lib/constants/images/dlc/smithscript_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.small_shield,
        howToFind:
            "Can be found in: Taylew's Ruined Forge (north of Ancient Ruins Base), on a corpse inside the forge. Jump from the opening left to the Lever, and instead of heading forward turn left. There are two Smithing Golems there, one that uses fire. Once defeated, stick to the right and go up to the upper platform using the crumbled column. You will find the item at the end of the hallway. Beware of the fire blob that falls from the ceiling.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Smithscript Spear',
        image: 'lib/constants/images/dlc/smithscript_spear.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Ruined Forge Starfall Past: The weapon is looted from a body located on the main floor of the Ruined Forge of Starfall Past.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spear of the Impaler',
        image: 'lib/constants/images/dlc/spear_of_the_impaler.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.great_spear,
        howToFind:
            "Trade Remembrance of the Impaler at Enia to receive this weapon.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spiraltree Seal',
        image: 'lib/constants/images/dlc/spiraltree_seal.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.sacred_seal,
        howToFind:
            "Reward for completing \"The Sacred Tower\" Painting Puzzle.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spirit Glaive',
        image: 'lib/constants/images/dlc/spirit_glaive.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.halberd,
        howToFind:
            "Start at the Charo's Hidden Grave site of grace and walk through the arch to the northwest, turn right directly after and take the path that ramps up north, follow it to where it meets the edge of the Gravesite Plains and it will be on a grave.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Spirit Sword',
        image: 'lib/constants/images/dlc/spirit_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.curved_sword,
        howToFind:
            'You can find this weapon in Cerulean Coast. Northeast from the Cerulean Coast West site of grace, the entrance to a triangular ravine can be accessed. It\'s in the right corner in that lower area, near some demi-humans.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Spread Crossbow',
        image: 'lib/constants/images/dlc/spread_crossbow.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.crossbow,
        howToFind:
            'A Spread Crossbow can be found on a body by the riverside and the Ellac Greatbridge. Past the Ellac Greatbridge turn right and head to the lower level. There is a smaller camp with three Messmer Soldiers. There you will find the Spread Crossbow.',
        infos: [], isSomber: true),
    Weapon(
        name: 'Staff of the Great Beyond',
        image: 'lib/constants/images/dlc/staff_of_the_great_beyond.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.glintstone_staff,
        howToFind:
            "Exchange Remembrance of the Mother of Fingers with Finger Reader Enia in Roundtable Hold.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Star-Lined Sword',
        image: 'lib/constants/images/dlc/star-lined_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.katana,
        howToFind:
            "Dropped by Demi-Human Queen Marigga, who can be found in the Cerulean Coast starting from Cerulean Coast West Site of Grace to follow the path northeast populated with demi-humans.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Stone-Sheathed Sword',
        image: 'lib/constants/images/dlc/stone-sheathed_sword.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Can be acquired at one of the 3 Altar locations: Fog Rift Catacombs (on top of the 3 trap platforms and run to the furthest right corner), Ruins of Unte (flowery courtyard), or Ancient Ruins of Rauh (on a tower connected by an invisible floor).",
        infos: [], isSomber: true),
    Weapon(
        name: 'Swift Spear',
        image: 'lib/constants/images/dlc/swift_spear.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.spear,
        howToFind:
            "Can be found lying on a corpse guarded by 3 Messmer Soldiers along the road north of the Pillar Path Waypoint site of grace.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword Lance',
        image: 'lib/constants/images/dlc/sword_lance.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.heavy_thrusting_sword,
        howToFind:
            "Can be selected as one of the possible rewards when trading Remembrance of the Wild Boar Rider with Enia at the Roundtable Hold.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword of Darkness',
        image: 'lib/constants/images/dlc/sword_of_darkness.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Obtained by raising Stone-Sheathed Sword or Sword of Light at the Altar located in Fog Rift Catacombs (see below).",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword of Light',
        image: 'lib/constants/images/dlc/sword_of_light.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Obtained by raising the Stone-Sheathed Sword at the Altar in the Ruins of Unte. The altar area is normally accessible after using a Hefty Furnace Pot and throwing it at the head of the deactivated Furnace Golem that blocks the entrance so that it moves away. The player can also access this inner area with the use of Torrent, jumping on the small borders the southern tower and then through the broken outer walls.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Sword of Night',
        image: 'lib/constants/images/dlc/sword_of_night.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.katana,
        howToFind:
            "Cathedral of Manus Metyr: After completing the whole finger questline for Count Ymir, Jolan will be dejected nearby. Give her an Iris of Occultation to get the Sword of Night.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Thiollier\'s Hidden Needle',
        image: 'lib/constants/images/dlc/thiolliers_hidden_needle.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.fist,
        howToFind:
            "Finish the St. Trina and Thiollier quests and loot it after defeating the final boss.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Tooth Whip',
        image: 'lib/constants/images/dlc/tooth_whip.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.whip,
        howToFind: "Found inside the Whipping Hut.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Velvet Sword of St-Trina',
        image: 'lib/constants/images/dlc/velvet_sword_of_st_trina.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.straight_sword,
        howToFind:
            "Stone Coffin Fissure: From the Fissure Cross site of grace, walk immediately north-west to the closest giant coffin that's tilted nearly vertical. Climb down to a ledge that passes underneath the brick platform nearest the site of grace. The sword is in a small cave network there and guarded by several putrescent oozes.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Verdigris Greatshield',
        image: 'lib/constants/images/dlc/verdigris_greatshield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.greatshield,
        howToFind:
            "Rewarded upon killing the NPC invader Moore, who appears north of the Church of the Crusade in Scadu Altus in the Realm of Shadow.",
        infos: [], isSomber: true),
    Weapon(
        name: 'Wolf Crest Shield',
        image: 'lib/constants/images/dlc/wolf_crest_shield.png',
        location: Location.DLC_gravesite_plain,
        weaponCategory: WeaponCategory.medium_shield,
        howToFind:
            "Can be found in: Castle Ensis. Located inside a storeroom you'll find a treasure chest that has the Wolf Crest Shield.",
        infos: [],
    isSomber: false)
  ];
  return dlcWeapons;
}
