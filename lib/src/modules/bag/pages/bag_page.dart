import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "Bag";
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
    );
  }
}
