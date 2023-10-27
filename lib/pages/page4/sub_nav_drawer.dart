import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_nevigation/pages/page1/sub_nav_scaffold.dart';

class SubNavDrawer extends StatelessWidget {
  const SubNavDrawer({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoRouter with Drawer'),
        backgroundColor: Colors.teal,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                accountName: Text(
                  "GDG London",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("gdglondon@gmail.com"),
                currentAccountPictureSize: Size.square(50),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                context.go('/page4/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                context.go('/page4/course');
              },
            ),
          ],
        ),
      ),
      body: Container(
          //color: Color.fromARGB(255, 241, 240, 234),
          height: double.infinity,
          width: double.infinity,
          child: navigationShell),
    );
  }
}
