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
  String _curchosedTag = "";

  String _actionChipString = "选择关键词";
  IconData _actionChipIconData = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scrollbar(
            child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text("关键词:"),
                          SizedBox(
                            width: 15,
                          ),
                          ActionChip(
                            label: Text(
                              _actionChipString,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              //_awaitReturnNewTag(context);
                              _awaitReturnChooseTag(context);
                            },
                            avatar: Icon(
                              _actionChipIconData,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/updateTags');
                          },
                          child: Text("管理关键词")),
                    ]),
                SizedBox(height: 15.0),
                Form(
                  key: newTitleFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        // controller: textFieldController,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            icon: Icon(Icons.title),
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
          JdButton(
            text: "发送",
            cb: () {
              _sendMessage();
            },
          ),
        ]),
      ),
    )));
  }

  String _validateNewTitle(value) {
    if (value.isEmpty) {
      return "新标题不能为空";
    } else if (_curchosedTag == "") {
      return "请先选择关键词";
    } else if (!value.contains(_curchosedTag)) {
      return "新标题未包含关键词";
    }
    return null;
  }

  _awaitReturnChooseTag(BuildContext context) async {
    print("open choose Tags");
    final chosedTag = await Navigator.pushNamed(context, '/chooseTags');

    _curchosedTag = chosedTag;
    _updateChooseTagButton();
  }

  _updateChooseTagButton() {
    if (_curchosedTag != '') {
      setState(() {
        _actionChipString = _curchosedTag;
        _actionChipIconData = Icons.edit;
      });
    } else {
      print("null");
      setState(() {
        _actionChipString = "选择关键词";
        _actionChipIconData = Icons.add;
      });
    }
  }

  _sendMessage() {
    newTitleFormKey.currentState.save();
    if (newTitleFormKey.currentState.validate()) {
      print("发送成功");
    }
  }
}
