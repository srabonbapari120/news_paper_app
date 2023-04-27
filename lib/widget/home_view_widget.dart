import 'package:flutter/material.dart';
import '../model/news_model.dart';

Widget homeViewWidget(BuildContext context,List<Articles>? article,int index){
  double height = MediaQuery.of(context).size.height;
  String? title = article?[index].title;
  return Column(
    children: [
      SizedBox(
        height: height*0.05,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0,bottom: 10.0),
        child: Text(
          title??"",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(),
        child: Image.network(
            article![index].urlToImage.toString()),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              article[index].author.toString(),
              overflow: TextOverflow.ellipsis,maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
          ),
        ),
      ),
    ],
  );
}