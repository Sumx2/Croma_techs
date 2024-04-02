// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'wishlist_page.dart'; // Import the WishlistPage
// // import 'edit_profile_page.dart'; // Import the EditProfilePage
// //
// // class UserProfilePage extends StatefulWidget {
// //   @override
// //   _UserProfilePageState createState() => _UserProfilePageState();
// // }
// //
// // class _UserProfilePageState extends State<UserProfilePage> {
// //   User? _user; // User object to store current user
// //   String _username = ''; // Store the current username
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _getUserInfo(); // Fetch user information when the widget initializes
// //   }
// //
// //   // Method to fetch user information
// //   void _getUserInfo() {
// //     User? user = FirebaseAuth.instance.currentUser;
// //     setState(() {
// //       _user = user;
// //       // Set the initial username
// //       _username = _user?.displayName ?? '';
// //     });
// //   }
// //
// //   // Method to handle edit profile button press
// //   void _editProfile() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => EditProfilePage(
// //           onUsernameChanged: (newUsername) {
// //             setState(() {
// //               _username = newUsername; // Update the username
// //             });
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User Profile'),
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background image and other UI elements
// //           Image.asset(
// //             'assets/wave.png', // Adjust path according to your image location
// //             fit: BoxFit.cover,
// //             width: double.infinity,
// //             height: double.infinity,
// //           ),
// //           Center(
// //             child: _user != null
// //                 ? Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Container(
// //                   width: 120,
// //                   height: 120,
// //                   decoration: BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     image: DecorationImage(
// //                       image: AssetImage('assets/croma_final.jpg'), // Placeholder profile image
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 16),
// //                 Text(
// //                   'Username: $_username', // Display the username
// //                   style: TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white, // Text color set to white
// //                   ),
// //                 ),
// //                 SizedBox(height: 16),
// //                 Text(
// //                   'Email: ${_user!.email}',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white, // Text color set to white
// //                   ),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Text(
// //                   'UID: ${_user!.uid}',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white, // Text color set to white
// //                   ),
// //                 ),
// //                 SizedBox(height: 16),
// //                 ElevatedButton(
// //                   onPressed: _editProfile,
// //                   child: Text('Edit Profile'),
// //                 ),
// //                 SizedBox(height: 16),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => WishlistPage()), // Navigate to WishlistPage
// //                     );
// //                   },
// //                   child: Text('My Wishlist'),
// //                 ),
// //               ],
// //             )
// //                 : CircularProgressIndicator(), // Show loading indicator while user info is being fetched
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'wishlist_page.dart'; // Import the WishlistPage
// import 'edit_profile_page.dart'; // Import the EditProfilePage
//
// class UserProfilePage extends StatefulWidget {
//   @override
//   _UserProfilePageState createState() => _UserProfilePageState();
// }
//
// class _UserProfilePageState extends State<UserProfilePage> {
//   User? _user; // User object to store current user
//   String _username = 'John Doe'; // Default username
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserInfo(); // Fetch user information when the widget initializes
//   }
//
//   // Method to fetch user information
//   void _getUserInfo() {
//     User? user = FirebaseAuth.instance.currentUser;
//     setState(() {
//       _user = user;
//     });
//   }
//
//   // Method to update username
//   void _updateUsername(String newUsername) {
//     setState(() {
//       _username = newUsername;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditProfilePage(username: _username, onUpdate: _updateUsername)),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Image.asset(
//             'assets/background.jpg',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Center(
//             child: _user != null
//                 ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Profile Picture
//                 Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('assets/croma_final.jpg'), // Placeholder profile image
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Username
//                 Text(
//                   _username,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Email
//                 Text(
//                   'Email: ${_user!.email}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // UID
//                 Text(
//                   'UID: ${_user!.uid}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 // My Wishlist Button
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => WishlistPage()),
//                     );
//                   },
//                   child: Text('My Wishlist'),
//                 ),
//               ],
//             )
//                 : CircularProgressIndicator(), // Show loading indicator while user info is being fetched
//           ),
//         ],
//       ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'wishlist_page.dart'; // Import the WishlistPage
import 'edit_profile_page.dart'; // Import the EditProfilePage

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  User? _user; // User object to store current user
  late String _username; // Variable to store the username

  @override
  void initState() {
    super.initState();
    _getUserInfo(); // Fetch user information when the widget initializes
  }

  // Method to fetch user information
  void _getUserInfo() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
        _username = user.displayName ?? ''; // Get the username from user's display name
      });
    }
  }

  // Method to update the username
  void _updateUsername(String newUsername) {
    setState(() {
      _username = newUsername;
    });
    _user?.updateDisplayName(newUsername); // Update display name in Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/wave.png', // Adjust path according to your image location
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: _user != null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/croma_final.jpg'), // Placeholder profile image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _username,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color set to white
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Email: ${_user!.email}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Text color set to white
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'UID: ${_user!.uid}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Text color set to white
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WishlistPage(wishlistItems: []),
                      ),
                    ); // Navigate to WishlistPage
                  },
                  child: Text('My Wishlist'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final updatedUsername = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          username: _username,
                          onUpdate: _updateUsername,
                        ),
                      ),
                    ); // Navigate to EditProfilePage and wait for result
                    if (updatedUsername != null) {
                      _updateUsername(updatedUsername); // Update username if changed
                    }
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            )
                : CircularProgressIndicator(), // Show loading indicator while user info is being fetched
          ),
        ],
      ),
    );
  }
}

