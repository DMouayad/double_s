import 'package:double_s/app/app.dart';
import 'package:double_s/ui/themes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  await ThemeManager.initialise();
  //
  getLogger('', printCallingFunctionName: false).i('logger is working...');
  runApp(const DoubleSApp());
}

class DoubleSApp extends StatelessWidget {
  const DoubleSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      statusBarColorBuilder: (theme) => theme?.colorScheme.background,
      navigationBarColorBuilder: (theme) => theme?.colorScheme.background,
      builder: (context, theme, darkTheme, themeMode) {
        return ValueListenableBuilder(
          valueListenable: locator.localeService.notifier,
          builder: (context, localeState, _) {
            return MaterialApp.router(
              routerDelegate: stackedRouter.delegate(),
              routeInformationParser: stackedRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: theme,
              darkTheme: darkTheme,
              locale: localeState.useSystemLocale
                  ? null
                  : localeState.selectedLocale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
