import 'package:weather_app/models/weather_now/Clouds.dart';
import 'package:weather_app/models/weather_now/Coord.dart';
import 'package:weather_app/models/weather_now/Main.dart';
import 'package:weather_app/models/weather_now/Sys.dart';
import 'package:weather_app/models/weather_now/Weather.dart';
import 'package:weather_app/models/weather_now/Wind.dart';

class WeatherNowResponse {
  dynamic base;
  Clouds? clouds;
  dynamic cod;
  Coord? coord;
  dynamic dt;
  dynamic id;
  Main? main;
  dynamic name;
  Sys? sys;
  dynamic timezone;
  dynamic visibility;
  List<Weather>? weather;
  Wind? wind;

  WeatherNowResponse(
      {required this.base,
      required this.clouds,
      required this.cod,
      required this.coord,
      required this.dt,
      required this.id,
      required this.main,
      required this.name,
      required this.sys,
      required this.timezone,
      required this.visibility,
      required this.weather,
      required this.wind});

  factory WeatherNowResponse.fromJson(Map<String, dynamic> json) {
    return WeatherNowResponse(
      base: json['base'],
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      cod: json['cod'],
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      dt: json['dt'],
      id: json['id'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      name: json['name'],
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      visibility: json['visibility'],
      weather: json['weather'] != null
          ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList()
          : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['cod'] = this.cod;
    data['dt'] = this.dt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['timezone'] = this.timezone;
    data['visibility'] = this.visibility;
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    return data;
  }
}
