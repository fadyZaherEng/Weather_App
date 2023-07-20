import 'package:get/get.dart';
import 'package:weather_app/models/weather_now/WeatherNowResponse.dart';
import 'package:weather_app/models/weather_within_5days/WeatherWithinLast5Days.dart';
import 'package:weather_app/models/weather_within_5days/need_class_to_draw_garph_last5days_between_date_temp.dart';
import 'package:weather_app/shared/end_points.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

class WeatherController extends GetxController {
  String city='cairo';
  @override
  void onInit() {
    super.onInit();
    getInitializeWeather();
    getTopFiveCities();
  }

  getInitializeWeather() {
    getWeatherNow();
    getWeatherLast5Days();
    update();
  }

  void updateWeather() {
    getInitializeWeather();
  }

  WeatherNowResponse? weatherNowResponse;
  void getWeatherNow() {
    DioHelper.getData(
      url: End_POINT_WEATHER_NOW,
      query: {'q': city, 'appid': APP_ID},
    ).then((value) {
      weatherNowResponse = WeatherNowResponse.fromJson(value.data);
      print(weatherNowResponse);
      update();
    }).catchError((onError) {
      print("ERORRRRRRRRRRRRR $onError");
      update();
    });
  }

  List<WeatherNowResponse> dataListWeatherNow=[];
  void getTopFiveCities() {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    cities.forEach((city) {
      DioHelper.getData(
        url: End_POINT_WEATHER_NOW,
        query: {'q': city, 'appid': APP_ID},
      ).then((value) {
        dataListWeatherNow.add(WeatherNowResponse.fromJson(value.data));
        update();
      }).catchError((onError) {
        print("ERORRRRRRRRRRRRR 11111$onError");
        update();
      });
    });
  }

  List<FiveDayData> fiveDaysData = [];
  WeatherWithinLast5Days? weatherWithinLast5Days;
  void getWeatherLast5Days() {
    DioHelper.getData(
      url: End_POINT_WEATHER_LAST_5DAYS,
      query: {'q': city, 'appid': APP_ID},
    ).then((value) {
      fiveDaysData=(value.data['list'] as List)
          .map((t) => FiveDayData.fromJson(t))
          .toList();
      weatherWithinLast5Days = WeatherWithinLast5Days.fromJson(value.data);
      print(weatherWithinLast5Days);
      update();
    }).catchError((onError) {
      print("ERORRRRRRRRRRRRR 22222$onError");
      update();
    });
  }

}
