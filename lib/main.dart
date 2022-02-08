import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/themes.dart';
import 'package:e_commerce/src/models/prefs.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'src/config/routes/auto_router.gr.dart';
import 'src/localization/localization_util.dart';

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
        BlocProvider(create: (_) => AccountBloc()),
        BlocProvider(create: (_) => BottomBarBloc()),
      ],
      child: MaterialApp.router(
        theme: XTheme.light(),
        debugShowCheckedModeBanner: false,
        darkTheme: XTheme.dark(),
        restorationScopeId: 'app',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
