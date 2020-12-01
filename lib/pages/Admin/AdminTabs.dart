import 'package:flutter/material.dart';
import 'StaffManage.dart';
import 'DepartmentManage.dart';

class AdminTabs extends StatefulWidget {
  AdminTabs({Key key}) : super(key: key);

  @override
  _AdminTabsState createState() => _AdminTabsState();
}

class _AdminTabsState extends State<AdminTabs> {
  int _currentIndex = 0;
  List _pagelist = [StaffManagePage(), DepartmentManagePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("微通"),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          // _cleanToken();
        },
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
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.library_books), title: Text("草稿")),
          // BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的"))
        ],
      ),
    );
  }
}
