import 'package:http/http.dart' as http;

//API KEY : 49599851efd74c9f939fcdd2b8b3abbc
Future<http.Response> fetchArticle() {
  const urlNews = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49599851efd74c9f939fcdd2b8b3abbc';
  return http.get(Uri.parse(urlNews));
}