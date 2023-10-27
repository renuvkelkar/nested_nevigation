import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key, this.subNavBody});
  final Widget? subNavBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 161, 241),
        title: const Text('page1'),
      ),
    );
    // return SubNavScaffold(
    //   subNavBody: subNavBody
    // );
  }
}
