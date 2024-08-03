import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/homescreen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: IslamiApp(),
    ),
  );
}
//last update without setting

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      routes: {
        HomeScreen.routename: (_) => HomeScreen(),
        SuraDetailsScreen.routename: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routename: (_) => HadethDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: SettingsProvider.themeMode == ThemeMode.dark ?AppTheme.darkTheme : AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.language)
    );
  }
}
