//学妹注意：从服务器传回来的json数据，把它转换成Map类型用这个模板： https://javiercbk.github.io/json_to_dart/
//只要把服务器传回来的数据粘贴到这网站上，网站就会自动帮你转换，接下来直接复杂就可以啦！

class UserItemModel {
  String code;
  String token;

  UserItemModel({this.code, this.token});

  UserItemModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['token'] = this.token;
    return data;
  }
}
