import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../constants/helper.dart';

class DatabaseMethods {
  // Methods for weapons
  Future addUserWeapon(String weaponName, String userID) async {
    Map<String, dynamic> json = {
      'name': weaponName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance.collection('weapons').add(json);
  }

  Future removeUserWeapon(String weaponName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('weapons')
        .where('name', isEqualTo: weaponName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('weapons')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  Future<List<String>> getUserWeapons(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('weapons')
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
      Helper.snackbar('No changes', 'No changes were made');
      return;
    }
    for (String weaponName in newlyFoundWeapons) {
      await addUserWeapon(weaponName, userID);
    }
    for (String weaponName in removedFromListWeapons) {
      await removeUserWeapon(weaponName, userID);
    }
    Helper.snackbar('Success', 'Changes were saved');
  }

  // Methods for ashes of war
  Future addUserAsh(String ashName, String userID) async {
    Map<String, dynamic> json = {
      'name': ashName,
      'userID': userID,
    };
    return await FirebaseFirestore.instance.collection('ashesOfWar').add(json);
  }

  Future removeUserAsh(String ashName, String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ashesOfWar')
        .where('name', isEqualTo: ashName)
        .where('userID', isEqualTo: userID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('ashesOfWar')
          .doc(querySnapshot.docs.first.id)
          .delete();
    }
  }

  Future<List<String>> getUserAshes(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ashesOfWar')
        .where('userID', isEqualTo: userID)
        .get();
    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<void> saveUserAshes(List<String> ashNames, String userID) async {
    List<String> userFoundAshes = await getUserAshes(userID);
    List<String> newlyFoundAshes =
        ashNames.where((item) => !userFoundAshes.contains(item)).toList();
    List<String> removedFromListAshes =
        userFoundAshes.where((item) => !ashNames.contains(item)).toList();
    if (newlyFoundAshes.isEmpty && removedFromListAshes.isEmpty) {
      Helper.snackbar('No changes', 'No changes were made');
      return;
    }
    for (String ashName in newlyFoundAshes) {
      await addUserAsh(ashName, userID);
    }
    for (String ashName in removedFromListAshes) {
      await removeUserAsh(ashName, userID);
    }
    Helper.snackbar('Success', 'Changes were saved');
  }
}
