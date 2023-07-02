import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  Function onClickDrawer;

  static const int categories = 1;

  static const int settings = 2;

  HomeDrawer({required this.onClickDrawer});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            width: double.infinity,
            color: MyThemeData.primaryColor,
            child: Center(
                child: Text(
              provider.appLanguage == 'ar'
                  ? AppLocalizations.of(context)!.app_drawer
                  : AppLocalizations.of(context)!.app_drawer,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            )),
          ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    onClickDrawer(HomeDrawer.categories);
                  },
                  child: Row(children: [
                    Icon(Icons.list,color: Colors.black,size: 40,),
                    SizedBox(width: 10,),
                    Text(
                    provider.appLanguage == 'ar'
                        ? AppLocalizations.of(context)!.categories
                        : AppLocalizations.of(context)!.categories,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                onClickDrawer(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    provider.appLanguage == 'ar'
                        ? AppLocalizations.of(context)!.setting
                        : AppLocalizations.of(context)!.setting,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
              )
            ],
          ),
        ]
    );
  }
}
