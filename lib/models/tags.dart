class Tags {
  String id;
  String name;
  int quoteCount;

  Tags({
    this.id,
    this.name,
    this.quoteCount,
  });

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    quoteCount = json['quoteCount'];
  }
}
