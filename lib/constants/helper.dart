import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'constant.dart' as cons;

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
        return 'Axe';
      case cons.WeaponCategory.backhand_blade:
        return 'Backhand Blade';
      case cons.WeaponCategory.ballista:
        return 'Ballista';
      case cons.WeaponCategory.beast_claw:
        return 'Beast Claw';
      case cons.WeaponCategory.bow:
        return 'Bow';
      case cons.WeaponCategory.crossbow:
        return 'Crossbow';
      case cons.WeaponCategory.claw:
        return 'Claw';
      case cons.WeaponCategory.colossal_sword:
        return 'Colossal Sword';
      case cons.WeaponCategory.colossal_weapon:
        return 'Colossal Weapon';
      case cons.WeaponCategory.curved_greatsword:
        return 'Curved Greatsword';
      case cons.WeaponCategory.curved_sword:
        return 'Curved Sword';
      case cons.WeaponCategory.dagger:
        return 'Dagger';
      case cons.WeaponCategory.fist:
        return 'Fist';
      case cons.WeaponCategory.flail:
        return 'Flail';
      case cons.WeaponCategory.glintstone_staff:
        return 'Glintstone Staff';
      case cons.WeaponCategory.greataxe:
        return 'Great Axe';
      case cons.WeaponCategory.great_bow:
        return 'Great Bow';
      case cons.WeaponCategory.great_hammer:
        return 'Great Hammer';
      case cons.WeaponCategory.great_katana:
        return 'Great Katana';
      case cons.WeaponCategory.great_spear:
        return 'Great Spear';
      case cons.WeaponCategory.greatshield:
        return 'Greatshield';
      case cons.WeaponCategory.greatsword:
        return 'Greatsword';
      case cons.WeaponCategory.halberd:
        return 'Hallberd';
      case cons.WeaponCategory.hammer:
        return 'Hammer';
      case cons.WeaponCategory.hand_to_hand_art:
        return 'Hand to Hand Art';
      case cons.WeaponCategory.heavy_thrusting_sword:
        return 'Heavy Thrusting Sword';
      case cons.WeaponCategory.katana:
        return 'Katana';
      case cons.WeaponCategory.light_bow:
        return 'Light Bow';
      case cons.WeaponCategory.light_greatsword:
        return 'Light Greatsword';
      case cons.WeaponCategory.medium_shield:
        return 'Medium Shield';
      case cons.WeaponCategory.perfume_bottle:
        return 'Perfume Bottle';
      case cons.WeaponCategory.reaper:
        return 'Reaper';
      case cons.WeaponCategory.sacred_seal:
        return 'Sacred Seal';
      case cons.WeaponCategory.small_shield:
        return 'Small Shield';
      case cons.WeaponCategory.spear:
        return 'Spear';
      case cons.WeaponCategory.straight_sword:
        return 'Straight Sword';
      case cons.WeaponCategory.throwing_blade:
        return 'Throwing Blade';
      case cons.WeaponCategory.thrusting_shield:
        return 'Thrusting Shield';
      case cons.WeaponCategory.thrusting_sword:
        return 'Thrusting Sword';
      case cons.WeaponCategory.torch:
        return 'Torch';
      case cons.WeaponCategory.twinblade:
        return 'Twinblade';
      case cons.WeaponCategory.whip:
        return 'Whip';
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
}