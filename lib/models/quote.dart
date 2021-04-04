class Quote {
  String id;
  String content;
  String author;

  Quote({this.id, this.content, this.author});

  Quote.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['content'] = this.content;
    data['author'] = this.author;
    return data;
  }
}
