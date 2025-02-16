import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  runApp(GroomingApp());
}

class GroomingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Gromming Type")),
      body: Column(
        // child: Container(
        //   width: double.infinity, // Full width
        //   height: 300, // Adjust height to match your design
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/banner.jpg"),
        //       fit: BoxFit.cover, // Covers the container nicely
        //     ),
        //   ),
        // ),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full-width banner image
          SizedBox(
            width: double.infinity, // Full width
            child: Image.asset(
              "assets/images/banner.jpg", // Change to your actual asset path
              fit: BoxFit.cover, // Ensures the image fills the width properly
            ),
          ),
          SizedBox(height: 10), // Adjust spacing if needed
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search for services",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // Add other widgets below the banner
          // SizedBox(height: 5), // Spacing

          // Gender Selection Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Men button tap
                  },
                  child: Text("Men"),
                ),
              ),
              SizedBox(width: 10), // Spacing between buttons
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Women button tap
                  },
                  child: Text("Women"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
