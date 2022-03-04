import 'package:flutter/material.dart';

class XStateLoadingWidget extends StatelessWidget {
  const XStateLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
