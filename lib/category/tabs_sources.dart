import 'package:flutter/material.dart';
import 'package:news_app_course_route/News/News_contanir.dart';
import 'package:news_app_course_route/category/tabs_shape.dart';
import 'package:news_app_course_route/model/source_response.dart';

class tabsSources extends StatefulWidget {
  List <Sources> source ;

  tabsSources({required this.source});

  @override
  State<tabsSources> createState() => _tabsSourcesState();
}

class _tabsSourcesState extends State<tabsSources> {
  int selectedIndex= 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:widget.source!.length ,
        child:Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex= index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.source!.map((source) => TabShape(sources: source, isSelected:selectedIndex== widget.source?.indexOf(source))).toList()
            ),
            Expanded(child: newsContainer(source:widget.source[selectedIndex])),

          ],
        ));
  }
}
