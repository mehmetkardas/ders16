import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  bool yatayEksen = true;
  bool isPageSnapping = true;
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
            //dokunduğumuzda diğer sayfaya mı geçsin yoksa harekete göre kalsın mı
            pageSnapping: isPageSnapping,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.yellow,
                child: Center(
                  child: Text("Sayfa 0", style: TextStyle(fontSize: 36)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.red,
                child: Center(
                  child: Text("Sayfa 1", style: TextStyle(fontSize: 36)),
                ),
              ),

              Container(
                width: double.infinity,
                height: 300,
                color: Colors.orange,
                child: Center(
                  child: Text("Sayfa 2", style: TextStyle(fontSize: 36)),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.redAccent.shade400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentIndex == 2
                          ? null
                          : () {
                              pageController.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("İleri"),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("Geri"),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text("Yatay Eksende Çalış"),
                    Checkbox(
                      value: yatayEksen,
                      onChanged: (value) {
                        setState(() {
                          yatayEksen = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Page Snapping Değiştir"),
                    Checkbox(
                      value: isPageSnapping,
                      onChanged: (value) {
                        setState(() {
                          isPageSnapping = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
