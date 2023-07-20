import 'package:get_storage/get_storage.dart';

class GetxStorageHelper{
  static late GetStorage getStorage;

  static Future<void> Save({
    required dynamic value,
    required String key,
  }){
    return getStorage.write(key, value);
  }

  static dynamic Get({
    required String key,
  }){
    return getStorage.read(key) ;
  }

  static Future<void> Remove({
    required String key,
  }){
    return getStorage.remove(key);
  }
}