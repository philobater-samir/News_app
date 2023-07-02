import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_course_route/News/News_details.dart';
import 'package:news_app_course_route/category/category_details_screen.dart';
import 'package:news_app_course_route/home/Home.dart';
import 'package:news_app_course_route/provider/app_provider.dart';
import 'package:news_app_course_route/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => appProvider(), child: MyappNews()));
}

class MyappNews extends StatelessWidget {
  late appProvider provider;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    intialSharedPref();
    return MaterialApp(
      routes: {
        home.routeName: (context) => home(),
        settingsTab.routeName: (context) => settingsTab(),
        categoryDetails.routeName: (context) => categoryDetails(),
        newsDetails.routeName: (context) => newsDetails(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: home.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

  void intialSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String newLanguage = prefs.getString('newLanguage') ?? 'en';
    provider.changeLanguage(newLanguage);
  }
}
