import 'package:flutter/material.dart';
class ListScrn extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListScrn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("list scrn>>>>"),
      ),
      body: Center(child: Text("HELLOOO page 4"),),
    );

  }
}
