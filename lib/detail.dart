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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Header
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    recipe['image'],
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      recipe['nama'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deskripsi
                  Text(
                    recipe['deskripsi'],
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: 24),
                  // Bahan-Bahan
                  ExpansionTile(
                    title: const Text(
                      "Bahan-Bahan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    initiallyExpanded: true,
                    children: recipe['bahan']
                        .asMap()
                        .entries
                        .map<Widget>(
                          (entry) => ListTile(
                            leading: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.green,
                              child: Text(
                                "${entry.key + 1}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            title: Text(
                              entry.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const Divider(thickness: 1),
                  // Cara Memasak
                  ExpansionTile(
                    title: const Text(
                      "Cara Memasak",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    initiallyExpanded: true,
                    children: recipe['cara_masak']
                        .asMap()
                        .entries
                        .map<Widget>(
                          (entry) => ListTile(
                            leading: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.green,
                              child: Text(
                                "${entry.key + 1}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            title: Text(
                              entry.value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
