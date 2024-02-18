import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///Secure storage utils common class
class  SecureStorageUtils{
  ///Secure storage instance
  final FlutterSecureStorage storage = const FlutterSecureStorage();

///Method for write new data
  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }
///Method for read existing data
  readSecureData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found!';
    debugPrint('Data read from secure storage: $value');
  }
///Method for delete data
  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

}