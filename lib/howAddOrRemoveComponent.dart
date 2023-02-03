import 'package:flutter/material.dart';

class HowAddOrRemoveComponent extends StatefulWidget {
  const HowAddOrRemoveComponent({super.key});

  @override
  State<HowAddOrRemoveComponent> createState() => _HowAddOrRemoveComponent();
}

class _HowAddOrRemoveComponent extends State<HowAddOrRemoveComponent> {
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return const Text('Toggle One');
    } else {
      return ElevatedButton(onPressed: () {}, child: const Text('Toggle Two'),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How Add Or Remove Component'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }

}