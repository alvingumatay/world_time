//ignore_for_file:unused_import
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String urli;
  bool? isDayTime;

  WorldTime({required this.location, required this.flag, required this.urli});
  Future<void> getTime() async {
    try {
      // make a request
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$urli');
      var response = await http.get(url);
      Map data = jsonDecode(response.body) as Map<dynamic, dynamic>;

      //print (data);
      //get the properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);
      //create date time object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      //set the time property
      //time = now.toString();
      //isDayTime = condition2 ? true : false;
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get the time data';
    }
  }
}
