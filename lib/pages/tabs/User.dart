//https://material.io/tools/icons/?icon=favorite&style=baseline

import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: ScreenAdapter.height(220),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/user_bg.jpg'),
                    fit: BoxFit.cover)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                    child: Image.asset(
                      'images/user.png',
                      fit: BoxFit.cover,
                      width: ScreenAdapter.width(100),
                      height: ScreenAdapter.width(100),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("用户名：124124125",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenAdapter.size(32))),
                        Text("普通员工",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenAdapter.size(24))),
                      ],
                    ))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("记录"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
          )
        ],
      ),
    );
  }
}
