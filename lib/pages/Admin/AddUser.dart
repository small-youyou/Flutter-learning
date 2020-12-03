import 'package:flutter/material.dart';
import 'package:weitong/widget/JdButton.dart';

class AddUser extends StatelessWidget {
  final newUserFormKey = GlobalKey<FormState>();
  String id, password, name, job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("新增人员"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: newUserFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "输入新增人员详情",
                  style: TextStyle(fontSize: 32.0),
                ),
                TextFormField(
                  // controller: textFieldController,

                  // style: TextStyle(
                  //   fontSize: 17,
                  //   color: Colors.black,
                  // ),
                  decoration: InputDecoration(
                      icon: Icon(Icons.subject),
                      labelText: "姓名",
                      hintText: "请输入姓名"),
                  onSaved: (value) {
                    name = value;
                  },
                  validator: _validateNewName,
                ),

                TextFormField(
                  // controller: textFieldController,
                  //只允许输入数字
                  keyboardType: TextInputType.phone,
                  // style: TextStyle(
                  //   fontSize: 17,
                  //   color: Colors.black,
                  // ),
                  decoration: InputDecoration(
                      icon: Icon(Icons.subject),
                      labelText: "手机号",
                      hintText: "请输入手机号"),
                  onSaved: (value) {
                    id = value;
                  },
                  validator: _validateNewId,
                ),

                // TextFormField(
                //   // controller: textFieldController,
                //   // style: TextStyle(
                //   //   fontSize: 17,
                //   //   color: Colors.black,
                //   // ),
                //   decoration: InputDecoration(
                //       icon: Icon(Icons.subject),
                //       labelText: "密码",
                //       hintText: "请输入密码"),
                //   onSaved: (value) {
                //     id = value;
                //   },
                //   validator: _validateNewId,
                // ),
                // SizedBox(
                //   height: 32.0,
                // ),
                TextFormField(
                  // controller: textFieldController,
                  // style: TextStyle(
                  //   fontSize: 17,
                  //   color: Colors.black,
                  // ),
                  decoration: InputDecoration(
                      icon: Icon(Icons.subject),
                      labelText: "密码",
                      hintText: "请输入密码"),
                  onSaved: (value) {
                    password = value;
                  },
                  validator: _validateNewPassword,
                ),

                TextFormField(
                  // controller: textFieldController,
                  //只允许输入数字
                  keyboardType: TextInputType.phone,
                  // style: TextStyle(
                  //   fontSize: 17,
                  //   color: Colors.black,
                  // ),
                  decoration: InputDecoration(
                      icon: Icon(Icons.subject),
                      labelText: "职务",
                      hintText: "请输入职务"),
                  onSaved: (value) {
                    job = value;
                  },
                  validator: _validateNewJob,
                ),
                Divider(),
                JdButton(
                  text: '确定',
                  cb: () {
                    _sendDataBack(context);
                  },
                ),
              ],
            ),
          )),
    );
  }

  String _validateNewId(value) {
    if (value.isEmpty) {
      return "手机号不能为空";
    }

    return null;
  }

  String _validateNewName(value) {
    if (value.isEmpty) {
      return "姓名不能为空";
    }
    return null;
  }

  String _validateNewJob(value) {
    if (value.isEmpty) {
      return "职务不能为空";
    }
    return null;
  }

  String _validateNewPassword(value) {
    if (value.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }

  void _sendDataBack(BuildContext context) {
    newUserFormKey.currentState.save();
    if (newUserFormKey.currentState.validate()) {
      Map mapToSendBack = {
        "name": name,
        "id": id,
        "password": password,
        "job": job,
      };
      Navigator.pop(context, mapToSendBack);
    }
  }
}
