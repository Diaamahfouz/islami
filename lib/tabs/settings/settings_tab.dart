import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              AppLocalizations.of(context)!.state,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (isDark) async => settingsProvider
                    .changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppTheme.gold,
                inactiveThumbColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: settingsProvider.language,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: settingsProvider.isDark
                          ? const Text(
                              'English',
                              style: TextStyle(color: AppTheme.gold),
                            )
                          : const Text(
                              'English',
                              style: TextStyle(color: AppTheme.black),
                            ),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: settingsProvider.isDark
                          ? const Text(
                              'العربية',
                              style: TextStyle(color: AppTheme.gold),
                            )
                          : const Text(
                              'العربية',
                              style: TextStyle(color: AppTheme.black),
                            ),
                    )
                  ],
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage == null) return;
                    settingsProvider.changeLanguage(selectedLanguage);
                  },
                  dropdownColor: settingsProvider.isDark
                      ? AppTheme.darkPrimary
                      : AppTheme.lightPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
