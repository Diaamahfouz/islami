import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int number = 0;
  String name = "سبحان الله";
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Provider.of<SettingsProvider>(context).headSebhaPath,
                width: 45,
              ),
              GestureDetector(
                onTap: () {
                  number += 1;
                  if (number >= 33 && number < 66) {
                    name = 'الحمد لله';
                  } else if (number >= 66 && number < 99) {
                    name = 'الله اكبر';
                  } else if (number >= 99 && number <= 100) {
                    name = 'لااله الا الله';
                  } else if (number > 100) {
                    number = 0;
                    name = 'سبحان الله';
                  }
                  setState(() {
                    turns += 1 / 33;
                  });
                },
                child: AnimatedRotation(
                  duration: const Duration(seconds: 1),
                  turns: turns,
                  child: Image.asset(
                    Provider.of<SettingsProvider>(context).bodySebhaPath,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                AppLocalizations.of(context)!.sebhanum,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: settingsProvider.isDark
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppTheme.darkPrimary,
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppTheme.lightPrimary,
                      ),
                height: 81,
                width: 69,
                child: Center(
                  child: settingsProvider.isDark
                      ? Text(
                          '$number',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppTheme.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Text(
                          '$number',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppTheme.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  onPressed: () {
                    number += 1;
                    if (number >= 33 && number < 66) {
                      name = 'الحمد لله';
                    } else if (number >= 66 && number < 99) {
                      name = 'الله اكبر';
                    } else if (number >= 99 && number <= 100) {
                      name = 'لااله الا الله';
                    } else if (number > 100) {
                      number = 0;
                      name = 'سبحان الله';
                    }
                    setState(() {
                      turns += 1 / 33;
                    });
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: settingsProvider.isDark
                      ? Text(
                          name,
                          style: const TextStyle(
                            color: AppTheme.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          name,
                          style: const TextStyle(
                            color: AppTheme.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
            ],
          ),
        ],
      ),
    );
  }
}
