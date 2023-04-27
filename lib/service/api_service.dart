import 'dart:convert';
import '../model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f46498a4479645b9bee30b0c9afd402d";

  Future<NewsModel?> getNews()async{
    try{
      var response= await http.get(Uri.parse(url));
      var decode = jsonDecode(response.body);
      if(response.statusCode==200){
        return NewsModel.fromJson(decode);
      }else{
        return NewsModel.fromJson(decode);
      }
    }catch(e){
      return null;
    }
  }
}
