import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({Key? key, required this.navigationShell})
      : super(key: key);

  final StatefulNavigationShell navigationShell;
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Firebase',
        icon: Icons.school_outlined,
        onPressed: () {
          context.go('/page3/firebase');
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Flutter',
        icon: Icons.flutter_dash_outlined,
        onPressed: () {
          setState(() => _headline = 'Flutter');
          context.go('/page3/flutter');
        },
      ),
      CollapsibleItem(
        text: 'HTML',
        icon: Icons.html_outlined,
        onPressed: () {
          setState(() => _headline = 'HTML');
          context.go('/page3/html');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 101, 137),
      ),
      body: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        // avatarImg: _avatarImg,
        title: 'FLUTTER',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: widget.navigationShell,
        selectedIconBox: Colors.transparent,
        unselectedTextColor: Colors.white,
        unselectedIconColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 3, 101, 137),
        selectedTextColor: const Color.fromARGB(255, 236, 156, 27),
        textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [],
      ),
    );
  }

  Widget sidebarBODY(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Text(
          _headline,
          style: Theme.of(context).textTheme.headline2,
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
    );
  }
}
