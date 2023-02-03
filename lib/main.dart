import 'package:codelab_flutter/howAddOrRemoveComponent.dart';
import 'package:codelab_flutter/counter.dart';
import 'package:codelab_flutter/howAnimateWidget.dart';
import 'package:codelab_flutter/howUpdateWidgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HowAnimateWidget(),
    );
  }
}
