import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'constant.dart' as cons;
import 'package:connectivity/connectivity.dart';

class Helper {
  static String generateRandomAlphanumeric(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static String strCat(cons.WeaponCategory category) {
    switch (category) {
      case cons.WeaponCategory.axe:
        return 'Axe'.tr;
      case cons.WeaponCategory.backhand_blade:
        return 'Backhand Blade'.tr;
      case cons.WeaponCategory.ballista:
        return 'Ballista'.tr;
      case cons.WeaponCategory.beast_claw:
        return 'Beast Claw'.tr;
      case cons.WeaponCategory.bow:
        return 'Bow'.tr;
      case cons.WeaponCategory.crossbow:
        return 'Crossbow'.tr;
      case cons.WeaponCategory.claw:
        return 'Claw'.tr;
      case cons.WeaponCategory.colossal_sword:
        return 'Colossal Sword'.tr;
      case cons.WeaponCategory.colossal_weapon:
        return 'Colossal Weapon'.tr;
      case cons.WeaponCategory.curved_greatsword:
        return 'Curved Greatsword'.tr;
      case cons.WeaponCategory.curved_sword:
        return 'Curved Sword'.tr;
      case cons.WeaponCategory.dagger:
        return 'Dagger'.tr;
      case cons.WeaponCategory.fist:
        return 'Fist'.tr;
      case cons.WeaponCategory.flail:
        return 'Flail'.tr;
      case cons.WeaponCategory.glintstone_staff:
        return 'Glintstone Staff'.tr;
      case cons.WeaponCategory.greataxe:
        return 'Great Axe'.tr;
      case cons.WeaponCategory.great_bow:
        return 'Great Bow'.tr;
      case cons.WeaponCategory.great_hammer:
        return 'Great Hammer'.tr;
      case cons.WeaponCategory.great_katana:
        return 'Great Katana'.tr;
      case cons.WeaponCategory.great_spear:
        return 'Great Spear'.tr;
      case cons.WeaponCategory.greatshield:
        return 'Greatshield'.tr;
      case cons.WeaponCategory.greatsword:
        return 'Greatsword'.tr;
      case cons.WeaponCategory.halberd:
        return 'Halberd'.tr;
      case cons.WeaponCategory.hammer:
        return 'Hammer'.tr;
      case cons.WeaponCategory.hand_to_hand_art:
        return 'Hand to Hand Art'.tr;
      case cons.WeaponCategory.heavy_thrusting_sword:
        return 'Heavy Thrusting Sword'.tr;
      case cons.WeaponCategory.katana:
        return 'Katana'.tr;
      case cons.WeaponCategory.light_bow:
        return 'Light Bow'.tr;
      case cons.WeaponCategory.light_greatsword:
        return 'Light Greatsword'.tr;
      case cons.WeaponCategory.medium_shield:
        return 'Medium Shield'.tr;
      case cons.WeaponCategory.perfume_bottle:
        return 'Perfume Bottle'.tr;
      case cons.WeaponCategory.reaper:
        return 'Reaper'.tr;
      case cons.WeaponCategory.sacred_seal:
        return 'Sacred Seal'.tr;
      case cons.WeaponCategory.small_shield:
        return 'Small Shield'.tr;
      case cons.WeaponCategory.spear:
        return 'Spear'.tr;
      case cons.WeaponCategory.straight_sword:
        return 'Straight Sword'.tr;
      case cons.WeaponCategory.throwing_blade:
        return 'Throwing Blade'.tr;
      case cons.WeaponCategory.thrusting_shield:
        return 'Thrusting Shield'.tr;
      case cons.WeaponCategory.thrusting_sword:
        return 'Thrusting Sword'.tr;
      case cons.WeaponCategory.torch:
        return 'Torch'.tr;
      case cons.WeaponCategory.twinblade:
        return 'Twinblade'.tr;
      case cons.WeaponCategory.whip:
        return 'Whip'.tr;
    }
  }

  static Future<void> init() async {
    await setId();
    await setToken();
  }

  static Future<void> setId() async {
    const storage = FlutterSecureStorage();
    String id = await storage.read(key: 'id') ?? '';
    if (id.isNotEmpty) {
      return Future.value();
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    await storage.write(
        key: 'id',
        value: encrypt.Encrypter(
                encrypt.AES(encrypt.Key.fromUtf8('thisIsASecretKey')))
            .encrypt(androidInfo.id,
                iv: encrypt.IV.fromUtf8('thisIsAnIVForAES'))
            .base64);
  }

  static Future<void> setToken() async {
    const storage = FlutterSecureStorage();
    String token = await storage.read(key: 'token') ?? '';
    if (token.isNotEmpty) {
      return Future.value();
    }
    await storage.write(key: 'token', value: cons.token);
  }

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
