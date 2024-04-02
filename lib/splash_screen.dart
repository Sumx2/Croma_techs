// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key); // Corrected constructor
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child:  Text(
//               'Splash Screen',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:croma_techs/create_acc.dart'; // Import CreateAccountPage
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Using a Timer to delay the navigation
//     Timer(Duration(seconds: 5), () {
//       Navigator.pushReplacementNamed(context, '/createAccount');
//     });
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Text(
//             'Splash Screen',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Using a Timer to delay the navigation
//     Timer(Duration(seconds: 5), () {
//       Navigator.pushReplacementNamed(context, '/createAccount');
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.black, // Set background color to black
//       body: Center(
//         child: Container(
//           width: 200, // Adjust width as needed
//           height: 200, // Adjust height as needed
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/croma_final.jpg'), // Image path
//               fit: BoxFit.contain, // Adjust the fit as needed
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using a Timer to delay the navigation
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/createAccount');
    });

    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Container(
          width: 200, // Adjust width as needed
          height: 200, // Adjust height as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/croma.png'), // Image path
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
          ),
        ),
      ),
    );
  }
}
