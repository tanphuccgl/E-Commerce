// class ProfileRouters {
//   static const String profile = 'profile';
// }

// class ProfileCoordinator {
//   static const autoRoute = AutoRoute(
//     path: ProfileRouters.profile,
//     name: "ProfileRoute",
//     page: EmptyRouterPage,
//     children: [

//      AutoRoute(page: SettingPage, path: "setting",name: "SettingRoute"),
//       RedirectRoute(path: '*', redirectTo: ''),
//     ],
//   );

//   static showSettings(BuildContext context) {
//     context.router.push(SettingRoute());
//   }
// }
