import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RunningIOOperation extends StatefulWidget {
  const RunningIOOperation({Key? key}) : super(key: key);

  @override
  State<RunningIOOperation> createState() => _RunningIOOperationState();
}

class _RunningIOOperationState extends State<RunningIOOperation> {
  List widgets = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample app'),
      ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (context, position) {
            return getRow(position);
          }
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
