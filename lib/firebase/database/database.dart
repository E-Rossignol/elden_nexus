import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elden_nexus/models/ash_of_war.dart';
import '../../models/weapon.dart';

class DatabaseMethods {
  // Methods for weapons
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

  Future<void> saveUserWeapons(List<String> weaponNames, String userID) async {
    List<String> userFoundWeapons = await getUserWeapons(userID);
    List<String> newlyFoundWeapons =
        weaponNames.where((item) => !userFoundWeapons.contains(item)).toList();
    List<String> removedFromListWeapons =
        userFoundWeapons.where((item) => !weaponNames.contains(item)).toList();
    if (newlyFoundWeapons.isEmpty && removedFromListWeapons.isEmpty) {
      return;
    }
    for (String weaponName in newlyFoundWeapons) {
      await addUserWeapon(weaponName, userID);
    }
    for (String weaponName in removedFromListWeapons) {
      await removeUserWeapon(weaponName, userID);
    }
  }

  // Methods for ashes of war
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

  Future<void> saveUserAshes(List<String> ashNames, String userID) async {
    List<String> userFoundAshes = await getUserAshes(userID);
    for (String ashName
        in ashNames.where((item) => !userFoundAshes.contains(item)).toList()) {
      await addUserAsh(ashName, userID);
    }
    for (String ashName
        in userFoundAshes.where((item) => !ashNames.contains(item)).toList()) {
      await removeUserAsh(ashName, userID);
    }
  }

  Future<List<Weapon>?> getAllSOTEWeapons() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allSOTEWeapons').get();
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

  Future<List<AshOfWar>?> getAllSOTEAow() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allSOTEAOW').get();
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
}
