class Author {
  String id;
  String name;
  String description;
  String bio;
  int quoteCount;

  Author({
    this.id,
    this.name,
    this.description,
    this.bio,
    this.quoteCount,
  });

  Author.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    bio = json['bio'];
    quoteCount = json['quoteCount'];
  }
}
