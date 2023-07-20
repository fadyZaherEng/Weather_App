class Wind {
    dynamic deg;
    dynamic gust;
    dynamic speed;

    Wind({this.deg, this.gust, this.speed});

    factory Wind.fromJson(Map<String, dynamic> json) {
        return Wind(
            deg: json['deg'], 
            gust: json['gust'], 
            speed: json['speed'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['deg'] = this.deg;
        data['gust'] = this.gust;
        data['speed'] = this.speed;
        return data;
    }
}