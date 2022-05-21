//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: Loading()));
}

class WorldTime {
  String location;
  String time = "";
  String flag;
  String urli;
  WorldTime({required this.location, required this.flag, required this.urli});
  Future<void> getTime() async {
    var url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Singapore');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    //print (datetime);
    //print (offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    time = now.toString();
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading......';

  void setupWorldTime() async {
    var instance = WorldTime(
        location: 'Manila', flag: 'philippines.png', urli: 'Asia/Manila');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(time),
    );
  }
}
