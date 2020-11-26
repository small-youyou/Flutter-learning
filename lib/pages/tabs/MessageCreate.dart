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
  List<Widget> _containerList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scrollbar(
            child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _containerList = [
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
                    Divider(),
                    Form(
                      key: newTitleFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            // controller: textFieldController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(Icons.title),
                                labelText: "标题",
                                // border: OutlineInputBorder(),
                                hintText: "标题需包含关键词"),
                            onSaved: (value) {
                              newTitle = value;
                            },
                            validator: _validateNewTitle,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: TextField(
                        minLines: 18,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "输入内容"),
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                            onPressed: () {}, child: Icon(Icons.note_add)),
                        FlatButton(onPressed: () {}, child: Icon(Icons.mic)),
                        FlatButton(
                            onPressed: () {}, child: Icon(Icons.video_call)),
                      ],
                    ),
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
    if (chosedTag != null) {
      _curchosedTag = chosedTag;
      _updateChooseTagButton();
    }
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
