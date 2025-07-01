import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String store;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.store,
  });
}

class ProductGridScreen extends StatelessWidget {
  ProductGridScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Sun Screen',
      imageUrl: 'assets/images/Bodywash.jpg',

      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
    ),
    Product(
      name: 'Moisturizer',
      imageUrl: 'assets/images/Mosturizer.jpg',

      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
    ),
    Product(
      name: 'Serum',
      imageUrl: 'assets/images/Serum.jpg',

      price: 19.99,
      rating: 4.8,
      store: 'Glow Store',
    ),
    Product(
      name: 'Cleanser',
      imageUrl: 'assets/images/Hair_shampo.jpg',
      price: 24.99,
      rating: 4.7,
      store: 'Beauty Shop',
    ),
    Product(
      name: 'Face Wash',
      imageUrl: 'assets/images/facewash.jpg',

      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
    ),
    Product(
      name: 'Perfume',
      imageUrl: 'assets/images/perfums.jpg',

      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
    ),
    Product(
      name: 'Body Spray',
      imageUrl: 'assets/images/spray.jpg',

      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: product.imageUrl.startsWith('http')
                ? Image.network(
                    product.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    product.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),

          const SizedBox(height: 8),

          // Product Name + Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$ ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // Store Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.store,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 4),

          // Rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  product.rating.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
