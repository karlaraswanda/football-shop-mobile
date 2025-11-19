import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Color(0xFF58A0C8)),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF113F67), // brand-900
                  ),
                ),
                const SizedBox(height: 6),

                // Brand & Category
                Text('Brand: ${product.brand}'),
                Text('Category: ${product.category}'),

                const SizedBox(height: 6),

                // Price
                Text(
                  'Price: ${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                // Description preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Featured
                if (product.isFeatured)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDF5AA),
                      borderRadius: BorderRadius.circular(12.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}