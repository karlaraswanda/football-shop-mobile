import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: const Color(0xFF34699A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF5AA),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF7A6400),
                        ),
                      ),
                    ),

                  // Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF113F67),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Category and Brand
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF34699A),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Brand: ${product.brand}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Stock & size
                  Row(
                    children: [
                      Icon(Icons.inventory_2,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        'Stock: ${product.stock} • Size: ${product.size}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Price
                  Text(
                    'Price: ${product.price}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Full description
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),

                  // Seller info
                  if (product.userUsername != null)
                    Text(
                      'Seller: ${product.userUsername}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  
                  // ID dan User ID
                  const SizedBox(height: 8),
                  Text(
                    'ID: ${product.id}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  if (product.userId != null)
                    Text(
                      'User ID: ${product.userId}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}