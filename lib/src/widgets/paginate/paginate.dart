import 'package:flutter/material.dart';

class Paginate extends StatelessWidget {
  const Paginate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate:
              SliverChildBuilderDelegate((context, index) {}, childCount: 1),
        )
      ],
    );
  }
}
