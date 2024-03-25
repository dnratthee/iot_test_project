import 'package:localstorage/localstorage.dart';

class Store {
  static LocalStorage storage = LocalStorage('iot_test_project');

  static Future<void> init() async {
    await storage.ready;
  }

  static Future<void> set(String key, dynamic value) async {
    await storage.ready;
    await storage.setItem(key, value);
  }

  static Map<String, dynamic>? get(String key) {
    try {
      return storage.getItem(key);
    } catch (e) {
      return null;
    }
  }

  static String getValue(String contain, String key) {
    try {
      return storage.getItem(contain)[key];
    } catch (e) {
      return '';
    }
  }

  static Future<void> delete(String key) async {
    await storage.ready;
    storage.deleteItem(key);
  }

  static Future<void> clear() async {
    await storage.ready;
    storage.clear();
  }

  static bool has(String key) {
    return storage.getItem(key) != null;
  }
}
