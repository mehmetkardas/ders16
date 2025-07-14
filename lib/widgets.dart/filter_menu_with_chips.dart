import 'package:flutter/material.dart';

class FilterMenuWithChips extends StatefulWidget {
  const FilterMenuWithChips({super.key});

  @override
  State<FilterMenuWithChips> createState() => _FilterMenuWithChipsState();
}

class _FilterMenuWithChipsState extends State<FilterMenuWithChips> {
  final Map<String, List<String>> filters = {
    "Renk": ["Kırmızı", "Mavi", "Yeşil"],
    "Beden": ["S", "M", "L"],
    "Marka": ["Nike", "Adidas", "Puma"],
  };
  final Set<String> selectedFilters = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Seçimi"),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Filtreler",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          //expanisontile liste
          ...filters.entries.map((entry) {
            final kategori = entry.key;
            final secenekler = entry.value;
            return ExpansionTile(
              title: Text(kategori),
              children: secenekler.map((secenek) {
                return CheckboxListTile(
                  title: Text(secenek),
                  value: selectedFilters.contains(secenek),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectedFilters.add(secenek);
                      } else {
                        selectedFilters.remove(secenek);
                      }
                    });
                  },
                );
              }).toList(),
            );
          }).toList(),
          Divider(height: 32),
          Text(
            "Seçilen Filtreler",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedFilters.map((filter) {
              return Chip(
                label: Text(filter),
                onDeleted: () {
                  setState(() {
                    selectedFilters.remove(filter);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
