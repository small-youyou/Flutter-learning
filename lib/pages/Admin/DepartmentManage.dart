import 'package:flutter/material.dart';
import 'package:weitong/pages/Admin/AddUser.dart';
import 'package:weitong/routers/router.dart';
import 'UsersList.dart';

import 'searchDemo.dart';

List<Map> users = [
  {
    "name": "张三",
    "id": 13411112222,
    "password": 123456,
    "job": "员工",
  },
  {
    "name": "李四",
    "id": 13564621687,
    "password": 123456,
    "job": "员工",
  },
  {
    "name": "王五",
    "id": 13411112222,
    "password": 123456,
    "job": "员工",
  },
  {
    "name": "无无无",
    "id": 13411112222,
    "password": 123456,
    "job": "员工",
  },
  {
    "name": "张三",
    "id": 13411112222,
    "password": 123456,
    "job": "员工",
  },
];

//在这里管理人员详细信息,添加人员
class DepartmentManagePage extends StatefulWidget {
  DepartmentManagePage({Key key}) : super(key: key);

  @override
  _DepartmentManagePageState createState() => _DepartmentManagePageState();
}

class _DepartmentManagePageState extends State<DepartmentManagePage> {
  @override

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("人员信息"),
  //       actions: [
  //         FlatButton(onPressed: _addUser(context), child: Icon(Icons.plus_one)),
  //       ],
  //     ),
  //     body: Scrollbar(
  //         child: SingleChildScrollView(
  //             child: Container(padding: EdgeInsets.all(20), child: Column()))),
  //   );
  // }

  // _addUser(BuildContext context) async {
  //   final newUser = await Navigator.pushNamed(context, '/addUser');
  // }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("人员信息"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchBarDelegate(users));
              },
            ),
            IconButton(
                onPressed: () {
                  print("addUser");
                  _addUser(context);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Text("总人数: ${users.length} 人"),
            // ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverSafeArea(
                      sliver: SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: UserSliverList(users),
                  ))
                ],
              ),
            )
          ],
        ));
  }

  _addUser(BuildContext context) async {
    final newUser = await Navigator.pushNamed(context, '/addUser');
    if (newUser != null) {
      setState(() {
        users.add(newUser);
      });
    }
  }
}
