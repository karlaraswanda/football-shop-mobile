import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameC = TextEditingController();
  final _priceC = TextEditingController();
  final _descC = TextEditingController();
  final _thumbC = TextEditingController();

  String _category = 'Shoes';
  bool _isFeatured = false;

  @override
  void dispose() {
    _nameC.dispose();
    _priceC.dispose();
    _descC.dispose();
    _thumbC.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameC.clear();
    _priceC.clear();
    _descC.clear();
    _thumbC.clear();
    setState(() {
      _category = 'Shoes';
      _isFeatured = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk')),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // NAME
              TextFormField(
                controller: _nameC,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58A0C8), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF34699A), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Name wajib diisi';
                  }
                  if (v.trim().length < 3) {
                    return 'Minimal 3 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // PRICE
              TextFormField(
                controller: _priceC,
                decoration: const InputDecoration(
                labelText: 'Price',
                hintText: 'e.g. 199000',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF58A0C8), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF34699A), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Price wajib diisi';
                  }
                  final n = int.tryParse(v.trim());
                  if (n == null) return 'Harus angka bulat';
                  if (n < 0) return 'Tidak boleh negatif';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // DESCRIPTION
              TextFormField(
                controller: _descC,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58A0C8), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF34699A), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                minLines: 3,
                maxLines: 6,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Description wajib diisi';
                  }
                  if (v.trim().length < 10) {
                    return 'Minimal 10 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // THUMBNAIL
              TextFormField(
                controller: _thumbC,
                decoration: const InputDecoration(
                  labelText: 'Thumbnail URL',
                  hintText: 'https://...',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58A0C8), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF34699A), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                keyboardType: TextInputType.url,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Thumbnail URL tidak boleh kosong';
                  }
                  final uri = Uri.tryParse(v.trim());
                  if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
                    return 'Masukkan URL yang valid (http/https)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // CATEGORY
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58A0C8), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF34699A), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Shoes', child: Text('Shoes')),
                  DropdownMenuItem(value: 'Jersey', child: Text('Jersey')),
                  DropdownMenuItem(value: 'Ball', child: Text('Ball')),
                  DropdownMenuItem(value: 'Accessories', child: Text('Accessories')),
                ],
                onChanged: (val) => setState(() => _category = val!),
              ),
              const SizedBox(height: 8),

              // FEATURED
              SwitchListTile(
                title: const Text('Featured product'),
                value: _isFeatured,
                onChanged: (v) => setState(() => _isFeatured = v),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 16),

              // SAVE BUTTON
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameC.text.trim();
                    final price = int.parse(_priceC.text.trim());
                    final desc = _descC.text.trim();
                    final thumb = _thumbC.text.trim();

                    final response = await request.postJson(
                      "http://localhost:8000/create-flutter/",
                      jsonEncode({
                        "name": name,
                        "price": price,
                        "description": desc,
                        "thumbnail": thumb,
                        "category": _category,
                        "is_featured": _isFeatured,
                        "brand": "",
                        "stock": 0,
                        "size": "",
                      }),
                    );

                    if (!context.mounted) return;

                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Product successfully saved!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Something went wrong, please try again."),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}