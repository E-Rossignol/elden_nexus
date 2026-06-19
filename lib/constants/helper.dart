import 'dart:math';
import 'dart:ui';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'constant.dart' as cons;
import 'package:connectivity_plus/connectivity_plus.dart';

/// General helper utilities used across the app.
class Helper {
  /// Generate a random alphanumeric string of given length.
  ///
  /// @param length Number of characters to generate.
  /// @return String random alphanumeric string.
  static String generateRandomAlphanumeric(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  /// Convert WeaponCategory enum to localized display string.
  ///
  /// @param category WeaponCategory enum.
  /// @return String localized category name.
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

  /// Initialize helper persistent values (id, token).
  ///
  /// @return Future<void>
  static Future<void> init() async {
    await setId();
    await setToken();
  }

  /// Create a stored id if one does not exist.
  ///
  /// This function reads device id and encrypts it before storing.
  ///
  /// @return Future<void>
  static Future<void> setId() async {
    const storage = FlutterSecureStorage();
    String id = await storage.read(key: 'id') ?? '';
    if (id.isNotEmpty) {
      return Future.value();
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // Encrypt the device id using AES with fixed key/iv from original code.
    await storage.write(
        key: 'id',
        value: encrypt.Encrypter(
                encrypt.AES(encrypt.Key.fromUtf8('thisIsASecretKey')))
            .encrypt(androidInfo.id,
                iv: encrypt.IV.fromUtf8('thisIsAnIVForAES'))
            .base64);
  }

  /// Ensure a token is stored in secure storage.
  ///
  /// @return Future<void>
  static Future<void> setToken() async {
    const storage = FlutterSecureStorage();
    String token = await storage.read(key: 'token') ?? '';
    if (token.isNotEmpty) {
      return Future.value();
    }
    await storage.write(key: 'token', value: cons.token);
  }

  /// Check if internet is available via connectivity_plus.
  ///
  /// @return Future<bool> true if connected via wifi or mobile.
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

  /// Darken a color by reducing lightness in HSL space.
  ///
  /// @param color Color to darken.
  /// @param amount Amount to decrease lightness (0.0 - 1.0).
  /// @return Color darkened color.
  static Color darkenColor(Color color, [double amount = .08]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (hsl.lightness <= amount) ? 0.0 : hsl.lightness - amount);

    return hslDark.toColor();
  }
}
