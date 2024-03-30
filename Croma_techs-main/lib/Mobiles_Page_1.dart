// import 'package:flutter/material.dart';
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   // Define a variable to track the like button state for each item
//   List<bool> isLiked = List.filled(12, false);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(0.5),
//                   child: GridView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 0.1,
//                       mainAxisSpacing: 4.0,
//                     ),
//                     itemCount: 12,
//                     itemBuilder: (context, index) {
//                       List<String> imagePaths = [
//                         'assets/m16.jpg',
//                         'assets/m15.jpg',
//                         'assets/m14.jpg',
//                         'assets/m13.jpg',
//                         'assets/m12.jpg',
//                         'assets/m11.jpg',
//                         'assets/m10.jpg',
//                         'assets/m9.jpg',
//                         'assets/m17.jpg',
//                         'assets/m18.jpg',
//                         'assets/m19.jpg',
//                         'assets/m20.jpg',
//                       ];
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             // Navigate to a new detail page when a container is clicked
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => MobileDetailsPage(imagePath: imagePaths[index]),
//                             ));
//                           },
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Image.asset(imagePaths[index]),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                       color: isLiked[index] ? Colors.red : null,
//                                     ),
//                                     onPressed: () {
//                                       // Toggle the like button state and display a message
//                                       setState(() {
//                                         isLiked[index] = !isLiked[index];
//                                         if (isLiked[index]) {
//                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                             content: Text('Added to Wishlist!'),
//                                           ));
//                                         }
//                                       });
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_cart),
//                                     onPressed: () {
//                                       // Handle add to cart button press
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
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
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.asset(imagePath),
//       ),
//     );
//   }
// }




//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   // Define a variable to track the like button state for each item
//   List<bool> isLiked = List.filled(12, false);
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<String>>(
//               future: _fetchProductImages(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       String imagePath = snapshot.data![index];
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             // Navigate to a new detail page when a container is clicked
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => MobileDetailsPage(imagePath: imagePath),
//                             ));
//                           },
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Image.network(imagePath),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                       color: isLiked[index] ? Colors.red : null,
//                                     ),
//                                     onPressed: () {
//                                       // Toggle the like button state and display a message
//                                       setState(() {
//                                         isLiked[index] = !isLiked[index];
//                                         if (isLiked[index]) {
//                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                             content: Text('Added to Wishlist!'),
//                                           ));
//                                         }
//                                       });
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_cart),
//                                     onPressed: () {
//                                       // Handle add to cart button press
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to fetch product images from Firebase Storage
//   Future<List<String>> _fetchProductImages() async {
//     List<String> imageUrls = [];
//     try {
//       for (int i = 1; i <= 12; i++) {
//         String imagePath = 'products/product$i.jpg';
//         String downloadUrl = await _storage.ref(imagePath).getDownloadURL();
//         imageUrls.add(downloadUrl);
//       }
//     } on FirebaseException catch (e) {
//       print('Error fetching product images: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product images. Please try again later.',
//       );
//     }
//     return imageUrls;
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.network(imagePath),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   // Define a variable to track the like button state for each item
//   List<bool> isLiked = List.filled(12, false);
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<String>>(
//               future: _fetchProductImages(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       // Use the provided image URL
//                       String imagePath = 'gs://croma-techs.appspot.com/iphone-15-finish-select-202309-6-1inch-blue.jpeg';
//
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             // Navigate to a new detail page when a container is clicked
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => MobileDetailsPage(imagePath: imagePath),
//                             ));
//                           },
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Image.network(imagePath),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                       color: isLiked[index] ? Colors.red : null,
//                                     ),
//                                     onPressed: () {
//                                       // Toggle the like button state and display a message
//                                       setState(() {
//                                         isLiked[index] = !isLiked[index];
//                                         if (isLiked[index]) {
//                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                             content: Text('Added to Wishlist!'),
//                                           ));
//                                         }
//                                       });
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_cart),
//                                     onPressed: () {
//                                       // Handle add to cart button press
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to fetch product images from Firebase Storage
//   Future<List<String>> _fetchProductImages() async {
//     List<String> imageUrls = [];
//     try {
//       for (int i = 1; i <= 12; i++) {
//         // Use the provided image URL
//         String imagePath = 'gs://croma-techs.appspot.com/iphone-15-finish-select-202309-6-1inch-blue.jpeg';
//         imageUrls.add(imagePath);
//       }
//     } on FirebaseException catch (e) {
//       print('Error fetching product images: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product images. Please try again later.',
//       );
//     }
//     return imageUrls;
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.network(imagePath),
//       ),
//     );
//   }
// }













//
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   // Define a variable to track the like button state for each item
//   List<bool> isLiked = List.filled(12, false);
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<String>>(
//               future: _fetchProductImages(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       // Use the provided image URL
//                       String imagePath = 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/iphone-15-finish-select-202309-6-1inch-blue.jpeg?alt=media&token=6770dc1b-222e-426e-8824-a91785c1e7e7';
//
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             // Navigate to a new detail page when a container is clicked
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => MobileDetailsPage(imagePath: imagePath),
//                             ));
//                           },
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Image.network(imagePath),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                       color: isLiked[index] ? Colors.red : null,
//                                     ),
//                                     onPressed: () {
//                                       // Toggle the like button state and display a message
//                                       setState(() {
//                                         isLiked[index] = !isLiked[index];
//                                         if (isLiked[index]) {
//                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                             content: Text('Added to Wishlist!'),
//                                           ));
//                                         }
//                                       });
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_cart),
//                                     onPressed: () {
//                                       // Handle add to cart button press
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to fetch product images from Firebase Storage
//   Future<List<String>> _fetchProductImages() async {
//     List<String> imageUrls = [];
//     try {
//       for (int i = 1; i <= 12; i++) {
//         // Use the provided image URL
//         String imagePath = 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/iphone-15-finish-select-202309-6-1inch-blue.jpeg?alt=media&token=6770dc1b-222e-426e-8824-a91785c1e7e7';
//         imageUrls.add(imagePath);
//       }
//     } on FirebaseException catch (e) {
//       print('Error fetching product images: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product images. Please try again later.',
//       );
//     }
//     return imageUrls;
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.network(imagePath),
//       ),
//     );
//   }
// }









// Import necessary packages
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   late List<bool> isLiked;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     isLiked = List.filled(1, false); // Initialize isLiked list with size 1
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<String>(
//               future: _fetchProductImage(), // Fetch product image
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   // If image is fetched successfully, display it
//                   String imagePath = snapshot.data!;
//                   return Card(
//                     child: InkWell(
//                       onTap: () {
//                         // Navigate to a new detail page when the image is clicked
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => MobileDetailsPage(imagePath: imagePath),
//                         ));
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Image.network(imagePath),
//                           ),
//                           ButtonBar(
//                             alignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   isLiked[0] ? Icons.favorite : Icons.favorite_border,
//                                   color: isLiked[0] ? Colors.red : null,
//                                 ),
//                                 onPressed: () {
//                                   // Toggle the like button state and display a message
//                                   setState(() {
//                                     isLiked[0] = !isLiked[0];
//                                     if (isLiked[0]) {
//                                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                         content: Text('Added to Wishlist!'),
//                                       ));
//                                     }
//                                   });
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.shopping_cart),
//                                 onPressed: () {
//                                   // Handle add to cart button press
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to fetch the product image from Firebase Storage
//   Future<String> _fetchProductImage() async {
//     try {
//       // Get a reference to the image in Firebase Storage
//       // Reference reference = _storage.ref('path/to/your/image.jpg');
//       Reference reference = _storage.ref('iphone-15-finish-select-202309-6-1inch-blue.jpeg');
//
//       // Get the download URL for the image
//       String downloadURL = await reference.getDownloadURL();
//
//       return downloadURL;
//     } on FirebaseException catch (e) {
//       print('Error fetching product image: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product image. Please try again later.',
//       );
//     }
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.network(imagePath),
//       ),
//     );
//   }
// }
//
//
//






// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// // Define a data model for wishlist items
// class WishlistItem {
//   final String imagePath;
//   final String productName;
//
//   WishlistItem({required this.imagePath, required this.productName});
// }
//
// class MobilesPage extends StatefulWidget {
//   const MobilesPage({Key? key}) : super(key: key);
//
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   late List<bool> isLiked;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   List<WishlistItem> wishlistItems = []; // List to store wishlist items
//
//   @override
//   void initState() {
//     super.initState();
//     isLiked = List.filled(1, false); // Initialize isLiked list with size 1
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<String>(
//               future: _fetchProductImage(), // Fetch product image
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   // If image is fetched successfully, display it
//                   String imagePath = snapshot.data!;
//                   return Card(
//                     child: InkWell(
//                       onTap: () {
//                         // Navigate to a new detail page when the image is clicked
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => MobileDetailsPage(imagePath: imagePath),
//                         ));
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Image.network(imagePath),
//                           ),
//                           ButtonBar(
//                             alignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   isLiked[0] ? Icons.favorite : Icons.favorite_border,
//                                   color: isLiked[0] ? Colors.red : null,
//                                 ),
//                                 onPressed: () {
//                                   // Toggle the like button state and add to wishlist
//                                   setState(() {
//                                     isLiked[0] = !isLiked[0];
//                                     if (isLiked[0]) {
//                                       addToWishlist(imagePath, 'Product Name'); // Add to wishlist
//                                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                         content: Text('Added to Wishlist!'),
//                                       ));
//                                     }
//                                   });
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.shopping_cart),
//                                 onPressed: () {
//                                   // Handle add to cart button press
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to fetch the product image from Firebase Storage
//   Future<String> _fetchProductImage() async {
//     try {
//       // Get a reference to the image in Firebase Storage
//       Reference reference = _storage.ref('iphone-15-finish-select-202309-6-1inch-blue.jpeg');
//
//       // Get the download URL for the image
//       String downloadURL = await reference.getDownloadURL();
//
//       return downloadURL;
//     } on FirebaseException catch (e) {
//       print('Error fetching product image: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product image. Please try again later.',
//       );
//     }
//   }
//
//   // Method to add an item to the wishlist
//   void addToWishlist(String imagePath, String productName) {
//     setState(() {
//       wishlistItems.add(WishlistItem(imagePath: imagePath, productName: productName));
//     });
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   MobileDetailsPage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Center(
//         child: Image.network(imagePath),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MobilesPage(),
//   ));
// }











import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

// Define a data model for wishlist items
class WishlistItem {
  final String imagePath;
  final String productName;

  WishlistItem({required this.imagePath, required this.productName});
}

class MobilesPage extends StatefulWidget {
  const MobilesPage({Key? key}) : super(key: key);

  @override
  _MobilesPageState createState() => _MobilesPageState();
}

class _MobilesPageState extends State<MobilesPage> {
  late List<bool> isLiked;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<WishlistItem> wishlistItems = []; // List to store wishlist items

  @override
  void initState() {
    super.initState();
    isLiked = List.filled(1, false); // Initialize isLiked list with size 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Phones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Mobiles',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<String>(
              future: _fetchProductImage(), // Fetch product image
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // If image is fetched successfully, display it
                  String imagePath = snapshot.data!;
                  return Card(
                    child: InkWell(
                      onTap: () {
                        // Navigate to a new detail page when the image is clicked
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MobileDetailsPage(imagePath: imagePath),
                        ));
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(imagePath),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isLiked[0] ? Icons.favorite : Icons.favorite_border,
                                  color: isLiked[0] ? Colors.red : null,
                                ),
                                onPressed: () {
                                  // Toggle the like button state and add to wishlist
                                  setState(() {
                                    isLiked[0] = !isLiked[0];
                                    if (isLiked[0]) {
                                      addToWishlist(imagePath, 'Product Name'); // Add to wishlist
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('Added to Wishlist!'),
                                      ));
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  // Handle add to cart button press
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method to fetch the product image from Firebase Storage
  Future<String> _fetchProductImage() async {
    try {
      // Get a reference to the image in Firebase Storage
      Reference reference = _storage.ref('iphone-15-finish-select-202309-6-1inch-blue.jpeg');

      // Get the download URL for the image
      String downloadURL = await reference.getDownloadURL();

      return downloadURL;
    } on FirebaseException catch (e) {
      print('Error fetching product image: $e');
      throw PlatformException(
        code: 'FETCH_ERROR',
        message: 'Failed to fetch product image. Please try again later.',
      );
    }
  }

  // Method to add an item to the wishlist
  void addToWishlist(String imagePath, String productName) {
    setState(() {
      wishlistItems.add(WishlistItem(imagePath: imagePath, productName: productName));
    });
  }
}

class MobileDetailsPage extends StatelessWidget {
  final String imagePath;

  MobileDetailsPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Image.network(imagePath),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MobilesPage(),
  ));
}
