import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubNavScaffold extends StatefulWidget {
  const SubNavScaffold({super.key, this.subNavBody});
  final Widget? subNavBody;
  @override
  State<SubNavScaffold> createState() => _SubNavScaffoldState();
}

class _SubNavScaffoldState extends State<SubNavScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 183, 62),
        title: const Text('Shell Route'),
      ),
      body: Row(children: [
        Container(
          color: const Color.fromARGB(255, 19, 94, 124),
          height: double.infinity,
          width: 200,
          child: Center(
              child: Column(
            children: [
              InkWell(
                  onTap: () {
                    context.go('/page1/subpage1');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 200,
                        color: Colors.white,
                        child: const Center(child: Text('Subpage 1'))),
                  )),
              InkWell(
                  onTap: () {
                    context.go('/page1/subpage2');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: 200,
                        color: Colors.white,
                        child: const Center(child: Text('Subpage 2'))),
                  )),
            ],
          )),
        ),
        Expanded(
          child: SizedBox(
              // color: Color.fromARGB(255, 131, 204, 243),
              height: double.infinity,
              width: double.infinity,
              child: widget.subNavBody),
        ),
      ]),
    );
  }
}
