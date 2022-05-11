class PostData{
  int? userId;
  int? id;
  String? title;
  String? body;

  PostData({required this.userId, required this.id, required this.title, required this.body});

  PostData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return PostData.fromJson(json);
  }
}