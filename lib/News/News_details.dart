import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Stack(
      children: [
        Container(
            color: MyThemeData.whiteColor,
            child: Image.asset(
              'assets/images/main_background.png',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: MyThemeData.primaryColor,
            toolbarHeight: height * .1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35))),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                        fontSize: 25,
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    news.description ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => LunchUrl(news.url),
                        child: Text(
                          "View Full Article",
                          style: TextStyle(
                              color: MyThemeData.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: MyThemeData.primaryColor,
                        textDirection: TextDirection.ltr,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> LunchUrl(String? url) async {
    if (url == null) return;
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
