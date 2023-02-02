import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'pages.dart';
import 'settings.dart';

class NumbersApp extends StatelessWidget {
  const NumbersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      data: YaruThemeData(
        variant: context.select((Settings s) => s.variant),
      ),
      builder: (context, yaru, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        themeMode: context.select((Settings s) => s.theme),
        locale: context.select((Settings s) => s.locale),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => Scaffold(
          appBar: YaruWindowTitleBar(
            title: Text(AppLocalizations.of(context).appTitle),
          ),
          body: child,
        ),
        home: const NumbersPage(),
      ),
    );
  }
}

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruNavigationPage(
      length: pages.length,
      itemBuilder: (context, index, selected) => YaruNavigationRailItem(
        selected: selected,
        icon: pages[index].iconBuilder(context),
        label: pages[index].titleBuilder(context),
        style: YaruNavigationRailStyle.labelled,
      ),
      pageBuilder: (context, index) => pages[index].pageBuilder(context),
      trailing: YaruNavigationRailItem(
        icon: const Icon(YaruIcons.settings),
        label: Text(AppLocalizations.of(context).settingsDialogTitle),
        style: YaruNavigationRailStyle.labelled,
      ),
    );
  }
}
