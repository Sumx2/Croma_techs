// import 'package:flutter/material.dart';
// import 'homepage.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   String username = '';
//   String password = '';
//
//   void _login() {
//     // Replace this with your authentication logic
//     if (username == '' && password == '') {
//       // Authentication successful, navigate to the main page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(),
//         ),
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Login Failed'),
//             content: Text('Invalid username or password.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: Text(
//                 'Login OR Create Account',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   username = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Email ID or Phone Number',
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   password = value;
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   String username = '';
//   String password = '';
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _login() async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: username,
//         password: password,
//       );
//
//       // If authentication is successful, navigate to the main page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(),
//         ),
//       );
//     } catch (e) {
//       // If authentication fails, show an error dialog
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Login Failed'),
//             content: Text('Invalid username or password.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: Text(
//                 'Login OR Create Account',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   username = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Email ID or Phone Number',
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   password = value;
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'create_acc.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      // If authentication is successful, navigate to the main page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      // If authentication fails, show an error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Login OR Create Account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email ID or Phone Number',
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

}




// import 'package:flutter/material.dart';
// import 'create_acc.dart';
// import 'homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   String username = '';
//   String password = '';
//   String backgroundImageUrl = '';
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchBackgroundImage();
//   }
//
//   Future<void> _fetchBackgroundImage() async {
//     try {
//       String backgroundImagePath = 'gs://croma-techs.appspot.com/login_page.gif';
//       final ref = firebase_storage.FirebaseStorage.instance.ref(backgroundImagePath);
//       backgroundImageUrl = await ref.getDownloadURL();
//       setState(() {});
//     } catch (e) {
//       print('Failed to fetch background image: $e');
//     }
//   }
//
//   Future<void> _login() async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: username,
//         password: password,
//       );
//       // If login successful, you can navigate to the homepage or perform any other action.
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     } catch (e) {
//       // Handle login errors here, such as displaying an error message to the user.
//       print('Failed to login: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Stack(
//         children: [
//           if (backgroundImageUrl.isNotEmpty)
//             Positioned.fill(
//               child: Image.network(
//                 backgroundImageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Text(
//                     'Login OR Create Account',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 32),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       username = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Email ID or Phone Number',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       password = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 32),
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                     child: Text(
//                       'Login',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
