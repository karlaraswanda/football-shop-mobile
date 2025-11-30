import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF34699A),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Football Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Menu utama',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // HOME
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF113F67)),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Color(0xFF113F67),
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MyHomePage()),
              );
            },
          ),

          // TAMBAH PRODUK
          ListTile(
            leading: const Icon(Icons.add, color: Color(0xFF113F67)),
            title: const Text(
              'Tambah Produk',
              style: TextStyle(
                color: Color(0xFF113F67),
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProductFormPage()),
              );
            },
          ),

          // PRODUCT LIST
          ListTile(
            leading: const Icon(Icons.inventory_2, color: Color(0xFF113F67)),
            title: const Text(
              'Product List',
              style: TextStyle(
                color: Color(0xFF113F67),
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductEntryListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}