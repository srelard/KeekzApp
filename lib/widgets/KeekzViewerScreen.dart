import 'package:flutter/material.dart';

class KeekzViewerScreen extends StatefulWidget {
  final String tag;

  const KeekzViewerScreen({Key key, @required this.tag}) : super(key: key);
  @override
  _KeekzViewerScreenState createState() => _KeekzViewerScreenState(tag);
}

class _KeekzViewerScreenState extends State<KeekzViewerScreen> {
  final String tag;

  _KeekzViewerScreenState(this.tag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          Hero(tag: tag, child: Center(child: Container(child: Text("Hello")))),
    );
  }
}
