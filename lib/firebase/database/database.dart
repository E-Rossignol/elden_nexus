import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/models/armor_set.dart';
import 'package:elden_nexus/models/ash_of_war.dart';
import 'package:elden_nexus/models/incantation.dart';
import 'package:elden_nexus/models/sorcery.dart';
import 'package:elden_nexus/models/talisman.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../models/armor.dart';
import '../../models/tear.dart';
import '../../models/weapon.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton providing methods to read/write game data from Firestore and local cache.
///
/// Use DatabaseMethods.instance to access shared instance.
class DatabaseMethods {
  static DatabaseMethods? _instance;

  DatabaseMethods._privateConstructor();

  /// Add user armor.
  ///
  /// @param armorName Name of armor.
  /// @param userID ID of user.
  /// @return Future<DocumentReference>

  static DatabaseMethods get instance {
    _instance ??= DatabaseMethods._privateConstructor();
    return _instance!;
  }

  List<Weapon> _mainGameWeapons = [];
  List<Talisman> _mainGameTalismans = [];

  /// Remove user armor.
  ///
  /// @param armorName Name of armor.
  /// @param userID ID of user.
  /// @return Future<void>
  List<Armor> _mainGameArmors = [];
  List<Incantation> _mainGameIncantations = [];
  List<Sorcery> _mainGameSorceries = [];
  List<Tear> _mainGameTears = [];
  List<AshOfWar> _mainGameAshesOfWar = [];
  List<Weapon> _soteWeapons = [];
  List<Talisman> _soteTalismans = [];
  List<Armor> _soteArmors = [];
  List<Incantation> _soteIncantations = [];
  List<Sorcery> _soteSorceries = [];
  List<Tear> _soteTears = [];
  List<AshOfWar> _soteAshesOfWar = [];
  List<ArmorSet> _mainGameArmorSets = [];
  List<ArmorSet> _soteArmorSets = [];

  /// Get user's armors.
  ///
  /// @param userID ID of user.
  /// @return Future<List<String>>
  /// Retrieve a code used to validate access.
  ///
  /// @return Future<String> The code read from Firestore.
  Future<String> getCheckCode() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('codeCheck')
        .get();
    return querySnapshot.docs.first['value'];
  }

  /// Retrieve all incantations.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<Incantation>?> list or null if empty.

  /// Initialize local cache from Firestore if needed.
  ///
  /// @return Future<bool> true if initialization succeeded and token matched.
  Future<bool> initDatas() async {
    String code = await getCheckCode();
    if (code != token) {
      return false;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Weapons
    if (prefs.getStringList('mainGameWeapons') == null ||
        prefs.getStringList('mainGameWeapons')!.isEmpty) {
      List<Weapon> weapons = await getAllWeapons(false) ?? [];
      List<String> weaponStrings = [];
      for (Weapon weapon in weapons) {
        weaponStrings.add(jsonEncode(weapon.toMap()));
      }
      await prefs.setStringList('mainGameWeapons', weaponStrings);
      _mainGameWeapons = weapons;

      /// Add user incantation.
      ///
      /// @param incantName Name of incantation.
      /// @param userID ID of user.
      /// @return Future<DocumentReference>
    } else if (_mainGameWeapons.isEmpty) {
      // Load cached weapons into memory
      List<String>? weaponStrings = prefs.getStringList('mainGameWeapons');
      for (String weaponStr in weaponStrings!) {
        _mainGameWeapons.add(Weapon.fromMap(jsonDecode(weaponStr)));
      }
    }

    // Talismans
    if (prefs.getStringList('mainGameTalismans') == null ||
        /// Remove user incantation.
        ///
        /// @param incantName Name of incantation.
        /// @param userID ID of user.
        /// @return Future<void>
        prefs.getStringList('mainGameTalismans')!.isEmpty) {
      List<Talisman> talismans = await getAllTalismans(false) ?? [];
      List<String> talismanStrings = [];
      for (Talisman talisman in talismans) {
        talismanStrings.add(jsonEncode(talisman.toMap()));
      }
      await prefs.setStringList('mainGameTalismans', talismanStrings);
      _mainGameTalismans = talismans;
    } else if (_mainGameTalismans.isEmpty) {
      List<String>? talismanStrings = prefs.getStringList('mainGameTalismans');
      for (String talismanStr in talismanStrings!) {
        _mainGameTalismans.add(Talisman.fromMap(jsonDecode(talismanStr)));
      }
    }

    /// Get user's incantations.
    ///
    /// @param userID ID of user.
    /// @return Future<List<String>>
    // Armors
    if (prefs.getStringList('mainGameArmors') == null ||
        prefs.getStringList('mainGameArmors')!.isEmpty) {
      List<Armor> armors = await getAllArmors(false) ?? [];
      List<String> armorStrings = [];
      for (Armor armor in armors) {
        armorStrings.add(jsonEncode(armor.toMap()));
      }

      /// Retrieve sorceries.
      ///
      /// @param isDlc boolean indicating DLC collection.
      /// @return Future<List<Sorcery>?> list or null if empty.
      await prefs.setStringList('mainGameArmors', armorStrings);
      _mainGameArmors = armors;
    } else if (_mainGameArmors.isEmpty) {
      List<String>? armorStrings = prefs.getStringList('mainGameArmors');
      for (String armorStr in armorStrings!) {
        _mainGameArmors.add(Armor.fromMap(jsonDecode(armorStr)));
      }
    }

    // Armor sets
    if (prefs.getStringList('mainGameArmorSets') == null ||
        prefs.getStringList('mainGameArmorSets')!.isEmpty) {
      List<ArmorSet> armors = await getAllArmorSets(false) ?? [];
      List<String> armorStrings = [];
      for (ArmorSet armor in armors) {
        armorStrings.add(jsonEncode(armor.toMap()));
      }
      await prefs.setStringList('mainGameArmorSets', armorStrings);
      _mainGameArmorSets = armors;

      /// Add user sorcery.
      ///
      /// @param sorcName Name of sorcery.
      /// @param userID ID of user.
      /// @return Future<DocumentReference>
    } else if (_mainGameArmorSets.isEmpty) {
      List<String>? armorStrings = prefs.getStringList('mainGameArmorSets');
      for (String armorStr in armorStrings!) {
        _mainGameArmorSets.add(ArmorSet.fromMap(jsonDecode(armorStr)));
      }
    }

    // Incantations
    if (prefs.getStringList('mainGameIncantations') == null ||
        prefs.getStringList('mainGameIncantations')!.isEmpty) {
      /// Remove user sorcery.
      ///
      /// @param sorcName Name of sorcery.
      /// @param userID ID of user.
      /// @return Future<void>
      List<Incantation> incantations = await getAllIncantations(false) ?? [];
      List<String> incantationStrings = [];
      for (Incantation incantation in incantations) {
        incantationStrings.add(jsonEncode(incantation.toMap()));
      }
      await prefs.setStringList('mainGameIncantations', incantationStrings);
      _mainGameIncantations = incantations;
    } else if (_mainGameIncantations.isEmpty) {
      List<String>? incantationStrings = prefs.getStringList(
        'mainGameIncantations',
      );
      for (String incantationStr in incantationStrings!) {
        _mainGameIncantations.add(
          Incantation.fromMap(jsonDecode(incantationStr)),
        );
      }
    }

    /// Get user's sorceries.
    ///
    /// @param userID ID of user.
    /// @return Future<List<String>>

    // Sorceries
    if (prefs.getStringList('mainGameSorceries') == null ||
        prefs.getStringList('mainGameSorceries')!.isEmpty) {
      List<Sorcery> sorceries = await getAllSorceries(false) ?? [];
      List<String> sorceryStrings = [];
      for (Sorcery sorcery in sorceries) {
        sorceryStrings.add(jsonEncode(sorcery.toMap()));

        /// Store selected data sets to Firestore (helper to seed DB).
        ///
        /// @return Future<void>
        await prefs.setStringList('mainGameSorceries', sorceryStrings);
      }
    } else if (_mainGameSorceries.isEmpty) {}

    // Tears
    if (prefs.getStringList('mainGameTears') == null ||
        prefs.getStringList('mainGameTears')!.isEmpty) {
      List<Tear> tears = await getAllTears(false) ?? [];
      List<String> tearStrings = [];
      for (Tear tear in tears) {
        tearStrings.add(jsonEncode(tear.toMap()));
      }
      await prefs.setStringList('mainGameTears', tearStrings);
      _mainGameTears = tears;
    } else if (_mainGameTears.isEmpty) {
      List<String>? tearStrings = prefs.getStringList('mainGameTears');
      for (String tearStr in tearStrings!) {
        _mainGameTears.add(Tear.fromMap(jsonDecode(tearStr)));
      }
    }

    // Ashes of war
    if (prefs.getStringList('mainGameAshesOfWar') == null ||
        prefs.getStringList('mainGameAshesOfWar')!.isEmpty) {
      List<AshOfWar> ashesOfWar = await getAllAow(false) ?? [];
      List<String> ashStrings = [];
      for (AshOfWar ash in ashesOfWar) {
        ashStrings.add(jsonEncode(ash.toMap()));
      }
      await prefs.setStringList('mainGameAshesOfWar', ashStrings);
      _mainGameAshesOfWar = ashesOfWar;
    } else if (_mainGameAshesOfWar.isEmpty) {
      List<String>? ashStrings = prefs.getStringList('mainGameAshesOfWar');
      for (String ashStr in ashStrings!) {
        _mainGameAshesOfWar.add(AshOfWar.fromMap(jsonDecode(ashStr)));
      }
    }

    // SOTE (DLC) equivalents follow similar patterns.
    if (prefs.getStringList('soteWeapons') == null ||
        prefs.getStringList('soteWeapons')!.isEmpty) {
      List<Weapon> weapons = await getAllWeapons(true) ?? [];
      List<String> weaponStrings = [];
      for (Weapon weapon in weapons) {
        weaponStrings.add(jsonEncode(weapon.toMap()));
      }
      await prefs.setStringList('soteWeapons', weaponStrings);
      _soteWeapons = weapons;
    } else if (_soteWeapons.isEmpty) {
      List<String>? weaponStrings = prefs.getStringList('soteWeapons');
      for (String weaponStr in weaponStrings!) {
        _soteWeapons.add(Weapon.fromMap(jsonDecode(weaponStr)));
      }
    }

    if (prefs.getStringList('soteTalismans') == null ||
        prefs.getStringList('soteTalismans')!.isEmpty) {
      List<Talisman> talismans = await getAllTalismans(true) ?? [];

      /// Migrate stored user entries from an old ID to a new one.
      ///
      /// @return Future<void>
      List<String> talismanStrings = [];
      for (Talisman talisman in talismans) {
        talismanStrings.add(jsonEncode(talisman.toMap()));
      }
      await prefs.setStringList('soteTalismans', talismanStrings);
      _soteTalismans = talismans;
    } else if (_soteTalismans.isEmpty) {
      List<String>? talismanStrings = prefs.getStringList('soteTalismans');
      for (String talismanStr in talismanStrings!) {
        _soteTalismans.add(Talisman.fromMap(jsonDecode(talismanStr)));
      }
    }

    if (prefs.getStringList('soteArmors') == null ||
        prefs.getStringList('soteArmors')!.isEmpty) {
      List<Armor> armors = await getAllArmors(true) ?? [];
      List<String> armorStrings = [];
      for (Armor armor in armors) {
        armorStrings.add(jsonEncode(armor.toMap()));
      }
      await prefs.setStringList('soteArmors', armorStrings);
      _soteArmors = armors;
    } else if (_soteArmors.isEmpty) {
      List<String>? armorStrings = prefs.getStringList('soteArmors');
      for (String armorStr in armorStrings!) {
        _soteArmors.add(Armor.fromMap(jsonDecode(armorStr)));
      }
    }

    if (prefs.getStringList('soteArmorSets') == null ||
        prefs.getStringList('soteArmorSets')!.isEmpty) {
      List<ArmorSet> armors = await getAllArmorSets(true) ?? [];
      List<String> armorStrings = [];
      for (ArmorSet armor in armors) {
        armorStrings.add(jsonEncode(armor.toMap()));
      }
      await prefs.setStringList('soteArmorSets', armorStrings);
      _soteArmorSets = armors;
    } else if (_soteArmorSets.isEmpty) {
      List<String>? armorStrings = prefs.getStringList('soteArmorSets');
      for (String armorStr in armorStrings!) {
        _soteArmorSets.add(ArmorSet.fromMap(jsonDecode(armorStr)));
      }
    }

    if (prefs.getStringList('soteIncantations') == null ||
        prefs.getStringList('soteIncantations')!.isEmpty) {
      List<Incantation> incantations = await getAllIncantations(true) ?? [];
      List<String> incantationStrings = [];
      for (Incantation incantation in incantations) {
        incantationStrings.add(jsonEncode(incantation.toMap()));
      }
      await prefs.setStringList('soteIncantations', incantationStrings);
      _soteIncantations = incantations;
    } else if (_soteIncantations.isEmpty) {
      List<String>? incantationStrings = prefs.getStringList(
        'soteIncantations',
      );
      for (String incantationStr in incantationStrings!) {
        _soteIncantations.add(Incantation.fromMap(jsonDecode(incantationStr)));
      }
    }

    if (prefs.getStringList('soteSorceries') == null ||
        prefs.getStringList('soteSorceries')!.isEmpty) {
      List<Sorcery> sorceries = await getAllSorceries(true) ?? [];
      List<String> sorceryStrings = [];
      for (Sorcery sorcery in sorceries) {
        sorceryStrings.add(jsonEncode(sorcery.toMap()));
      }
      await prefs.setStringList('soteSorceries', sorceryStrings);
      _soteSorceries = sorceries;
    } else if (_soteSorceries.isEmpty) {
      List<String>? sorceryStrings = prefs.getStringList('soteSorceries');
      for (String sorceryStr in sorceryStrings!) {
        _soteSorceries.add(Sorcery.fromMap(jsonDecode(sorceryStr)));
      }
    }

    if (prefs.getStringList('soteTears') == null ||
        prefs.getStringList('soteTears')!.isEmpty) {
      List<Tear> tears = await getAllTears(true) ?? [];
      List<String> tearStrings = [];
      for (Tear tear in tears) {
        tearStrings.add(jsonEncode(tear.toMap()));
      }
      await prefs.setStringList('soteTears', tearStrings);
      _soteTears = tears;
    } else if (_soteTears.isEmpty) {
      List<String>? tearStrings = prefs.getStringList('soteTears');
      for (String tearStr in tearStrings!) {
        _soteTears.add(Tear.fromMap(jsonDecode(tearStr)));
      }
    }

    if (prefs.getStringList('soteAshesOfWar') == null ||
        prefs.getStringList('soteAshesOfWar')!.isEmpty) {
      List<AshOfWar> ashesOfWar = await getAllAow(true) ?? [];
      List<String> ashStrings = [];
      for (AshOfWar ash in ashesOfWar) {
        ashStrings.add(jsonEncode(ash.toMap()));
      }
      await prefs.setStringList('soteAshesOfWar', ashStrings);
      _soteAshesOfWar = ashesOfWar;
    } else if (_soteAshesOfWar.isEmpty) {
      List<String>? ashStrings = prefs.getStringList('soteAshesOfWar');
      for (String ashStr in ashStrings!) {
        _soteAshesOfWar.add(AshOfWar.fromMap(jsonDecode(ashStr)));
      }
    }
    return true;
  }

  /// In-memory getter for main game weapons.
  ///
  /// @return List<Weapon>
  get allDBWeapons => _mainGameWeapons;

  /// In-memory getter for main game talismans.
  ///
  /// @return List<Talisman>
  get allDBTalismans => _mainGameTalismans;

  /// In-memory getter for main game armors.
  ///
  /// @return List<Armor>
  get allDBArmors => _mainGameArmors;

  /// In-memory getter for main game armor sets.
  ///
  /// @return List<ArmorSet>
  get allDBArmorSets => _mainGameArmorSets;

  /// In-memory getter for main game incantations.
  ///
  /// @return List<Incantation>
  get allDBIncantations => _mainGameIncantations;

  /// In-memory getter for main game sorceries.
  ///
  /// @return List<Sorcery>
  get allDBSorceries => _mainGameSorceries;

  /// In-memory getter for main game tears.
  ///
  /// @return List<Tear>
  get allDBTears => _mainGameTears;

  /// In-memory getter for main game ashes of war.
  ///
  /// @return List<AshOfWar>
  get allDBAshesOfWar => _mainGameAshesOfWar;

  /// In-memory getter for SOTE weapons.
  ///
  /// @return List<Weapon>
  get allDBSOTEWeapons => _soteWeapons;

  /// In-memory getter for SOTE talismans.
  ///
  /// @return List<Talisman>
  get allDBSOTETalismans => _soteTalismans;

  /// In-memory getter for SOTE armors.
  ///
  /// @return List<Armor>
  get allDBSOTEArmors => _soteArmors;

  /// In-memory getter for SOTE armor sets.
  ///
  /// @return List<ArmorSet>
  get allDBSOTEArmorSets => _soteArmorSets;

  /// In-memory getter for SOTE incantations.
  ///
  /// @return List<Incantation>
  get allDBSOTEIncantations => _soteIncantations;

  /// In-memory getter for SOTE sorceries.
  ///
  /// @return List<Sorcery>
  get allDBSOTESorceries => _soteSorceries;

  /// In-memory getter for SOTE tears.
  ///
  /// @return List<Tear>
  get allDBSOTETears => _soteTears;

  /// In-memory getter for SOTE ashes of war.
  ///
  /// @return List<AshOfWar>
  get allDBSOTEAshesOfWar => _soteAshesOfWar;

  /// Retrieve all talismans from Firestore.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<Talisman>?> list or null if empty.
  Future<List<Talisman>?> getAllTalismans(bool isDlc) async {
    String tableName = isDlc ? 'allSOTETalismans' : 'allMainGameTalismans';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Talisman> talismans = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Talisman tal = Talisman.fromMap(doc.data() as Map<String, dynamic>?);
        talismans.add(tal);
      }
    }
    return talismans;
  }

  /// Retrieve all weapons; delegates to appropriate helper based on DLC flag.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<Weapon>?> list or null if empty.
  Future<List<Weapon>?> getAllWeapons(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEWeapons' : 'allMainGameWeapons';
    if (!isDlc) {
      return allWeapons();
    }
    if (isDlc) {
      return allSOTEWeapons();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Weapon> weapons = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Weapon weapon = Weapon.fromMap(doc.data() as Map<String, dynamic>?);
        weapons.add(weapon);
      }
    }
    return weapons;
  }

  /// Add a user-owned weapon record to Firestore.
  ///
  /// @param weaponName Name of the weapon to add.
  /// @param userID ID of the user.
  /// @return Future<DocumentReference> or add result.
  Future addUserWeapon(String weaponName, String userID) async {
    Map<String, dynamic> json = {'name': weaponName, 'userID': userID};
    return await FirebaseFirestore.instance
        .collection('usersWeapons')
        .add(json);
  }

  /// Remove a user-owned weapon record if present.
  ///
  /// @param weaponName Name of the weapon to remove.
  /// @param userID ID of the user.
  /// @return Future<void>
  Future removeUserWeapon(String weaponName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersWeapons')
        .where('name', isEqualTo: weaponName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersWeapons')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  /// Get a list of user-owned weapons for a user.
  ///
  /// @param userID ID of the user.
  /// @return Future<List<String>> list of weapon names.
  Future<List<String>> getUserWeapons(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersWeapons')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  /// Retrieve all ashes of war.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<AshOfWar>?> list or null if empty.
  Future<List<AshOfWar>?> getAllAow(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEAOW' : 'allMainGameAOW';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<AshOfWar> ashesOfWar = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        AshOfWar ash = AshOfWar.fromMap(doc.data() as Map<String, dynamic>?);
        ashesOfWar.add(ash);
      }
    }
    ashesOfWar.sort((a, b) => a.name.compareTo(b.name));
    return ashesOfWar;
  }

  /// Add a user-owned ash of war.
  ///
  /// @param ashName Name of the ash.
  /// @param userID ID of the user.
  /// @return Future<DocumentReference>
  Future addUserAsh(String ashName, String userID) async {
    Map<String, dynamic> json = {'name': ashName, 'userID': userID};
    return await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .add(json);
  }

  /// Remove a user's ash of war entry.
  ///
  /// @param ashName Name of the ash.
  /// @param userID ID of the user.
  /// @return Future<void>
  Future removeUserAsh(String ashName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .where('name', isEqualTo: ashName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersAshesOfWar')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  /// Get user's ashes of war list.
  ///
  /// @param userID ID of the user.
  /// @return Future<List<String>>
  Future<List<String>> getUserAshes(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  /// Add a talisman for a user.
  ///
  /// @param talismanName Name of talisman.
  /// @param userID ID of user.
  /// @return Future<DocumentReference>
  Future addUserTalisman(String talismanName, String userID) async {
    Map<String, dynamic> json = {'name': talismanName, 'userID': userID};
    return await FirebaseFirestore.instance
        .collection('usersTalismans')
        .add(json);
  }

  /// Remove a user's talisman entry.
  ///
  /// @param talismanName Name of talisman.
  /// @param userID ID of user.
  /// @return Future<void>
  Future removeUserTalisman(String talismanName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTalismans')
        .where('name', isEqualTo: talismanName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersTalismans')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  /// Get user's talismans.
  ///
  /// @param userID ID of user.
  /// @return Future<List<String>>
  Future<List<String>> getUserTalismans(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTalismans')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  /// Retrieve all tears.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<Tear>?> list or null if empty.
  Future<List<Tear>?> getAllTears(bool isDlc) async {
    String tableName = isDlc ? 'allSOTETears' : 'allMainGameTears';
    if (isDlc) {
      return allSOTETears();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Tear> tears = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Tear tear = Tear.fromMap(doc.data() as Map<String, dynamic>?);
        tears.add(tear);
      }
    }
    return tears;
  }

  /// Add user tear.
  ///
  /// @param tearName Name of tear.
  /// @param userID ID of user.
  /// @return Future<DocumentReference>
  Future addUserTear(String tearName, String userID) async {
    Map<String, dynamic> json = {'name': tearName, 'userID': userID};
    return await FirebaseFirestore.instance.collection('usersTears').add(json);
  }

  /// Remove user tear.
  ///
  /// @param tearName Name of tear.
  /// @param userID ID of user.
  /// @return Future<void>
  Future removeUserTear(String tearName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTears')
        .where('name', isEqualTo: tearName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersTears')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  /// Get user's tears.
  ///
  /// @param userID ID of user.
  /// @return Future<List<String>>
  Future<List<String>> getUserTears(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTears')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  /// Retrieve all armors.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<Armor>?> list or null if empty.
  Future<List<Armor>?> getAllArmors(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEArmors' : 'allMainGameArmors';
    if (!isDlc) {
      return allArmors();
    } else if (isDlc) {
      return allSOTEArmors();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Armor> armors = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Armor armor = Armor.fromMap(doc.data() as Map<String, dynamic>?);
        armors.add(armor);
      }
    }
    return armors;
  }

  /// Retrieve all armor sets.
  ///
  /// @param isDlc boolean indicating DLC collection.
  /// @return Future<List<ArmorSet>?> list or null if empty.
  Future<List<ArmorSet>?> getAllArmorSets(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEArmorSets' : 'allMainGameArmorSets';
    if (!isDlc) {
      return allSets();
    } else if (isDlc) {
      return allSOTESets();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<ArmorSet> armors = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        ArmorSet armor = ArmorSet.fromMap(doc.data() as Map<String, dynamic>?);
        armors.add(armor);
      }
    }
    return armors;
  }

  Future addUserArmor(String armorName, String userID) async {
    Map<String, dynamic> json = {'name': armorName, 'userID': userID};
    return await FirebaseFirestore.instance.collection('usersArmors').add(json);
  }

  Future removeUserArmor(String armorName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersArmors')
        .where('name', isEqualTo: armorName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersArmors')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  Future<List<String>> getUserArmors(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersArmors')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<List<Incantation>?> getAllIncantations(bool isDlc) async {
    String tableName = isDlc
        ? 'allSOTEIncantations'
        : 'allMainGameIncantations';
    if (!isDlc) {
      return allIncantations();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Incantation> incants = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Incantation incant = Incantation.fromMap(
          doc.data() as Map<String, dynamic>?,
        );
        incants.add(incant);
      }
    }
    return incants;
  }

  Future addUserIncantation(String incantName, String userID) async {
    Map<String, dynamic> json = {'name': incantName, 'userID': userID};
    return await FirebaseFirestore.instance
        .collection('usersIncantations')
        .add(json);
  }

  Future removeUserIncantation(String incantName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersIncantations')
        .where('name', isEqualTo: incantName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersIncantations')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  Future<List<String>> getUserIncantations(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersIncantations')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<List<Sorcery>?> getAllSorceries(bool isDlc) async {
    String tableName = isDlc ? 'allSOTESorceries' : 'allMainGameSorceries';
    if (!isDlc) {
      return allSorceries();
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tableName)
        .get();
    List<Sorcery> sorceries = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Sorcery sorc = Sorcery.fromMap(doc.data() as Map<String, dynamic>?);
        sorceries.add(sorc);
      }
    }
    return sorceries;
  }

  Future addUserSorcery(String sorcName, String userID) async {
    Map<String, dynamic> json = {'name': sorcName, 'userID': userID};
    return await FirebaseFirestore.instance
        .collection('usersSorceries')
        .add(json);
  }

  Future removeUserSorcery(String sorcName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersSorceries')
        .where('name', isEqualTo: sorcName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('usersSorceries')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  Future<List<String>> getUserSorceries(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersSorceries')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  // ONCE DATA ARE IN
  Future<void> storeAll() async {
    //await storeAllMainGameWeapons();
    await storeAllMainGameArmors();
    //await storeAllSOTEArmors();
    //await storeAllSOTETears();
    //await storeAllMainGameIncantations();
    //await storeAllMainGameSorceries();
  }

  Future<void> storeAllMainGameWeapons() async {
    List<Weapon> weapons = allWeapons();
    for (Weapon weapon in weapons) {
      await FirebaseFirestore.instance
          .collection('allMainGameWeapons')
          .add(weapon.toMap());
    }
  }

  Future<void> storeAllMainGameArmors() async {
    List<Armor> armors = allArmors();
    for (Armor arm in armors) {
      await FirebaseFirestore.instance
          .collection('allMainGameArmors')
          .add(arm.toMap());
    }
  }

  Future<void> storeAllSOTEArmors() async {
    List<Armor> armors = allSOTEArmors();
    for (Armor arm in armors) {
      await FirebaseFirestore.instance
          .collection('allSOTEArmors')
          .add(arm.toMap());
    }
  }

  Future<void> storeAllSOTETears() async {
    List<Tear> tears = allSOTETears();
    for (Tear tear in tears) {
      await FirebaseFirestore.instance
          .collection('allSOTETears')
          .add(tear.toMap());
    }
  }

  Future<void> storeAllMainGameIncantations() async {
    List<Incantation> incants = allIncantations();
    for (Incantation incant in incants) {
      await FirebaseFirestore.instance
          .collection('allMainGameIncantations')
          .add(incant.toMap());
    }
  }

  Future<void> storeAllMainGameSorceries() async {
    List<Sorcery> sorceries = allSorceries();
    for (Sorcery sorc in sorceries) {
      await FirebaseFirestore.instance
          .collection('allMainGameSorceries')
          .add(sorc.toMap());
    }
  }

  Future<void> erwanChangeId() async {
    String id = await const FlutterSecureStorage().read(key: 'id') ?? '';
    String oldID = "";
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersWeapons')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersWeapons')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersArmors')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersArmors')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersTalismans')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersTalismans')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersIncantations')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersIncantations')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersSorceries')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersSorceries')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersTears')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersTears')
          .doc(doc.id)
          .update({'userID': id});
    }

    querySnapshot = await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .where('userID', isEqualTo: oldID)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('usersAshesOfWar')
          .doc(doc.id)
          .update({'userID': id});
    }
  }
}
