import 'package:weather_app/models/weather_within_5days/City.dart';
import 'package:weather_app/models/weather_within_5days/X.dart';

class WeatherWithinLast5Days {
    City? city;
    dynamic cnt;
    dynamic cod;
    List<X>? list;
    dynamic message;

    WeatherWithinLast5Days({this.city, this.cnt, this.cod, this.list, this.message});

    factory WeatherWithinLast5Days.fromJson(Map<String, dynamic> json) {
        return WeatherWithinLast5Days(
            city: json['city'] != null ? City.fromJson(json['city']) : null, 
            cnt: json['cnt'], 
            cod: json['cod'], 
            list: json['list'] != null ? (json['list'] as List).map((i) => X.fromJson(i)).toList() : null, 
            message: json['message'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cnt'] = this.cnt;
        data['cod'] = this.cod;
        data['message'] = this.message;
        if (this.city != null) {
            data['city'] = this.city!.toJson();
        }
        if (this.list != null) {
            data['list'] = this.list!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}