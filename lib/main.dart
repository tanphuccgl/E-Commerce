import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/themes.dart';
import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'src/config/routes/auto_router.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => XRouter());

  await Prefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();
    return MultiBlocProvider(
        providers: [
          // TODO: Tạo stack navigation cho các màn hình liên quan tới Login
          // Tham khảo: https://github.com/j1mmyto9/flutter-boilerplate/tree/main/lib/src/features/order/router
          BlocProvider(create: (_) => LoginBloc()),
        ],
        child: MaterialApp.router(
            theme: XTheme.light(),
            debugShowCheckedModeBanner: false,
            darkTheme: XTheme.dark(),
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
            // TODO: S.of(context)
            // Tham khảo https://github.com/j1mmyto9/flutter-boilerplate/blob/main/lib/src/localization/localization_utils.dart
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
            )));
  }
}
