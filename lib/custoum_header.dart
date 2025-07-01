import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ✅ ADDED: Prevents content from touching the notch or status bar
      child: Container(
        padding: const EdgeInsets.only(bottom: 10), // ✅ ADDED: Spacing below
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8964E), Color(0xFFFCD462)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // ✅ CHANGED: Prevents column from stretching too tall
          children: [
            const SizedBox(height: 10),

            // ✅ CHANGED: Moved "Welcome Back" inside a Padding for cleaner spacing
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // ✅ FIXED OVERFLOW: Used Expanded + TextOverflow.ellipsis + Padding
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ), // ✅ CLEAN: Avoids multiple SizedBoxes
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Mariana Napolitani',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow:
                          TextOverflow.ellipsis, // ✅ PREVENTS TEXT OVERFLOW
                    ),
                  ),
                  _buildIcon(Icons.shopping_bag),
                  const SizedBox(width: 10),
                  _buildIcon(Icons.notifications),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ✅ CHANGED: Cleaned up Search Bar row using Expanded and Padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Here',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildIcon(Icons.tune),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔧 NO CHANGES here, just used in layout
Widget _buildIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Color(0xFFE58F51),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.white),
  );
}
