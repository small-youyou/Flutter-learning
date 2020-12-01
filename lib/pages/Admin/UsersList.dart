import 'package:flutter/material.dart';

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
                child: Text(users[index]["name"]),
              ),
            ));
      },
      childCount: users.length,
    ));
  }
}
