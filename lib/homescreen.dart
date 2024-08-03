import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebhatab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/tabs/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Provider.of<SettingsProvider>(context).backgroundImagePath,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
          backgroundColor: Colors.transparent,
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: (AppLocalizations.of(context)!.quran)),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label: (AppLocalizations.of(context)!.hadeth)),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label: (AppLocalizations.of(context)!.sebha)),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label: (AppLocalizations.of(context)!.radio)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                 label: (AppLocalizations.of(context)!.settings)),
          ],
        ),
      ),
    );
  }
}
