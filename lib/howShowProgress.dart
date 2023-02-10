import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HowShowProgress extends StatefulWidget {
  const HowShowProgress({Key? key}) : super(key: key);

  @override
  State<HowShowProgress> createState() => _HowShowProgressState();
}

class _HowShowProgressState extends State<HowShowProgress> {
  List widgets = [];
  
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Widget getBody() {
    bool showLoadingDialog = widgets.isEmpty;
    if (showLoadingDialog) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  Widget getProgressDialog() {
    return const Center(child: CircularProgressIndicator(),);
  }

  ListView getListView() {
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, position) {
          return getRow(position);
        },
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Progress'),
      ),
      body: getBody(),
    );
  }
  
  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
