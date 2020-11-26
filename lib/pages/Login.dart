import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weitong/pages/tabs/Tabs.dart';
import '../services/ScreenAdapter.dart';
import '../widget/JdText.dart';
import '../widget/JdButton.dart';
import '../routers/router.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //   icon: Icon(Icons.close),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              title: Text("登录页面"),
              actions: <Widget>[
                FlatButton(
                  child: Text("客服"),
                  onPressed: () {},
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(ScreenAdapter.width(20)),
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: ScreenAdapter.width(160),
                      width: ScreenAdapter.width(160),
                      // child: Image.asset('images/login.png'),
                      child: Image.network(
                          'https://www.itying.com/images/flutter/list5.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 30),
                  JdText(
                    text: "请输入用户名",
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 10),
                  JdText(
                    text: "请输入密码",
                    password: true,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('忘记密码'),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/registerFirst');
                            },
                            child: Text('新用户注册'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  JdButton(
                    text: "登入",
                    color: Color.fromRGBO(111, 111, 111, 0.9),
                    cb: () {
                      _loginAction();
                      // Navigator.pushNamed(context, '/initTags');
                    },
                  )
                ],
              ),
            )));
  }

  void _saveUserInfo(String id, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("id", id);
    prefs.setString("token", token);
    // prefs.setString("phone", _assount.text);
    // prefs.setString("password", _password.text);
  }

  void _loginAction() {
    //post
    _saveUserInfo("", "demotoken");
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new Tabs()),
        (route) => route == null);
  }
}
