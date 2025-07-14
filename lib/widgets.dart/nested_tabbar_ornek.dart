import 'package:flutter/material.dart';

class NestedTabbarOrnek extends StatefulWidget {
  const NestedTabbarOrnek({super.key});

  @override
  State<NestedTabbarOrnek> createState() => _NestedTabbarOrnekState();
}

class _NestedTabbarOrnekState extends State<NestedTabbarOrnek> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("İç içe Sekmeli Tab"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Yiyecekler"),
              Tab(text: "İçecekler"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InnerTabView(categoryName: "Yiyecekler"),
            InnerTabView(categoryName: "İçecekler"),
          ],
        ),
      ),
    );
  }
}

class InnerTabView extends StatelessWidget {
  final String categoryName;
  const InnerTabView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.green,

            tabs: [
              Tab(text: "Ana Yemekler"),
              Tab(text: "Atıştırmalıklar"),
              Tab(text: "Tatlılar"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("$categoryName - Soğuk İçecekler")),
                Center(child: Text("$categoryName - Sıcak İçecekler")),
                Center(child: Text("$categoryName - Kahveler")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
