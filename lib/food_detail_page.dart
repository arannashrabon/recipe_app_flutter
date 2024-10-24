import 'package:flutter/material.dart';
import 'food_info_page.dart';

class FoodDetailPage extends StatelessWidget {
  final String foodName;

  FoodDetailPage({required this.foodName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          foodName,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  _getImageForFood(foodName),
                  width: double.infinity,
                  height: isLargeScreen ? 300 : 200, // Responsive height
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: isLargeScreen ? 300 : 200,
                      color: Colors.grey.shade300,
                      child: Icon(Icons.error, size: 50, color: Colors.red),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                foodName,
                style: TextStyle(
                  fontSize: isLargeScreen ? 32 : 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "This is a delicious $foodName, prepared with high-quality ingredients to ensure a perfect balance of taste and nutrition. A must-try for food lovers!",
                style: TextStyle(
                  fontSize: isLargeScreen ? 18 : 16,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.deepOrange, // Updated for null safety
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodInfoPage(
                          foodName: foodName,
                          imageUrl: _getImageForFood(foodName),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Details about $foodName',
                    style: TextStyle(
                      fontSize: isLargeScreen ? 22 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getImageForFood(String foodName) {
    switch (foodName) {
      case 'Pizza':
        return 'assets/pizzarecipe.jpg';
      case 'Burger':
        return 'assets/burgerrecipe.jpg';
      case 'Pasta':
        return 'assets/pastarecipe.jpg';
      case 'Momo':
        return 'assets/momorecipe.jpg';
      default:
        return '';
    }
  }
}
