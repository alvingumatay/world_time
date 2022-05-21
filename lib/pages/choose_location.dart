// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(urli: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urli: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urli: 'Europe/Lisbon', location: 'Lisbon', flag: 'portugal.png'),
    WorldTime(urli: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urli: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urli: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urli: 'America/New_York', location: 'New_York', flag: 'usa.png'),
    WorldTime(urli: 'Asia/Seoul', location: 'Seoul', flag: 'korea.png'),
    WorldTime(urli: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(urli: 'Asia/Manila', location: 'Manila', flag: 'philippines.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //Navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
