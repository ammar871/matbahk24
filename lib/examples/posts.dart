
class Posts {
 late int _userId;
 late int _id;
  late String _title;
  late String _body;

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  Posts({
      required int userId,
      required int id,
      required String title,
      required String body}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  Posts.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}