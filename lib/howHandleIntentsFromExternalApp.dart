/*
* After register the intent on AndroidManifest on android native side
* Then, configure the Activity on android native side, to get handle the event
* and send to Flutter.
* Then follow the code bellow:
*  */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntentHandlerPage extends StatefulWidget {
  const IntentHandlerPage({Key? key}) : super(key: key);

  @override
  State<IntentHandlerPage> createState() => _IntentHandlerPageState();
}

class _IntentHandlerPageState extends State<IntentHandlerPage> {
  static const platform = MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  @override
  void initState() {
    getSharedText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(dataShared),),);
  }

  Future<void> getSharedText() async {
    var sharedData = await platform.invokeMethod('getSharedText');
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
