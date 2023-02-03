import 'package:flutter/material.dart';

class HowUpdateWidgets extends StatefulWidget {
  const HowUpdateWidgets({super.key});

  @override
  State<HowUpdateWidgets> createState() => _HowUpdateWidgets();
}

class _HowUpdateWidgets extends State<HowUpdateWidgets> {
  // Default placeholder text
  String textToShow = "I like FLutter";

  void _updateText() {
    setState(() {
      textToShow = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }

}