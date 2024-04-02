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
import 'splash_screen.dart'; // Import SplashScreen

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
      // initialRoute: '/home', // Set initial route to splash screen
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
        brightness: Brightness.light, // Default theme is light mode
        // Define other theme properties here if needed
      ),
      darkTheme: ThemeData.dark(), // Define the dark theme
      themeMode: ThemeMode.system, // Use system theme mode
    );
  }
}