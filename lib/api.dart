import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lzhh/article.dart';

// Future<List<Article>> fetchData() async {
//   final response = await http.get(Uri.parse('http://127.0.0.1:8000/'));
//   if (response.statusCode == 200) {
//     List<Article> articles = [];

//     List body = jsonDecode(response.body);
//     body.forEach((note) {
//       articles.add(Article.fromMap(note));
//     });
//     return articles;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// A function that converts a response body into a List<Article>.
List<Article> parseArticles(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

Future<List<Article>> fetchArticles(http.Client client) async {
  final response = await client.get(Uri.parse('http://127.0.0.1:8000/'));
  if (response.statusCode == 200) {
    // Synchronously run parseArticles in the main isolate.
    return compute(parseArticles, response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
