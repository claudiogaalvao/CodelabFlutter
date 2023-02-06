import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    routes: {
      '/chocolate': (context) => const MyFavoriteFood(title: "Chocolate"),
      '/icecream': (context) => const MyFavoriteFood(title: "Ice cream"),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _navigate(BuildContext context) {
    Navigator.pushNamed(context, '/chocolate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: const Center(child: Text("A simple home page"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigate(context),
        tooltip: 'Update Text',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class MyFavoriteFood extends StatefulWidget {
  const MyFavoriteFood({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyFavoriteFood> createState() => _MyFavoriteFoodState();
}

class _MyFavoriteFoodState extends State<MyFavoriteFood> {
  // Default placeholder text
  String textToShow = "";

  @override
  void initState() {
    textToShow = "I like ${widget.title}";
    super.initState();
  }

  void _navigate() {
    String nextRoute = widget.title.toUpperCase() == "CHOCOLATE" ? "/icecream" : "/chocolate";
    Navigator.pushNamed(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite food'),
      ),
      body: Center(child: Text(textToShow),),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        tooltip: 'Update Text',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
