// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'login_page.dart';
//
// class CreateAccountPage extends StatefulWidget {
//   @override
//   _CreateAccountPageState createState() => _CreateAccountPageState();
// }
//
// class _CreateAccountPageState extends State<CreateAccountPage> {
//   String email = '';
//   String password = '';
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _createAccount() async {
//     try {
//       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // If account creation is successful, navigate to the login page
//       // If account creation is successful, navigate to the login page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginPage(), // Navigate to LoginPage
//         ),
//       );
//       // Navigator.pop(context); // Go back to the login page
//     } catch (e) {
//       // If account creation fails, show an error dialog
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Account Creation Failed'),
//             content: Text('Error: $e'),
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
//         title: Text('Create Account'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   email = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Email',
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
//               onPressed: _createAccount,
//               child: Text('Create Account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'login_page.dart';
//
// class CreateAccountPage extends StatefulWidget {
//   @override
//   _CreateAccountPageState createState() => _CreateAccountPageState();
// }
//
// class _CreateAccountPageState extends State<CreateAccountPage> {
//   String email = '';
//   String password = '';
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _createAccount() async {
//     try {
//       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // If account creation is successful, navigate to the login page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginPage(), // Navigate to LoginPage
//         ),
//       );
//     } catch (e) {
//       // If account creation fails, show an error dialog
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Account Creation Failed'),
//             content: Text('Error: $e'),
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
//   void _navigateToLoginPage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginPage(), // Navigate to LoginPage
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Account'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   email = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Email',
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
//               onPressed: _createAccount,
//               child: Text('Create Account'),
//             ),
//             SizedBox(height: 8),
//             TextButton(
//               onPressed: _navigateToLoginPage,
//               child: Text('Already have an account? Log in'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String email = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _createAccount() async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If account creation is successful, navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(), // Navigate to LoginPage
        ),
      );
    } catch (e) {
      // If account creation fails, show an error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Account Creation Failed'),
            content: Text('Error: $e'),
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

  void _navigateToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(), // Navigate to LoginPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/omg.jpg'), // Provide the path to your image here
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createAccount,
                child: Text('Create Account'),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: _navigateToLoginPage,
                child: Text('Already have an account? Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}