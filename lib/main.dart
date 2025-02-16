// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';

// void main() {
//   runApp(GroomingApp());
// }

// class GroomingApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Select Gromming Type"),
//       ),
//       body: Center(
//         child:Column(
//           children: [
//             ElevatedButton(onPressed: (){
//               Navigator.push(
//                 context, 
//                 MaterialPageRoute(builder:(context) => MainScreen(),
//               ),
//               );

//             }, 
//             child: Text("Men's Gromming"),
//             ),
//              ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MainScreen(),
//                   ),
//                 );
//               },
//               child: Text("Women's Grooming"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void checkAsset() async {
//   try {
//     await rootBundle.load('assets/images/test.jpg');
//     print('✅ Asset found!');
//   } catch (e) {
//     print('❌ Asset not found: $e');
//   }
// }

// void main() {
//   checkAsset();
//   runApp(GroomingApp());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  checkAsset(); // Run asset check after initialization
  runApp(GroomingApp());
}

void checkAsset() async {
  try {
    await rootBundle.load('assets/test.jpg');
    print('✅ Asset found!');
  } catch (e) {
    print('❌ Asset not found: $e');
  }
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Gromming Type"),
      ),
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
            // Add other widgets below the banner
          ],
      ),
    );
  }
}
