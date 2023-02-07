import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    routes: {
      "/myresult": (context) => const PageForResult()
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "No result";
  
  Future<void> _navigate(BuildContext context) async {
    var myResult = await Navigator.pushNamed(context, '/myresult');
    setState(() {
      result = myResult.toString();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(child: Text(result),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigate(context),
        tooltip: 'Update text',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class PageForResult extends StatelessWidget {
  const PageForResult({Key? key}) : super(key: key);
  
  void _back(BuildContext context) {
    Navigator.pop(context, "Meu primeiro for result com flutter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Press the fab to send the result"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _back(context),
        tooltip: 'Update text',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
