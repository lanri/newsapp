// To parse this JSON data, do
//
//     final responseNews = responseNewsFromJson(jsonString);

import 'dart:convert';

ResponseNews responseNewsFromJson(String str) => ResponseNews.fromJson(json.decode(str));

class ResponseNews {
    final String status;
    final int totalResults;
    final List<Article> articles;

    ResponseNews({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory ResponseNews.fromJson(Map<String, dynamic> json) => ResponseNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

}

class Article {
    final Source source;
    final String? author;
    final String title;
    final String? description;
    final String url;
    final String? urlToImage;
    final DateTime publishedAt;
    final String? content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'No Author',
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'https://static.thenounproject.com/png/4595376-200.png',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'No Content',
    );

}

class Source {
    final String? id;
    final String? name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

}

enum Id {
    GOOGLE_NEWS
}

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS
});

enum Name {
    GOOGLE_NEWS,
    INVESTOPEDIA,
    NEW_YORK_POST
}

final nameValues = EnumValues({
    "Google News": Name.GOOGLE_NEWS,
    "Investopedia": Name.INVESTOPEDIA,
    "New York Post": Name.NEW_YORK_POST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
