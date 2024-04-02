import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:croma_techs/create_acc.dart';
//import 'package:croma_techs/television_page.dart';
import 'package:croma_techs/speaker_page.dart';
import 'package:croma_techs/user_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:croma_techs/Mobiles_Page_1.dart';
import 'package:croma_techs/tv.dart';
import 'package:croma_techs/AC_Page.dart';
import 'package:croma_techs/about_us_page.dart';
import 'package:croma_techs/cart_page.dart';
import 'package:croma_techs/contact_page.dart';
import 'package:croma_techs/login_page.dart';
import 'package:croma_techs/search_page.dart';
import 'package:croma_techs/wishlist_page.dart'; // Import the wishlist page

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _imagePaths = [
    'assets/m1.jpg',
    'assets/m2.jpg',
    'assets/m3.jpg',
    'assets/m4.jpg',
    'assets/m5.jpg',
    'assets/m6.jpg',
    'assets/m7.jpg',
    'assets/m8.jpg',
  ];

  final List<String> _imagePaths2 = [
    'assets/m11.jpg',
    'assets/m12.jpg',
    'assets/m13.jpg',
    'assets/m14.jpg',
    'assets/m15.jpg',
    'assets/m16.jpg',
    'assets/m17.jpg',
    'assets/m18.jpg',
  ];

  String _username = 'Guest'; // Variable to store the current username, default to 'Guest'

  @override
  void initState() {
    super.initState();
    _getCurrentUser(); // Call the method to get the current user's username
  }

  // Method to get the current user's username
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _username = user?.displayName ?? 'Guest'; // Set username or 'Guest' if no user is signed in
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CROMA',
          style: TextStyle(color: Colors.greenAccent),
          textAlign: TextAlign.center,
        ), // Text color set to red

        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite), // Heart-shaped button for wishlist
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage(wishlistItems: [],)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle), // Button for user profile
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Hey, $_username', // Displaying the current username
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
            ),
            ListTile(
              title: Text('Mobiles'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MobilesPage(),
                ));
              },
            ),
            ListTile(
              title: Text('Speakers'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SpeakerPage(),
                ));
              },
            ),
            ListTile(
              title: Text('ACs'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ACPage(),
                ));
              },
            ),
            ListTile(
              title: Text('Television'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TelevisionPage(),
                ));
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
                ));
              },
            ),
            ListTile(
              title: Text('User Profile'), // Add User Profile entry
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserProfilePage(),
                ));
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactPage(),
                ));
              },
            ),
            ListTile(
              title: Text('Sign Out'), // Add sign out option
              onTap: () {
                FirebaseAuth.instance.signOut();
                _username = 'Guest'; // Reset username to 'Guest' on sign out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountPage(), // Navigate to LoginPage
                  ),
                );
                // Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: _imagePaths.map((imagePath) {
                return Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 4.27 / 1, // Assuming images have a 16:9 aspect ratio
                height: 185.7,
                viewportFraction: 1,
                enlargeCenterPage: false,
                pauseAutoPlayOnTouch: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/img4i.jpg',
                      label: 'Mobiles',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MobilesPage(),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/tvfinal.jpg',
                      label: 'Television',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TelevisionPage(),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/speakerss.jpg',
                      label: 'Speakers',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SpeakerPage(),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/aci.jpg',
                      label: 'ACs',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ACPage(),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/li.jpg',
                      label: 'Laptops',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircularWidget(
                      imagePath: 'assets/ear.jpg',
                      label: 'Earphones',
                      radius: 50,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Get 20% off on selected Mobiles.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey, // Text color set to red
                ),
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              items: _mobileImageUrls.map((imageUrl) {
                return Image.network(imageUrl);
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Highlights',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey, // Text color set to red
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: (_imagePaths2.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                int startIndex = index * 2;
                int endIndex = (index * 2) + 2;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = startIndex; i < endIndex && i < _imagePaths2.length; i++)
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Image.asset(_imagePaths2[i]),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87, // Set background color of the body to black
    );
  }
}

class CircularWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  CircularWidget({required this.imagePath, required this.label, required this.onTap, required int radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent, // Text color set to red
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> _mobileImageUrls = [
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile1.jpg?alt=media&token=7c1aa12f-128b-4681-8bf8-bca57737609b',
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile1.webp?alt=media&token=4537c33c-c70a-4c73-adb7-8553fa34b2ce',
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile2.webp?alt=media&token=08fec1f4-963f-4c3f-9e1f-2673aeca30b9',
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile3.webp?alt=media&token=993597a1-45e0-4ea5-87c2-d6fab12370b3',
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile4.webp?alt=media&token=3fc11d14-c876-44e4-939d-cbcc087b3b79',
  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fmobile5.webp?alt=media&token=ae6c33e4-f2ec-418f-b65f-54fd2244aa67',
];
