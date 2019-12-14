import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime worldTime=WorldTime(location:'Chandigarh',flag: 'null',url: 'Asia/Kolkata');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'isDayTime':worldTime.isDayTime,
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
      backgroundColor: Colors.redAccent,
      body: Center(
          child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
      ),
    );
  }
}
