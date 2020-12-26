import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;  // lokalizacja dla UI
  String time;  // aktualny czas dla lokalizacji
  String flag;  // url do assets flag icons
  String url;  // adres url do api
  bool isDayTime; // true - day

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async{
    try {
      Response response = await get(
          'https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch (e){
      time = "Could not get time data";
    }

  }
}