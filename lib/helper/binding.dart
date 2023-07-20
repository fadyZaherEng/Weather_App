import 'package:get/get.dart';
import 'package:weather_app/layout/home_screen/weather_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WeatherController(),permanent: true);
  }

}