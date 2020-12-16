import '../../widget/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_plugin/rongcloud_im_plugin.dart';
import '../../Model/user_data.dart';
import '../Login.dart';
import '../../services/Base64Convert.dart';

class LogRecordPage extends StatefulWidget {
  LogRecordPage({Key key}) : super(key: key);

  @override
  _LogRecordPageState createState() => _LogRecordPageState();
}

class _LogRecordPageState extends State<LogRecordPage> {
  int flage = 0;
  String Mybase64;
  onSendMessage() async {
    TextMessage txtMessage = new TextMessage();

    txtMessage.content = "这条消息来自 Flutter";
    Message msg = await RongIMClient.sendMessage(
        RCConversationType.Private, '123', txtMessage);
    print("send message start senderUserId = " + msg.senderUserId);
  }

  onSendMyMessage() async {
    TextMessage txtMessage = new TextMessage();
    // Mybase64 = await Base64Convert.image2Base64(
    //     r"/storage/emulated/0/Pictures/Screenshots/1.jpg");

    Mybase64 =
        await Base64Convert.image2Base64(r"/storage/emulated/0/Pictures/2.jpg");
    // String Mybase64 =
    //     Base64Convert.image2Base64(r"../../../images/1.jpg").toString();
    print(
        "-------*****************base64内容测试R************************------------");
    print(Mybase64);
    print("-------*****************************************------------");
    txtMessage.content = "{image:'$Mybase64'}";
    Message msg = await RongIMClient.sendMessage(
        RCConversationType.Private, '123', txtMessage);
    print("send message start senderUserId = " + msg.senderUserId);
  }

  showMyImage() {
    print("复制的字符串：" +
        "WzEzNywgODAsIDc4LCA3MSwgMTMsIDEwLCAyNiwgMTAsIDAsIDAsIDAsIDEzLCA3MywgNzIsIDY4LCA4MiwgMCwgMCwgMCwgODUsIDAsIDAsIDAsIDc3LCA4LCAyLCAwLCAwLCAwLCA4OCwgMTgsIDE5MSwgMjUxLCAwLCAwLCAyMiwgMTE2LCA3MywgNjgsIDY1LCA4NCwgMTIwLCAxLCAyMzcsIDkwLCAxMDUsIDE0NCwgOTMsIDE5NywgMTE3LCAyMzgsIDIxOSwgMTE5LCAxMjMsIDI1MSwgMjM2LCAxNTUsIDE5NiwgMTA0LCA3MCwgMjE5LCAzMiwgMTE4LCAzNSwgMTUzLCA2OSwgMTI4LCA5OSwgMjI4LCAzNiwgNDQsIDQ2LCAzLCAxNTAsIDY0LCAyMTYsIDU2LCA4NSwgMTYxLCA5OCwgMjI4LCAxNzMsIDc2LCA1NywgNjQsIDE5MiwgNzMsIDQyLCAzMywgMzMsIDEzNywgODMsIDI1NCwgNjUsIDIyNSwgMTc4LCAzMywgMjAsIDksIDIxLCAxMiwgMzgsIDE3NywgMTkyLCAyMCwgMTk0LCA2OSwgMTMwLCAxMzMsIDY5LCA4MSwgMjQsIDE5NiwgMzQsIDIwNCwgMzgsIDE0NCwgNCwgOTgsIDM2LCA1MiwgMTQ2LCA3MCwgMjUxLCAxMDQsIDEwMiwgNTIsIDExMSwgMTI3LCAxMTksIDIwNywgMTE5LCAxODYsIDIyMywgMTI1LCAyMDMsIDIwNCwgMTQ3LCAxNTIsIDQ5LCAxNjYsIDQyLCAxNzQsIDgxLCAyNDMsIDE4NCwgMjM0LCAyMTksIDIwMywgMjMzLCAyNDMsIDE1NywgMTE1LCAyNTAsIDI0NCwgMjMzLCAxMTUsIDcxLCA5LCAxMzAsIDEyOCwgODUsIDEzOSwgMTI0LCA4MywgMjAsIDE2NSwgMTc0LCA3MywgMTkwLCA4MywgOTUsIDkzLCA3OSwgNTYsIDE2NiwgMTA" +
        "   结束了");

    // var Mybase64 = await Base64Convert.image2Base64(
    //     r"/storage/emulated/0/Pictures/Screenshots/1.jpg");
    print("-------******************测试显示图片***********************------------");
    print("测试显示图片");
    print(Mybase64);
    return Base64Convert.base642Image(Mybase64);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("------------------------------------");
    RongIMClient.init(RongAppKey);
    RongIMClient.connect(RongIMToken, (int code, String userId) {
      print("-------*****************************************------------");
      print('connect result ' + code.toString());
    });
    print("------------------------------------");
    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: IconButton(
            onPressed: () {
              onSendMyMessage();
            },
            icon: Icon(Icons.send),
          ),
        ),
        Container(
            child: FlatButton(
          child: Text("点击显示图片"),
          onPressed: () {
            setState(() {
              flage = 1;
            });
          },
        )),
        Container(child: flage == 0 ? Text("图片未加载成功") : showMyImage()),
      ],
    ));
  }
}
