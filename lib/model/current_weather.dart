class CurrentWeatherModel {
 late Coord coord;
 late List<Weather> weather;
 late Main main;
 late Wind wind;
 late Clouds clouds;
 late  Sys sys;
 late String base;
 late dynamic visibility;
 late dynamic dt;
 late dynamic timezone;
 late dynamic id;
 late String name;
 late dynamic cod;
  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    main = Main.fromJson(json['main']);
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    sys = Sys.fromJson(json['sys']);
    base = json['base'];
    visibility = json['visibility'];
    dt = json['dt'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  late double lon;
  late double lat;
  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

class Weather {
  late dynamic id;
  late String main;
  late String description;
  late String icon;

  Weather(this.id, this.main, this.description, this.icon);
  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late dynamic pressure;
  late dynamic humidity;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  late double speed;
  late dynamic deg; // dynamic

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class Clouds {
  late dynamic all; // double

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  late dynamic type;
  late dynamic id;
  late String country;
  late dynamic sunrise;
  late dynamic sunset;
  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
