import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/themes.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/rating_and_review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'src/config/routes/auto_router.gr.dart';
import 'src/localization/localization_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => XRouter());
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    //  blocObserver: XBlocObserver()
  );
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
        BlocProvider(
            create: (_) => AccountBloc(AccountState(data: XUser.empty()))),
        BlocProvider(
            create: (_) => ProductBloc(ProductState(
                searchList: XHandle.completed([]),
                items: XHandle.completed([])))),
        BlocProvider(create: (_) => CategoriesBloc()),
        BlocProvider(create: (_) => FavoriteBloc()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => PromotionBloc()),
        BlocProvider(create: (_) => ReviewBloc(product: XProduct.empty())),
      ],
      child: MaterialApp.router(
        theme: XTheme.light(),
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        darkTheme: XTheme.dark(),
        themeMode: ThemeMode.light,
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
        routeInformationParser: appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
