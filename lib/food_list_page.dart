import 'package:flutter/material.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  final List<Map<String, String>> foods = [
    {"name": "Pizza", "imageUrl": "assets/pizzarecipe.jpg"},
    {"name": "Burger", "imageUrl": "assets/burgerrecipe.jpg"},
    {"name": "Pasta", "imageUrl": "assets/pastarecipe.jpg"},
    {"name": "Momo", "imageUrl": "assets/momorecipe.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine if we should use grid layout based on screen width
    final isLargeScreen = screenWidth > 600; // Change to grid if width > 600px

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Journey Through Flavors',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: isLargeScreen
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 900
                      ? 3
                      : 2, // 2 or 3 columns based on width
                  childAspectRatio:
                      0.75, // Aspect ratio for card (adjust height)
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return buildFoodCard(context, food);
                },
              )
            : ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return buildFoodCard(context, food);
                },
              ),
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, Map<String, String> food) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(foodName: food["name"]!),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                food["imageUrl"]!,
                width: double.infinity,
                height: screenWidth > 600
                    ? 200
                    : 180, // Larger images on bigger screens
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: screenWidth > 600 ? 200 : 180,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.error, size: 50, color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food["name"]!,
                    style: TextStyle(
                      fontSize: screenWidth > 600
                          ? 26
                          : 22, // Larger font for large screens
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Tap to view details",
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16,
                      color: Colors.grey.shade600,
                    ),
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
