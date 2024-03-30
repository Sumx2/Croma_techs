// import 'package:flutter/material.dart';
//
// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'About Our App CROMA',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'At Croma, were passionate about bringing the latest and greatest electronic gadgets to your fingertips. \n\nWith a commitment to innovation and quality, we aim to enhance your tech-savvy lifestyle. \n\nExplore our wide range of products, from cutting-edge smartphones to state-of-the-art home appliances. \n\nWere your trusted destination for all things electronic. ',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               '\n\n\nDiscover more about our journey at www.croma.com.',
//               style: TextStyle(fontSize: 25),
//             ),
//             // Add more information about your app or organization as needed
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wave.png'), // Background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'About Our App CROMA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'At Croma, we\'re passionate about bringing the latest and greatest electronic gadgets to your fingertips. \n\nWith a commitment to innovation and quality, we aim to enhance your tech-savvy lifestyle. \n\nExplore our wide range of products, from cutting-edge smartphones to state-of-the-art home appliances. \n\nWe\'re your trusted destination for all things electronic.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Discover more about our journey at www.croma.com.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Add more information about your app or organization as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
