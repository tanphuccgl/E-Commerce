import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ProfileWrapperPage extends StatelessWidget {
  const ProfileWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
