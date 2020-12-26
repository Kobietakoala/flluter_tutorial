import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String locationTime = 'Loading..';

  void setupWorldTime() async{
    WorldTime wt = WorldTime(location: 'Berlin', flag: 'germany.png', time: 'Europe/Berlin');
    await wt.getTime();
    setState(() {
      locationTime = wt.time;
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(locationTime),
      )
    );
  }
}
