import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/profile/widgets/info_profile.dart';
import 'package:e_commerce/src/modules/profile/widgets/list_tile_profile.dart';
import 'package:e_commerce/src/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const urlImage =
        "https://s3-alpha-sig.figma.com/img/581b/273d/1a360f84cfd9a99708fc88"
        "9ab7d86e6c?Expires=1646611200&Signature=Ne8pJX9wERO1GL~IkYqLRYpHBEWcjqgKvgC"
        "fL1xkKPYbDPst5aclfwa6BSFxAdsFyuPRsbF4gl7yLdVxeJk6T2~vf6YAVGFresS2ppDx2BnJ~yj"
        "eWy1a6ondhN6z2Z8cFxxtzLk8GhEmSpZOT3RyAff6HXcLEw2dIDftNXYowjAj4Fg49vNLjRtwyn8"
        "KjEGvIV9jv7rKxG7Hb98M4OhcD0~O1uiyY10gJSIXFwBzH2vgOihgHaTz2qzNL4ufZqHAoggm81K"
        "YRs5R2kxLauIVQ0c7CLHt68X9l6w3l6fTWcmaAjxI7bR1CwiCsE0KdBAfqF~Q-DdJFAwFMxyT1Ta"
        "74A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;

    return Scaffold(
      appBar: AppBarSign(actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: MyColors.colorBlack,
          onPressed: () {},
        )
      ]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const XHeader(
              title: "My Profile",
            ),
          ),
          SizedBox(
            height: size.height * 0.018,
          ),
          BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
            var email = state.data.email ?? 'N/A';
            var name = state.data.name ?? 'N/A';
            return InfoProfile(
              email: email,
              imageUrl: urlImage,
              name: name,
            );
          }),
          const Expanded(child: ListTileProfile()),
        ],
      ),
    );
  }
}
