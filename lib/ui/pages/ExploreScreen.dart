import 'package:flutter/material.dart';
class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("explore  scrn>>>>"),
      ),
      body: Center(child: Text("HELLOOO page 3"),),
    );

  }
}
