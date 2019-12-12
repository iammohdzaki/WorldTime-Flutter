import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime worldTime=WorldTime(location:'Berlin',flag: 'null',url: 'Asia/Kolkata');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
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
      body: Center(child: Text('Loading...')),
    );
  }
}
