import 'package:flutter/material.dart';

class SettingsExpansionMenu extends StatefulWidget {
  const SettingsExpansionMenu({super.key});

  @override
  State<SettingsExpansionMenu> createState() => _SettingsExpansionMenuState();
}

class _SettingsExpansionMenuState extends State<SettingsExpansionMenu> {
  //ayarları kontrol eden değişkenler
  bool notificationsEnabled = true;
  bool darkMode = false;
  bool fingerPrintEnabled = false;
  bool autoSync = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: const Text("Bildirimler"),
          leading: const Icon(Icons.notifications),
          children: [
            SwitchListTile(
              title: Text("Bilidirmleri Aç"),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),

            SwitchListTile(
              title: Text("Otomatik Senkronizasyon"),
              value: autoSync,
              onChanged: (value) {
                setState(() {
                  autoSync = value;
                });
              },
            ),
          ],
        ),

        ExpansionTile(
          title: const Text("Tema"),
          leading: const Icon(Icons.color_lens),
          children: [
            SwitchListTile(
              title: Text("Karanlık Mod"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ],
        ),

        ExpansionTile(
          title: const Text("Güvenlik"),
          leading: const Icon(Icons.security),
          children: [
            SwitchListTile(
              title: Text("Parmak izi ile Giriş"),
              value: fingerPrintEnabled,
              onChanged: (value) {
                setState(() {
                  fingerPrintEnabled = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
