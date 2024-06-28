import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/27/2024, Thursday

final userCurrentChapterIndexProvider = StateProvider((ref) => 0);

class LocalRepository {
  static const String userCurrentChapterIndex = 'userCurrentChapterIndex';
  static const String userName = 'userName';
  static const String isFirstTimeInstalled = 'isFirstTimeInstalled';

  static Future<void> saveInteger(String key, int value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setInt(key, value);
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
    }
  }

  static Future<int> fetchInteger(String key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      return preferences.getInt(key) ?? 0;
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
      return 0;
    }
  }

  static Future<void> saveBoolean(String key, bool value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setBool(key, value);
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
    }
  }

  static Future<bool> fetchBoolean(String key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      return preferences.getBool(key) ?? true;
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
      return true;
    }
  }

  static Future<void> saveString(String key, String value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(key, value);
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
    }
  }

  static Future<String> fetchString(String key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      return preferences.getString(key) ?? '';
    } catch (e) {
      debugPrint("Error while saving Text using SharedPreferences");
      return '';
    }
  }
}
