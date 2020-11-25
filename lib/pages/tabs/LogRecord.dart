import 'package:flutter/material.dart';

class LogRecordPage extends StatefulWidget {
  LogRecordPage({Key key}) : super(key: key);

  @override
  _LogRecordPageState createState() => _LogRecordPageState();
}

class _LogRecordPageState extends State<LogRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Text("日志、草稿"),
    ));
  }
}
