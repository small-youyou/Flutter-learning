import 'package:flutter/material.dart';
import '../Login.dart';
import 'LogRecord.dart';
import 'MessageCreate.dart';
import 'User.dart';
import 'Message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pagelist = [
    MessagePage(),
    MessageCreate(),
    LogRecordPage(),
    UserPage()
  ];
  // List _pagelist = [Message(), MessageCreate(), LogRecord(), User()];
  @override
  void initState() {
    super.initState();

    print("init");
    initPlatformState();
  }

  initPlatformState() async {
    //1.初始化 im SDK
    // RongIMClient.init(RongAppKey);

    //2.连接 im SDK
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token");
    if (token != null && token.length > 0) {
      // // int rc = await RongIMClient.connect(token);
      // RongIMClient.connect(token, (int code, String userId) {
      //   developer.log("connect result " + code.toString(), name: pageName);

      //   EventBus.instance.commit(EventKeys.UpdateNotificationQuietStatus, {});
      //   if (code == 31004 || code == 12) {
      //     developer.log("connect result " + code.toString(), name: pageName);
      //     Navigator.of(context).pushAndRemoveUntil(
      //         new MaterialPageRoute(builder: (context) => new LoginPage()),
      //         (route) => route == null);
      //   } else if (code == 0) {
      //     developer.log("connect userId" + userId, name: pageName);
      //     // 连接成功后打开数据库
      //     // _initUserInfoCache();
      //   }
      // });
    } else {
      print("jump into login");
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new LoginPage()),
          (route) => route == null);
    }
  }

  Future<void> _cleanToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", null);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微通"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          _cleanToken();
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
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), title: Text("草稿")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("我的"))
        ],
      ),
    );
  }
}
