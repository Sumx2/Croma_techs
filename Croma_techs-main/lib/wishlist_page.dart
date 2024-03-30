// import 'package:flutter/material.dart';
//
// class WishlistPage extends StatefulWidget {
//   @override
//   _WishlistPageState createState() => _WishlistPageState();
// }
//
// class _WishlistPageState extends State<WishlistPage> {
//   // Define a list of image paths for your wishlist
//   List<String> wishlistImages = [
//     'assets/wishlist_image1.jpg',
//     'assets/wishlist_image2.jpg',
//     'assets/wishlist_image3.jpg',
//     // Add more image paths as needed
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             // Display the current wishlist image
//             Image.asset(
//               wishlistImages[currentIndex],
//               fit: BoxFit.cover,
//             ),
//             // Add a button to navigate to the next image
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   if (currentIndex < wishlistImages.length - 1) {
//                     currentIndex++;
//                   }
//                 });
//               },
//               child: Text('Next Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











//
//
//
// import 'package:flutter/material.dart';
//
// // Define a data model for wishlist items
// class WishlistItem {
//   final String imagePath;
//   final String productName;
//
//   WishlistItem({required this.imagePath, required this.productName});
// }
//
// class WishlistPage extends StatefulWidget {
//   // Declare a list to store wishlist items
//   final List<WishlistItem> wishlistItems;
//
//   WishlistPage({required this.wishlistItems});
//
//   @override
//   _WishlistPageState createState() => _WishlistPageState();
// }
//
// class _WishlistPageState extends State<WishlistPage> {
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             // Display the current wishlist image
//             Image.network(
//               widget.wishlistItems[currentIndex].imagePath,
//               fit: BoxFit.cover,
//             ),
//             // Add a button to navigate to the next image
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   if (currentIndex < widget.wishlistItems.length - 1) {
//                     currentIndex++;
//                   }
//                 });
//               },
//               child: Text('Next Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
//
// // Define a data model for wishlist items
// class WishlistItem {
//   final String imagePath;
//   final String productName;
//
//   WishlistItem({required this.imagePath, required this.productName});
// }
//
// class WishlistPage extends StatefulWidget {
//   // Declare a list to store wishlist items
//   final List<WishlistItem> wishlistItems;
//
//   WishlistPage({required this.wishlistItems});
//
//   @override
//   _WishlistPageState createState() => _WishlistPageState();
// }
//
// class _WishlistPageState extends State<WishlistPage> {
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             // Display the current wishlist image if it exists
//             if (widget.wishlistItems.isNotEmpty && currentIndex < widget.wishlistItems.length)
//               Image.network(
//                 widget.wishlistItems[currentIndex].imagePath,
//                 fit: BoxFit.cover,
//               ),
//             // Add a button to navigate to the next image
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   // Increment currentIndex only if it's within the valid range
//                   if (widget.wishlistItems.isNotEmpty && currentIndex < widget.wishlistItems.length - 1) {
//                     currentIndex++;
//                   }
//                 });
//               },
//               child: Text('Next Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

class WishlistItem {
  final String imagePath;

  WishlistItem({required this.imagePath});
}

class WishlistPage extends StatefulWidget {
  final List<WishlistItem> wishlistItems;

  WishlistPage({required this.wishlistItems});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Center(
        child: Column(
          children: [
            // Display the current wishlist image if it exists
            if (widget.wishlistItems.isNotEmpty &&
                currentIndex < widget.wishlistItems.length)
              Image.network(
                widget.wishlistItems[currentIndex].imagePath,
                fit: BoxFit.cover,
              ),
            // Add a button to navigate to the next image
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Increment currentIndex only if it's within the valid range
                  if (widget.wishlistItems.isNotEmpty &&
                      currentIndex < widget.wishlistItems.length - 1) {
                    currentIndex++;
                  }
                });
              },
              child: Text('Next Image'),
            ),
          ],
        ),
      ),
    );
  }
}



