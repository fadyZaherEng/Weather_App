import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

class Services extends GetxService{
  Future<Services>  AppServices()async{
    await DioHelper.Init();
    await GetStorage.init();
    return this;
  }
}