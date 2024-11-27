import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const DetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['nama']),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(recipe['image'],
                  width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text('Bahan-Bahan:', style: Theme.of(context).textTheme.headline6),
            ...recipe['bahan']
                .map<Widget>((bahan) => Text('- $bahan'))
                .toList(),
            const SizedBox(height: 16),
            Text('Cara Memasak:', style: Theme.of(context).textTheme.headline6),
            ...recipe['cara_masak']
                .map<Widget>((cara) => Text('- $cara'))
                .toList(),
          ],
        ),
      ),
    );
  }
}
