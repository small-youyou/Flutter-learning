import 'package:flutter/material.dart';
import 'package:weitong/pages/Admin/UserDetails.dart';

class UserSliverList extends StatefulWidget {
  List<Map> users;
  UserSliverList(List<Map> users) {
    this.users = users;
  }
  @override
  _UserSliverListState createState() => _UserSliverListState(users);
}

class _UserSliverListState extends State<UserSliverList> {
  @override
  List<Map> users;
  _UserSliverListState(List<Map> users) {
    this.users = users;
  }
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Material(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(users[index]["name"]),
                    IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {
                          print("按钮点击");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserDetails(users[index])));
                        })
                  ],
                )),
          ),
        );
      },
      childCount: users.length,
    ));
  }
}
