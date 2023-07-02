import 'package:flutter/material.dart';
import 'package:news_app_course_route/News/News_details.dart';
import 'package:news_app_course_route/model/NewsResponse.dart';

class newsItem extends StatelessWidget {
  News news;
  newsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(newsDetails.routeName, arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              news.author ?? "",
              style: TextStyle(
                  color: Colors.grey[10],
                  fontSize: 12,
                  fontWeight: FontWeight.w100),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              news.title ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              news.publishedAt ?? "",
              style: TextStyle(
                  color: Colors.grey[10],
                  fontSize: 10,
                  fontWeight: FontWeight.w100),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
