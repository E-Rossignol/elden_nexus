import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/helper.dart';

class DatabaseMethods {

  Future addUserObject(String foundItemName, String userID) async {
    Map<String, dynamic> json = {
      'name': foundItemName,
      'userID': userID,
    };
    return await FirebaseFirestore
        .instance
        .collection('foundObjects')
        .add(json);
  }

  Future removeUserObject(String objectName, String userID) async {
    return await FirebaseFirestore
        .instance
        .collection('foundObjects')
        .doc(objectName)
        .delete();
  }

  Future<List<String>> getUserWeapons(String userID) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore
        .instance
        .collection('foundObjects')
        .where('userID', isEqualTo: userID)
        .get();

    return querySnapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<void> saveUserWeapons(List<String> weaponNames, String userID) async {
    List<String> userFoundWeapons = await getUserWeapons(userID);
    List<String> newlyFoundWeapons = weaponNames.where((item) => !userFoundWeapons.contains(item)).toList();
    List<String> removedFromListWeapons = userFoundWeapons.where((item) => !weaponNames.contains(item)).toList();
    for (String weaponName in newlyFoundWeapons) {
      Map<String, dynamic> json = {
        'name': weaponName,
        'userID': userID,
      };
      await FirebaseFirestore.instance.collection('foundObjects').add(json);
    }
    for (String weaponName in removedFromListWeapons) {
      await FirebaseFirestore.instance.collection('foundObjects').doc(weaponName).delete();
    }
    Helper.snackbar('Success', 'Weapons saved');
  }
}