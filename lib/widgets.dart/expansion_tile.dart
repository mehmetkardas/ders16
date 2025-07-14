import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  final PageStorageKey expansionKey;
  const ExpansionTilePage({required this.expansionKey, super.key});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.expansionKey,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey(index),
          title: Text("Başlık ${index + 1}"),
          leading: Icon(Icons.wb_sunny),
          //trailing=sağ köşedeki ikonu değiştirir
          //initiallyExpanded: true, normalde false gelir hepsini açık getirir.
          //maintainState: normalde false gelir true yaparsak açışlan kutu kapandıgında içerik sıfırlanır
          //tilePadding:Başlık alanını içini doldur.
          children: [
            Container(
              height: 300,
              color: index % 2 == 0 ? Colors.red : Colors.yellow.shade400,
            ),
          ],
        );
      },
    );
  }
}
