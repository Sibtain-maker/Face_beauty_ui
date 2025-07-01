import 'package:flutter/material.dart';

// Product Model
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String store;
  final String category;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.store,
    required this.category,
  });
}

// Main Grid Screen
class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({super.key});

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Face',
    'Hair',
    'Body',
    'Skin',
    'Nail',
  ];

  final List<Product> allProducts = [
    Product(
      name: 'Sun Screen',
      imageUrl: 'assets/images/Bobywash.jpg',
      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
      category: 'Face',
    ),
    Product(
      name: 'Moisturizer',
      imageUrl: 'assets/images/Mosturizer.jpg',
      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
      category: 'Skin',
    ),
    Product(
      name: 'Serum',
      imageUrl: 'assets/images/Serum.jpg',
      price: 19.99,
      rating: 4.8,
      store: 'Glow Store',
      category: 'Face',
    ),
    Product(
      name: 'Cleanser',
      imageUrl: 'assets/images/Hair_shampo.jpg',
      price: 24.99,
      rating: 4.7,
      store: 'Beauty Shop',
      category: 'Hair',
    ),
    Product(
      name: 'Face Wash',
      imageUrl: 'assets/images/facewash.jpg',
      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
      category: 'Face',
    ),
    Product(
      name: 'Perfume',
      imageUrl: 'assets/images/perfums.jpg',
      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
      category: 'Body',
    ),
    Product(
      name: 'Body Spray',
      imageUrl: 'assets/images/spray.jpg',
      price: 29.99,
      rating: 4.9,
      store: 'Fauget Store',
      category: 'Body',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // this logic
    List<Product> filteredProducts = selectedCategory == 'All'
        ? allProducts
        : allProducts
              .where((product) => product.category == selectedCategory)
              .toList();

    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                bool isSelected = selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: const Color(0xFFFFB74D),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: filteredProducts[index]);
            },
          ),
        ],
      ),
    );
  }
}

// Product Card UI
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
            child: Image.asset(
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
                  '\$${product.price.toStringAsFixed(2)}',
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
