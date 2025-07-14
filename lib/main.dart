import 'package:ders16/widgets.dart/expansion_tile.dart';
import 'package:ders16/widgets.dart/image_and_tabbar_page.dart';
import 'package:ders16/widgets.dart/liste_ornek.dart';
import 'package:ders16/widgets.dart/page_view_page.dart';
import 'package:ders16/widgets.dart/settings_expansion_menu.dart';
import 'package:ders16/widgets.dart/simple_image_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageAndTabbarPage(),
    );
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  var keyList = PageStorageKey("Key Liste");
  var keyExpansion = PageStorageKey("Key expansion");
  late List<Widget> sayfalar = [];
  int bottomIndex = 0;

  @override
  void initState() {
    sayfalar = [
      ListeOrnek(listKey: keyList),
      /* ExpansionTilePage(expansionKey: keyExpansion),*/
      SettingsExpansionMenu(),
      // PageViewPage(),
      SimpleImageSlider(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Araçları"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.red,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),

          BottomNavigationBarItem(
            icon: Icon(Icons.expand_less),
            label: "Expansion",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "PageView"),
        ],
      ),
    );
  }
}
