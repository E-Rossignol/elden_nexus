import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elden_nexus/constants/constant.dart';
import 'package:elden_nexus/models/ash_of_war.dart';
import 'package:elden_nexus/models/incantation.dart';
import 'package:elden_nexus/models/sorcery.dart';
import 'package:elden_nexus/models/talisman.dart';
import '../../models/armor.dart';
import '../../models/tear.dart';
import '../../models/weapon.dart';

class DatabaseMethods {
  Future<List<Talisman>?> getAllTalismans(bool isDlc) async {
    String tableName = isDlc ? 'allSOTETalismans' : 'allMainGameTalismans';
    if (!isDlc) {
      return allTalismans();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
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

  Future<List<Weapon>?> getAllWeapons(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEWeapons' : 'allMainGameWeapons';
    if (!isDlc) {
      return allWeapons();
    }
    if (isDlc) {
      return allSOTEWeapons();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
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

  Future addUserWeapon(String weaponName, String userID) async {
    Map<String, dynamic> json = {
      'name': weaponName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance
        .collection('usersWeapons')
        .add(json);
  }

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

  Future<List<String>> getUserWeapons(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersWeapons')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<List<AshOfWar>?> getAllAow(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEAOW' : 'allMainGameAOW';
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
    List<AshOfWar> ashesOfWar = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        AshOfWar ash = AshOfWar.fromMap(doc.data() as Map<String, dynamic>?);
        ashesOfWar.add(ash);
      }
    }
    return ashesOfWar;
  }

  Future addUserAsh(String ashName, String userID) async {
    Map<String, dynamic> json = {
      'name': ashName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .add(json);
  }

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

  Future<List<String>> getUserAshes(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersAshesOfWar')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future addUserTalisman(String talismanName, String userID) async {
    Map<String, dynamic> json = {
      'name': talismanName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance
        .collection('usersTalismans')
        .add(json);
  }

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

  Future<List<String>> getUserTalismans(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTalismans')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<List<Tear>?> getAllTears(bool isDlc) async {
    String tableName = isDlc ? 'allSOTETears' : 'allMainGameTears';
    if (isDlc) {
      return allSOTETears();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
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

  Future addUserTear(String tearName, String userID) async {
    Map<String, dynamic> json = {
      'name': tearName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance.collection('usersTears').add(json);
  }

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

  Future<List<String>> getUserTears(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usersTears')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<List<Armor>?> getAllArmors(bool isDlc) async {
    String tableName = isDlc ? 'allSOTEArmors' : 'allMainGameArmors';
    if (!isDlc) {
      return allArmors();
    } else if (isDlc) {
      return allSOTEArmors();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
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

  Future addUserArmor(String armorName, String userID) async {
    Map<String, dynamic> json = {
      'name': armorName,
      'userID': userID,
    };
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
    String tableName =
        isDlc ? 'allSOTEIncantations' : 'allMainGameIncantations';
    if (!isDlc) {
      return allIncantations();
    } else if (isDlc) {
      return allSOTEIncantations();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
    List<Incantation> incants = [];
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Incantation incant =
            Incantation.fromMap(doc.data() as Map<String, dynamic>?);
        incants.add(incant);
      }
    }
    return incants;
  }

  Future addUserIncantation(String incantName, String userID) async {
    Map<String, dynamic> json = {
      'name': incantName,
      'userID': userID,
    };
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
    } else if (isDlc) {
      return allSOTESorceries();
    }
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(tableName).get();
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
    Map<String, dynamic> json = {
      'name': sorcName,
      'userID': userID,
    };
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
    //await storeAllMainGameTalismans();
    //await storeAllMainGameArmors();
    //await storeAllSOTEArmors();
    //await storeAllSOTETears();
    //await storeAllMainGameIncantations();
    //await storeAllSOTEIncantations();
    //await storeAllMainGameSorceries();
    //await storeAllSOTESorceries();
  }

  Future<void> storeAllMainGameWeapons() async {
    List<Weapon> weapons = allWeapons();
    for (Weapon weapon in weapons) {
      await FirebaseFirestore.instance
          .collection('allMainGameWeapons')
          .add(weapon.toMap());
    }
  }

  Future<void> storeAllMainGameTalismans() async {
    List<Talisman> tals = allTalismans();
    for (Talisman tal in tals) {
      await FirebaseFirestore.instance
          .collection('allMainGameTalismans')
          .add(tal.toMap());
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

  Future<void> storeAllSOTEIncantations() async {
    List<Incantation> incants = allSOTEIncantations();
    for (Incantation incant in incants) {
      await FirebaseFirestore.instance
          .collection('allSOTEIncantations')
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

  Future<void> storeAllSOTESorceries() async {
    List<Sorcery> sorceries = allSOTESorceries();
    for (Sorcery sorc in sorceries) {
      await FirebaseFirestore.instance
          .collection('allSOTESorceries')
          .add(sorc.toMap());
    }
  }
}
