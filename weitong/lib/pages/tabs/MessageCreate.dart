import 'package:flutter/material.dart';

class MessageCreate extends StatefulWidget {
  MessageCreate({Key key}) : super(key: key);

  @override
  _MessageCreateState createState() => _MessageCreateState();
}

class _MessageCreateState extends State<MessageCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("信息创建界面"));
  }
}
