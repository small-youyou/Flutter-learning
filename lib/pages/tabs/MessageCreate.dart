import 'package:flutter/material.dart';
import 'package:weitong/widget/JdButton.dart';

class MessageCreate extends StatefulWidget {
  MessageCreate({Key key}) : super(key: key);

  @override
  _MessageCreateState createState() => _MessageCreateState();
}

class _MessageCreateState extends State<MessageCreate> {
  final newTitleFormKey = GlobalKey<FormState>();
  String newTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scrollbar(
            child: SingleChildScrollView(
                child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: newTitleFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "输入您要新建的关键词",
                    style: TextStyle(fontSize: 32.0),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  TextFormField(
                    // controller: textFieldController,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        icon: Icon(Icons.subject),
                        labelText: "新建标题",
                        border: OutlineInputBorder(),
                        hintText: "新建标题需包含关键词"),
                    onSaved: (value) {
                      newTitle = value;
                    },
                    validator: _validateNewTitle,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            )
          ]),
    ))));
  }

  void _sendDataBack(BuildContext context) {
    newTitleFormKey.currentState.save();
    if (newTitleFormKey.currentState.validate()) {
      String textToSendBack = newTitle;
      Navigator.pop(context, textToSendBack);
    }
  }

  String _validateNewTitle(value) {
    if (value.isEmpty) {
      return "新标题不能为空";
    } else if (false) {
      return "新标题未包含关键词";
    }
    return null;
  }
}
