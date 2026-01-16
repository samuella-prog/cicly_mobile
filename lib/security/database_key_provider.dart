import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DatabaseKeyProvider {
  DatabaseKeyProvider._();

  static const String _keyName = 'cicly_db_key';
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Retrieves the encryption key, generating and storing a new one if it does not exist.
  static Future<String> getOrCreateKey() async {
    final existingKey = await _storage.read(key: _keyName);
    if (existingKey != null) {
      return existingKey;
    }

    final newKey = _generateRandomKey(32); // 32 chars ~ 256 bits.
    await _storage.write(key: _keyName, value: newKey);
    return newKey;
  }

  /// Deletes the stored key.
  /// Note: The encrypted database will no longer be readable after this,
  /// so  should also delete the corresponding database file.
  static Future<void> deleteKey() async {
    await _storage.delete(key: _keyName);
  }

  /// Generates a random alphanumeric key of the given [length].
  static String _generateRandomKey(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();
    return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}
