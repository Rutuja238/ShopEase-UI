import 'package:flutter/material.dart';

void main() {
  runApp(GroomingApp());
}

class GroomingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDrawerOpen = false; // State to track drawer visibility

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Grooming Type"),
        leading: IconButton(
          icon: Icon(isDrawerOpen ? Icons.close : Icons.menu),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
      ),
      body: Row(
        children: [
          // Sidebar (Toggles visibility)
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isDrawerOpen ? screenWidth * 0.2 : 0, // Collapsible
            color: Colors.grey[200],
            child: isDrawerOpen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCircleAvatar("assets/images/hair color.jpg", "Hair Color"),
                      _buildCircleAvatar("assets/images/hair cut.jpg", "Hair Cut"),
                      _buildCircleAvatar("assets/images/nails.jpg", "Nails"),
                      _buildCircleAvatar("assets/images/Massage.jpg", "Massage"),
                    ],
                  )
                : SizedBox(), // Hide drawer when closed
          ),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search for Services...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Men & Women Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: Text("Men"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                          child: Text("Women"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Service List
                  Expanded(
                    child: ListView(
                      children: [
                        ServiceCard(service: "Beard Trimming", price: "From ₹200"),
                        ServiceCard(service: "Beard Styling", price: "From ₹350"),
                        ServiceCard(service: "Beard Colour", price: "From ₹750", isCustomizable: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Circular Icons for Sidebar
Widget _buildCircleAvatar(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}

// Service Card
class ServiceCard extends StatelessWidget {
  final String service;
  final String price;
  final bool isCustomizable;

  ServiceCard({required this.service, required this.price, this.isCustomizable = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.cut, color: Colors.blueAccent),
        title: Text(service, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text("ADD"),
        ),
      ),
    );
  }
}
