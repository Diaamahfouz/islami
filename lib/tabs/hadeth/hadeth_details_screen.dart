import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/widgets/loading_indicator.dart';

import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routename = '/hadeth_details';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.backgroundImagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.06,
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          decoration: BoxDecoration(
            color:
                settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: hadeth.content.isEmpty
              ? const LoadingIndicator()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    hadeth.content[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: hadeth.content.length,
                ),
        ),
      ),
    );
    ;
  }
}
