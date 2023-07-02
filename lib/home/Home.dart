import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/News/news_search.dart';
import 'package:news_app_course_route/category/category_details_screen.dart';
import 'package:news_app_course_route/category/category_widget.dart';
import 'package:news_app_course_route/provider/app_provider.dart';
import 'package:news_app_course_route/settings/settings_tab.dart';
import 'package:provider/provider.dart';

import 'home_drawer.dart';

class home extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<appProvider>(context);

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
              provider.appLanguage == 'ar'
                  ? AppLocalizations.of(context)!.app_tittle
                  : AppLocalizations.of(context)!.app_tittle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                    onPressed: () =>
                        showSearch(context: context, delegate: newsSearch()),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      textDirection: TextDirection.rtl,
                      size: 30,
                    )),
              )
            ],
          ),
            drawer: Drawer(
              child: HomeDrawer(onClickDrawer: onClickDrawer),
            ),
          body:selectedIndexDrawer== HomeDrawer.settings? settingsTab():
          selectedCategory == null ?
          categoryShow(onCategoryItemClick: onCategoryItemClicked):
          categoryDetails(category: selectedCategory),

        )
      ],
    );
  }

  var selectedCategory = null;
  void onCategoryItemClicked(category)  {
    selectedCategory = category ;
    setState(() {

    });

  }

  int selectedIndexDrawer = HomeDrawer.categories ;
  void onClickDrawer(int newSelectedItemDrawer)  {
    selectedIndexDrawer= newSelectedItemDrawer ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });

  }
}
