import 'package:flutter/material.dart';
import 'LogRecord.dart';
import 'MessageCreate.dart';
import 'User.dart';
import 'Message.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pagelist = [MessagePage(), MessageCreate(), LogRecordPage(), User()];
  // List _pagelist = [Message(), MessageCreate(), LogRecord(), User()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微通"),
      ),
      body: this._pagelist[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.textsms), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.create), title: Text("创建")),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), title: Text("草稿")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的"))
        ],
      ),
    );
  }
}
