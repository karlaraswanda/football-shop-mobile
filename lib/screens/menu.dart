import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_form.dart';

// Model button
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Data button
  final List<ItemHomepage> items = const [
    ItemHomepage("All Products", Icons.list_alt, Colors.blue),  
    ItemHomepage("My Products", Icons.inventory_2, Colors.green), 
    ItemHomepage("Create Product", Icons.add_box, Colors.red), 
  ];

  // Info identitas
  // final String npm = "2406414542";
  // final String nama = "Karla Ameera Raswanda";
  // final String kelas = "PBP E";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 3 info cards
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     InfoCard(title: 'NPM', content: npm),
            //     InfoCard(title: 'Name', content: nama),
            //     InfoCard(title: 'Class', content: kelas),
            //   ],
            // ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Selamat datang di Football Shop',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // Grid
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items.map((item) => ItemCard(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Info Card
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// Button card
class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Snackbar
          String message;
          switch (item.name) {
            case "All Products":
              message = "Kamu telah menekan tombol All Products";
              break;
            case "My Products":
              message = "Kamu telah menekan tombol My Products";
              break;
            case "Create Product":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductFormPage()),
              );
              return;
            default:
              message = "Kamu telah menekan tombol ${item.name}";
          }

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30),
                const SizedBox(height: 6),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}