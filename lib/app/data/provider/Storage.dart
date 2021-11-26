import "package:flutter_secure_storage/flutter_secure_storage.dart";

class SensitiveStorage {

  static final SensitiveStorage _storage = SensitiveStorage._privateConstructor();

  // Create storage
  final storage = FlutterSecureStorage();

  factory SensitiveStorage() {
    return _storage;
  }

  SensitiveStorage._privateConstructor();

  Future<String> readValue(String key) async {
    // Read value
    String? value = await storage.read(key: key);

    return value ?? "-1";
  }

  Future<Map<String, String>> readAllValues() async {
    // Read all values
    Map<String, String> allValues = await storage.readAll();

    return allValues;
  }

  Future<void> deleteValue(String key) async {
    // Delete value
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    // Delete all
    await storage.deleteAll();
  }

  Future<void> writeValue(String key, String value) async {
    // Write value
    await storage.write(key: key, value: value);
  }
}
