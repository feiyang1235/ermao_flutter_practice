class User {
  final String name;
  final String location;
  final String blog;
  final String avatarUrl;
  final String htmlUrl;
  final String company;

  User({this.name,this.location, this.blog, this.avatarUrl, this.htmlUrl,this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      name: json['name'],
      location: json['location'],
      blog: json['blog'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
      company: json["company"],
    );
  }
}