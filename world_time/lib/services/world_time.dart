import 'package:http/http.dart';
import 'dart:convert';


class WorldTime{

  String location;  // lokalizacja dla UI
  String time;  // aktualny czas dla lokalizacji
  String flag;  // url do assets flag icons
  String url;  // adres url do api

  WorldTime({this.location, this.time, this.flag});

  Future<void> getTime() async{

    Response response = await get('https://worldtimeapi.org/api/timezone/Europe/Berlin');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();


  }
}