library flutter_videocall_sdk;

import 'package:flutter/material.dart';

import 'connect/call_sample.dart';
import 'connect/data_channel_sample.dart';


class FlutterVideoCall extends StatefulWidget{

  final String serverAddress;
  FlutterVideoCall({Key key, @required this.serverAddress}) : super(key: key);
  FlutterVideoCallState createState() => FlutterVideoCallState();
}


class FlutterVideoCallState extends State<FlutterVideoCall>{
  @override
  Widget build(BuildContext context) {
    if(widget.serverAddress.isEmpty){
      return Text('Please Back and Input Server Address');
    }
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused))
                        return Colors.red;
                      return null; // Defer to the widget's default.
                    }
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CallSample(host: widget.serverAddress)));
              },
              child: Text('Call'),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused))
                        return Colors.cyan;
                      return null; // Defer to the widget's default.
                    }
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DataChannelSample(host: widget.serverAddress)));

              },
              child: Text('Data'),
            )
          ],
        ),
      )
    );
  }
}