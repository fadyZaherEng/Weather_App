import 'package:weather_app/models/weather_within_5days/Clouds.dart';
import 'package:weather_app/models/weather_within_5days/Main.dart';
import 'package:weather_app/models/weather_within_5days/Sys.dart';
import 'package:weather_app/models/weather_within_5days/Weather.dart';
import 'package:weather_app/models/weather_within_5days/Wind.dart';

class X {
    Clouds? clouds;
   dynamic dt;
    dynamic dt_txt;
    Main ?main;
   dynamic pop;
    Sys ?sys;
    dynamic visibility;
    List<Weather>? weather;
    Wind? wind;

    X({this.clouds, this.dt, this.dt_txt, this.main, this.pop, this.sys, this.visibility, this.weather, this.wind});

    factory X.fromJson(Map<String, dynamic> json) {
        return X(
            clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null, 
            dt: json['dt'], 
            dt_txt: json['dt_txt'], 
            main: json['main'] != null ? Main.fromJson(json['main']) : null, 
            pop: json['pop'], 
            sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null, 
            visibility: json['visibility'], 
            weather: json['weather'] != null ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList() : null, 
            wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dt'] = this.dt;
        data['dt_txt'] = this.dt_txt;
        data['pop'] = this.pop;
        data['visibility'] = this.visibility;
        if (this.clouds != null) {
            data['clouds'] = this.clouds!.toJson();
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