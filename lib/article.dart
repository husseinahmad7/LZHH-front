import 'dart:convert';

class Article {
  int id;
  String title;
  String description;
  DateTime pub_date;
  String author;
  String? image;
  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.pub_date,
    required this.author,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'pub_date': pub_date.millisecondsSinceEpoch,
      'author': author,
      'image': image,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      pub_date: DateTime.fromMillisecondsSinceEpoch(map['pub_date']),
      author: map['author'] ?? '',
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory Article.fromJson(String source) => Article.fromMap(json.decode(source));
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      pub_date: DateTime.parse(json['pub_date']),
      author: json['author'],
      image: json['image'],
    );
  }
}
