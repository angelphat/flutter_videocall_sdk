# flutter_videocall_sdk

A SDK support for video call and send data

##Usage
[Exampe] (https://github.com/angelphat/flutter_videocall_sdk/tree/master/example/videotest.dart) 



,,,yaml
    dependencies:
      flutter:
        sdk: flutter
      cupertino_icons: ^1.0.0
      flutter_webrtc: ^0.5.8
      shared_preferences: ^2.0.0
      http: ^0.13.0
      path_provider: ^2.0.0
      flutter_videocall_sdk:
,,,

## Add to your dart file
 ,,,dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_videocall_sdk/flutter_videocall_sdk.dart';
void main() => runApp(new VideoTest());

class VideoTest extends StatefulWidget{
  _VideoTestState createState() => _VideoTestState();
}

class _VideoTestState extends State<VideoTest>{
  String _address;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call Example Test'),
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.connect_without_contact),
                hintText: 'Type address of your server',
                labelText: 'Server Address',
              ),
              onFieldSubmitted: (String textInput){
                  _address = textInput;
              },
              validator:(String value){
                return (value != null && value.isEmpty) ? 'Please input your server Address' : null;
              },
            ),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.02);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blueGrey;
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  if(_address.isEmpty){
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => FlutterVideoCall(serverAddress: _address)));
                },
                child: Text('Connect')
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 ,,,

## getting start
To use this package: *add the depency to your [pubspec.yaml] file
This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
