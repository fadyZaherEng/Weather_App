import 'package:weather_app/models/weather_within_5days/Coord.dart';

class City {
    Coord? coord;
    dynamic country;
    dynamic id;
    dynamic name;
    dynamic population;
    dynamic sunrise;
    dynamic sunset;
    dynamic timezone;

    City({this.coord, this.country, this.id, this.name, this.population, this.sunrise, this.sunset, this.timezone});

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
            coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null, 
            country: json['country'], 
            id: json['id'], 
            name: json['name'], 
            population: json['population'], 
            sunrise: json['sunrise'], 
            sunset: json['sunset'], 
            timezone: json['timezone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['id'] = this.id;
        data['name'] = this.name;
        data['population'] = this.population;
        data['sunrise'] = this.sunrise;
        data['sunset'] = this.sunset;
        data['timezone'] = this.timezone;
        if (this.coord != null) {
            data['coord'] = this.coord!.toJson();
        }
        return data;
    }
}