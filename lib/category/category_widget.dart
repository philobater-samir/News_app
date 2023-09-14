import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/category/category_item.dart';
import 'package:news_app_course_route/model/category_item_model.dart';
import 'package:news_app_course_route/provider/app_provider.dart';
import 'package:provider/provider.dart';

class categoryShow extends StatelessWidget {
  var categoryList = Category.getCategory();
  Function onCategoryItemClick;

  categoryShow({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    List<Category> categoryList = [
      Category(
          id: 'sports',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).sports
              : AppLocalizations.of(context).sports,
          color: MyThemeData.redColor,
          imagePath: 'assets/images/ball.png'),
      Category(
          id: 'technology',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).technology
              : AppLocalizations.of(context).technology,
          color: MyThemeData.darkBlueColor,
          imagePath: 'assets/images/computer.png'),
      Category(
          id: 'health',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).health
              : AppLocalizations.of(context).health,
          color: MyThemeData.pinkColor,
          imagePath: 'assets/images/health.png'),
      Category(
          id: 'business',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).business
              : AppLocalizations.of(context).business,
          color: MyThemeData.brownColor,
          imagePath: 'assets/images/bussines.png'),
      Category(
          id: 'general',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).general
              : AppLocalizations.of(context).general,
          color: MyThemeData.blueColor,
          imagePath: 'assets/images/environment.png'),
      Category(
          id: 'science',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).science
              : AppLocalizations.of(context).science,
          color: MyThemeData.yellowColor,
          imagePath: 'assets/images/science.png'),
      Category(
          id: 'entertainment',
          title: provider.appLanguage == 'ar'
              ? AppLocalizations.of(context).entertainment
              : AppLocalizations.of(context).entertainment,
          color: Colors.purple,
          imagePath: 'assets/images/enter.png'),
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Expanded(
        child: GridView.builder(
          itemCount: categoryList.length,
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: () {
                  onCategoryItemClick(categoryList[index]);
                },
                child:
                    categoryItem(category: categoryList[index], index: index));
          }),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),),
      ),
    );
  }
}
