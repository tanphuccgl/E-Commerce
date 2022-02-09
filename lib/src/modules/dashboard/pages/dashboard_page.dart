import 'package:e_commerce/src/modules/bag/pages/bag_page.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/widgets/bottom_bar.dart';
import 'package:e_commerce/src/modules/favorites/pages/favorites_page.dart';
import 'package:e_commerce/src/modules/home/pages/home_page.dart';
import 'package:e_commerce/src/modules/profile/pages/profile_page.dart';
import 'package:e_commerce/src/modules/shop/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const XBottomNavigationBar(),
      body: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          // Pageview, IndexedStack
          //
          // TODO refactor to switch case

          if (state.index == PageIndex.home) {
            return const HomePage();
          } else if (state.index == PageIndex.shop) {
            return const ShopPage();
          } else if (state.index == PageIndex.bag) {
            return const BagPage();
          } else if (state.index == PageIndex.favorite) {
            return const FavoritesPage();
          } else if (state.index == PageIndex.profile) {
            return const ProfilePage();
          }
          return Container();
        },
      ),
    );
  }
}
