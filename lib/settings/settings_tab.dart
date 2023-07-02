import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_course_route/MyTheme.dart';
import 'package:news_app_course_route/provider/app_provider.dart';
import 'package:news_app_course_route/settings/language.dart';
import 'package:provider/provider.dart';

class settingsTab extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  provider.appLanguage == 'ar'
                      ? AppLocalizations.of(context)!.language
                      : AppLocalizations.of(context)!.language,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: showLanguageItem,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyThemeData.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.arabic
                                : AppLocalizations.of(context)!.english,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showLanguageItem() {
    showModalBottomSheet(
        backgroundColor: MyThemeData.whiteColor,
        context: context,
        builder: (context) {
          return LanguageItam();
        });
  }
}
