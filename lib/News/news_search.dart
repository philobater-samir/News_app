import 'package:flutter/material.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/News/news_item.dart';
import 'package:news_app_course_route/api_manegar.dart';
import 'package:news_app_course_route/model/NewsResponse.dart';

class newsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: IconButton(
            onPressed: () => showResults(context),
            icon: Icon(
              Icons.search,
              color: Colors.white,
              textDirection: TextDirection.rtl,
              size: 30,
            )),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        icon: Icon(
          Icons.close,
          color: Colors.white,
          textDirection: TextDirection.rtl,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchKeyword: query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: height * .1,
                  width: width * .5,
                  decoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Something Went wrong!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary:
                                  MyThemeData.primaryColor, // Background color
                            ),
                            child: Text(
                              'Reload',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Center(
              child: Container(
                height: height * .1,
                width: width * .5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      snapshot.data?.message ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: MyThemeData.primaryColor, // Background color
                        ),
                        child: Text(
                          'Reload',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 12),
                        ))
                  ],
                ),
              ),
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: ((context, index) {
              return newsItem(news: newsList[index]);
            }),
            itemCount: newsList.length,
          );
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (query.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: MyThemeData.primaryColor,
        ),
      );
    } else
      return FutureBuilder<NewsResponse>(
          future: ApiManager.getNews(searchKeyword: query),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyThemeData.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: height * .1,
                    width: width * .5,
                    decoration: BoxDecoration(
                      color: MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Something Went wrong!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: MyThemeData
                                    .primaryColor, // Background color
                              ),
                              child: Text(
                                'Reload',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Center(
                child: Container(
                  height: height * .1,
                  width: width * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data?.message ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary:
                                MyThemeData.primaryColor, // Background color
                          ),
                          child: Text(
                            'Reload',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 12),
                          ))
                    ],
                  ),
                ),
              );
            }
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemBuilder: ((context, index) {
                return newsItem(news: newsList[index]);
              }),
              itemCount: newsList.length,
            );
          }));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 70,
          backgroundColor: MyThemeData.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
        ),
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        indicatorColor: Colors.black,
        hintColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(selectionColor: Colors.white));
  }
}
