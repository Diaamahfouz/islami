import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            'assets/images/radio_image.png',
            height: MediaQuery.of(context).size.height * 0.38,
          ),
          Text(
            AppLocalizations.of(context)!.ethaa,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: settingsProvider.isDark
                      ? const Icon(
                          Icons.skip_previous_outlined,
                          color: AppTheme.gold,
                          size: 40,
                        )
                      : const Icon(
                          Icons.skip_previous_outlined,
                          color: AppTheme.lightPrimary,
                          size: 40,
                        )),
              IconButton(
                  onPressed: () {},
                  icon: settingsProvider.isDark
                      ? const Icon(
                          Icons.play_arrow,
                          color: AppTheme.gold,
                          size: 70,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          color: AppTheme.lightPrimary,
                          size: 70,
                        )),
              IconButton(
                  onPressed: () {},
                  icon: settingsProvider.isDark
                      ? const Icon(
                          Icons.skip_next_outlined,
                          color: AppTheme.gold,
                          size: 40,
                        )
                      : const Icon(
                          Icons.skip_next_outlined,
                          color: AppTheme.lightPrimary,
                          size: 40,
                        ))
            ],
          )
        ],
      ),
    );
  }
}
