class FavDayLast {
  late int message;
  late List<Listd> list;

  FavDayLast.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    list = List.from(json['list']).map((e) => Listd.fromJson(e)).toList();
  }
}

class Listd {
  late  Main main;
  late  String dtTxt;

  Listd.fromJson(Map<String, dynamic> json) {
    main = Main.fromJson(json['main']);
    dtTxt = json['dt_txt'];
  }
}

class Main {
  late dynamic temp;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }
}
