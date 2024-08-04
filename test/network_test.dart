import 'dart:convert';

import 'package:newsapp/network_service.dart';
import 'package:newsapp/response_news.dart';

void main() async{
  final response = await fetchArticle();
  print(response.statusCode);
  if(response.statusCode==200){
    final Map<String,dynamic> decoded = jsonDecode(response.body);

    final responseNews = ResponseNews.fromJson(decoded);
    print(responseNews.status);
  }
}