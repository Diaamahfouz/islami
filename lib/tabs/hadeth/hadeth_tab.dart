import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';

import 'package:provider/provider.dart';


class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * 0.28,
        ),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          thickness: 2,
          color: AppTheme.lightPrimary,
        ),
        Text('الأحاديث',
            style: settingsProvider.isDark
                ? const TextStyle(
                    color: AppTheme.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )
                : const TextStyle(
                    color: AppTheme.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
        const Divider(
          thickness: 2,
          color: AppTheme.lightPrimary,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethDetailsScreen.routename,
                      arguments: ahadeth[index],
                    ),
                    child: Text(
                      style: Theme.of(context).textTheme.headlineSmall,
                      ahadeth[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: ahadeth.length),
        )
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');
    ahadeth = ahadethText.map((hadethText) {
      List<String> hadethLines = hadethText.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;

      return Hadeth(content: content, title: title);
    }).toList();
    setState(() {});
  }
}
