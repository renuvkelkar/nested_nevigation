import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_nevigation/pages/page1/sub_nav_scaffold.dart';
import 'package:nested_nevigation/pages/page4/sub_nav_drawer.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key, this.navBody});
  final Widget? navBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 136, 68),
        title: const Text('page4'),
      ),
    );
  }
}
