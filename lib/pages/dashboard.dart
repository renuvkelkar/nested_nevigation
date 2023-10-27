import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Dashboard'),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              context.go('/page1/Subpagebase');
            },
            child: Container(
              color: Color.fromARGB(255, 238, 203, 8),
              height: 100,
              width: 300,
              child: Center(child: const Text('Shell Route')),
            ),
          ),
          InkWell(
            onTap: () {
              context.go('/a');
            },
            child: Container(
              color: Color.fromARGB(255, 102, 82, 237),
              height: 100,
              width: 300,
              child: const Center(child: Text('Bottom Navigation')),
            ),
          ),
          InkWell(
            onTap: () {
              context.go('/page3/firebase');
            },
            child: Container(
              color: Color.fromARGB(255, 241, 128, 71),
              height: 100,
              width: 300,
              child: Center(child: const Text('Sidebar')),
            ),
          ),
          InkWell(
            onTap: () {
              context.go(
                '/page4/page4basic',
              );
            },
            child: Container(
              color: Color.fromARGB(255, 20, 190, 206),
              height: 100,
              width: 300,
              child: Center(child: const Text('Drawer')),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     context.go(
          //       '/rail1',
          //     );
          //   },
          //   child: Container(
          //     color: Color.fromARGB(255, 20, 190, 206),
          //     height: 100,
          //     width: 300,
          //     child: Center(child: const Text('Drawer')),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
