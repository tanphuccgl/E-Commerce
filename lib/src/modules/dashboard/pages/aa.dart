import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class APage extends StatelessWidget {  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("A "),
            ],
          ),
        );
      },
    );
  }
}
