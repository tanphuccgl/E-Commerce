import 'package:e_commerce/src/config/themes/settings_controller.dart';
import 'package:e_commerce/src/config/themes/settings_service.dart';
import 'package:e_commerce/src/config/themes/themes.dart';
import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/modules/auth/register/pages/register_page.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/sample_feature/sample_item_details_view.dart';
import 'package:e_commerce/src/modules/sample_feature/sample_item_list_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/config/routes/page_routers.dart';
import 'src/config/themes/settings_view.dart';
import 'src/modules/auth/login/pages/login_page.dart';

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());
 WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home:  Prefs.isLogin()==true ? const DashboardPage() : const LoginPage(),
          routes: {
            PageRoutes.loginPage: (context) => const LoginPage(),
            PageRoutes.registerPage: (context) => const RegisterPage(),
            PageRoutes.dashboardPage: (context) => const DashboardPage(),
          },
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          themeMode: settingsController.themeMode,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
