class jsonModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  jsonModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  jsonModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  List<jsonModel>? users = [];
  fetchData(json) {
    json.forEach((v) {
      users!.add(new jsonModel.fromJson(v));
    });

    return users;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
