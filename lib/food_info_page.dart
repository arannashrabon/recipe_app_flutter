import 'package:flutter/material.dart';

class FoodInfoPage extends StatelessWidget {
  final String foodName;
  final String imageUrl;

  FoodInfoPage({required this.foodName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Delicious $foodName',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two images per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Replace with actual images as needed
                  _buildImageCard(imageUrl),
                  _buildImageCard(imageUrl), // Duplicate for demo purposes
                  _buildImageCard(imageUrl), // Duplicate for demo purposes
                  _buildImageCard(imageUrl), // Duplicate for demo purposes
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This is a delicious $foodName. Enjoy!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              child: Icon(Icons.error, size: 50, color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
