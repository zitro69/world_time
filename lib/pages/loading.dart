import 'package:flutter/material.dart';
import 'package:world_time/servicies/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime worldTime = new WorldTime(location: "Berlin", flag:"germany.png", url:"Europe/Berlin");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDaytime": worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
