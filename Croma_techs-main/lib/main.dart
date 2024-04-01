// import 'package:croma_techs/wishlist_page.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// // Import your custom pages
// import 'Mobiles_Page_1.dart';
// import 'about_us_page.dart';
// import 'cart_model.dart';
// import 'contact_page.dart';
// import 'create_acc.dart';
// import 'firebase_options.dart';
// import 'login_page.dart';
// import 'cart_page.dart';
// import 'homepage.dart';
// // import 'speakers_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Homepage',
//       initialRoute: '/', // Add this line
//       routes: {
//         '/': (context) => CreateAccountPage(),
//         '/CreateAccountPage': (context) => LoginPage(),
//         '/cart': (context) => CartPage(),
//         '/login': (context) => HomePage(),
//         '/contact': (context) => ContactPage(),
//         '/about': (context) => AboutUsPage(),
//         '/wishlist': (context) => WishlistPage(),
//       },
//     );
//   }
// }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:croma_techs/wishlist_page.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// // Import your custom pages
// import 'Mobiles_Page_1.dart';
// import 'about_us_page.dart';
// import 'cart_model.dart';
// import 'contact_page.dart';
// import 'create_acc.dart';
// import 'firebase_options.dart';
// import 'login_page.dart';
// import 'cart_page.dart';
// import 'homepage.dart';
// import 'splash_screen.dart'; // Import SplashScreen
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Homepage',
//       initialRoute: '/splash', // Set initial route to splash screen
//       routes: {
//         '/splash': (context) => SplashScreen(), // Route to SplashScreen
//         '/createAccount': (context) => CreateAccountPage(), // Added a route for CreateAccountPage
//         '/login': (context) => LoginPage(),
//         '/cart': (context) => CartPage(),
//         '/contact': (context) => ContactPage(),
//         '/about': (context) => AboutUsPage(),
//         '/wishlist': (context) => WishlistPage(wishlistItems: [],),
//         '/home': (context) => HomePage(), // Added a route for HomePage
//       },
//     );
//   }
// }
//
//
//
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: SplashScreen(), // Directly start with SplashScreen
// //   ));
// // }
// //
// // class SplashScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Simulate some loading time with Future.delayed
// //     Future.delayed(Duration(seconds: 2), () {
// //       // After 2 seconds, navigate to the HomePage
// //       Navigator.of(context).pushReplacement(
// //         MaterialPageRoute(builder: (context) => HomePage()),
// //       );
// //     });
// //
// //     return Scaffold(
// //       body: Center(
// //         // Display any splash screen UI, like your logo
// //         child: Text('Splash Screen'),
// //       ),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home'),
// //       ),
// //       body: Center(
// //         child: Text('HomePage'),
// //       ),
// //     );
// //   }
// // }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:croma_techs/wishlist_page.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// // Import your custom pages
// import 'Mobiles_Page_1.dart';
// import 'about_us_page.dart';
// import 'cart_model.dart';
// import 'contact_page.dart';
// import 'create_acc.dart';
// import 'firebase_options.dart';
// import 'login_page.dart';
// import 'cart_page.dart';
// import 'homepage.dart';
// import 'splash_screen.dart'; // Import SplashScreen
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Homepage',
//       initialRoute: '/splash', // Set initial route to splash screen
//       routes: {
//         '/splash': (context) => SplashScreen(), // Route to SplashScreen
//         '/createAccount': (context) => CreateAccountPage(), // Added a route for CreateAccountPage
//         '/login': (context) => LoginPage(),
//         '/cart': (context) => CartPage(),
//         '/contact': (context) => ContactPage(),
//         '/about': (context) => AboutUsPage(),
//         '/wishlist': (context) => WishlistPage(wishlistItems: [],),
//         '/home': (context) => HomePage(), // Added a route for HomePage
//       },
//       theme: ThemeData(
//         brightness: Brightness.dark, // Default theme is light mode
//         // Define other theme properties here if needed
//       ),
//       darkTheme: ThemeData.dark(), // Define the dark theme
//       themeMode: ThemeMode.system, // Use system theme mode
//     );
//   }
// }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:croma_techs/wishlist_page.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// // Import your custom pages
// import 'Mobiles_Page_1.dart';
// import 'about_us_page.dart';
// import 'cart_model.dart';
// import 'contact_page.dart';
// import 'create_acc.dart';
// import 'firebase_options.dart';
// import 'login_page.dart';
// import 'cart_page.dart';
// import 'homepage.dart';
// import 'splash_screen.dart';
// import 'tv.dart';
// // Import SplashScreen
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Homepage',
//       initialRoute: '/splash', // Set initial route to splash screen
//       routes: {
//         '/splash': (context) => SplashScreen(), // Route to SplashScreen
//         '/createAccount': (context) => CreateAccountPage(), // Added a route for CreateAccountPage
//         '/login': (context) => LoginPage(),
//         '/cart': (context) => CartPage(),
//         '/contact': (context) => ContactPage(),
//         '/about': (context) => AboutUsPage(),
//         '/wishlist': (context) => WishlistPage(wishlistItems: [],),
//         '/home': (context) => HomePage(), // Added a route for HomePage
//       },
//       theme: ThemeData(
//         brightness: Brightness.dark, // Default theme is light mode
//         // Define other theme properties here if needed
//       ),
//       darkTheme: ThemeData.dark(), // Define the dark theme
//       themeMode: ThemeMode.system, // Use system theme mode
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:croma_techs/wishlist_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Import your custom pages
import 'Mobiles_Page_1.dart';
import 'about_us_page.dart';
import 'cart_model.dart';
import 'contact_page.dart';
import 'create_acc.dart';
import 'firebase_options.dart';
import 'login_page.dart';
import 'cart_page.dart';
import 'homepage.dart';
import 'splash_screen.dart';
import 'tv.dart';
// Import SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Homepage',
      initialRoute: '/splash', // Set initial route to splash screen
      routes: {
        '/splash': (context) => SplashScreen(), // Route to SplashScreen
        '/createAccount': (context) => CreateAccountPage(), // Added a route for CreateAccountPage
        '/login': (context) => LoginPage(),
        '/cart': (context) => CartPage(),
        '/contact': (context) => ContactPage(),
        '/about': (context) => AboutUsPage(),
        '/wishlist': (context) => WishlistPage(wishlistItems: [],),
        '/home': (context) => HomePage(), // Added a route for HomePage
      },
      theme: ThemeData(
        brightness: Brightness.dark, // Default theme is light mode
        // Define other theme properties here if needed
      ),
      darkTheme: ThemeData.dark(), // Define the dark theme
      themeMode: ThemeMode.system, // Use system theme mode
    );
  }
}

// Inside your LoginPage after successful authentication
void _onLoginSuccess(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home');
}

