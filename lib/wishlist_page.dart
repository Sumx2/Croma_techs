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
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
//
// class ProductDetails {
//   final String name;
//   final double price;
//   final String specification;
//   final String imagePath;
//
//   ProductDetails({
//     required this.name,
//     required this.price,
//     required this.specification,
//     required this.imagePath,
//   });
// }
//
// class MobilesPage extends StatefulWidget {
//   @override
//   _MobilesPageState createState() => _MobilesPageState();
// }
//
// class _MobilesPageState extends State<MobilesPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<ProductDetails> _fetchProductDetails(int index) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//       await _firestore.collection('products').get();
//       final productDetails = querySnapshot.docs[index].data();
//       final productId = querySnapshot.docs[index].id;
//       return ProductDetails(
//         name: productDetails['name'],
//         price: productDetails['price'],
//         specification: productDetails['specification'],
//         imagePath: productDetails['imagePath'],
//       );
//     } catch (e) {
//       print('Error fetching product details: $e');
//       throw PlatformException(
//         code: 'FETCH_ERROR',
//         message: 'Failed to fetch product details. Please try again later.',
//       );
//     }
//   }
//
//   Future<void> _addToWishlist(BuildContext context, ProductDetails productDetails) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => WishlistPage(context: context, productDetails: productDetails, wishlistItems: [],),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mobile Phones'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 3, // Number of products
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Product $index'),
//                   onTap: () async {
//                     ProductDetails productDetails = await _fetchProductDetails(index);
//                     await _addToWishlist(context, productDetails); // Add item to wishlist
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WishlistPage extends StatelessWidget {
//   final BuildContext context;
//   final ProductDetails productDetails;
//
//   WishlistPage({required this.context, required this.productDetails, required List<dynamic> wishlistItems});
//
//   Future<void> _addItemToWishlist(ProductDetails productDetails) async {
//     try {
//       await FirebaseFirestore.instance.collection('wishlist').add({
//         'name': productDetails.name,
//         'price': productDetails.price,
//         'specification': productDetails.specification,
//         'imagePath': productDetails.imagePath,
//       });
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Added to Wishlist!'),
//       ));
//     } catch (e) {
//       print('Error adding item to wishlist: $e');
//       // Handle error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               productDetails.imagePath,
//               width: 200,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 20),
//             Text(
//               productDetails.name,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await _addItemToWishlist(productDetails); // Add item to wishlist
//               },
//               child: Text('Add to Wishlist'),
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






//
// import 'package:flutter/material.dart';
//
// class WishlistItem {
//   final String imagePath;
//
//   WishlistItem({required this.imagePath});
// }
//
// class WishlistPage extends StatefulWidget {
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
//             if (widget.wishlistItems.isNotEmpty &&
//                 currentIndex < widget.wishlistItems.length)
//               Image.network(
//                 widget.wishlistItems[currentIndex].imagePath,
//                 fit: BoxFit.cover,
//               ),
//             // Add a button to navigate to the next image
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   // Increment currentIndex only if it's within the valid range
//                   if (widget.wishlistItems.isNotEmpty &&
//                       currentIndex < widget.wishlistItems.length - 1) {
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
// import 'package:flutter/material.dart';
//
// class WishlistItem {
//   final String imagePath;
//
//   WishlistItem({required this.imagePath});
// }
//
// class WishlistPage extends StatefulWidget {
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
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the current wishlist image if it exists
//             if (widget.wishlistItems.isNotEmpty &&
//                 currentIndex < widget.wishlistItems.length)
//               Image.network(
//                 widget.wishlistItems[currentIndex].imagePath,
//                 fit: BoxFit.cover,
//                 height: 200, // Set a fixed height for the image
//                 width: 200, // Set a fixed width for the image
//               ),
//             SizedBox(height: 20),
//             // Add a button to navigate to the next image
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   // Increment currentIndex only if it's within the valid range
//                   if (widget.wishlistItems.isNotEmpty &&
//                       currentIndex < widget.wishlistItems.length - 1) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current wishlist image if it exists
            if (widget.wishlistItems.isNotEmpty &&
                currentIndex < widget.wishlistItems.length)
              Image.network(
                widget.wishlistItems[currentIndex].imagePath,
                fit: BoxFit.cover,
                height: 200, // Set a fixed height for the image
                width: 200, // Set a fixed width for the image
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button to navigate to the previous image
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Decrement currentIndex only if it's within the valid range
                      if (currentIndex > 0) {
                        currentIndex--;
                      }
                    });
                  },
                  child: Text('Previous Image'),
                ),
                SizedBox(width: 20),
                // Button to navigate to the next image
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Increment currentIndex only if it's within the valid range
                      if (currentIndex < widget.wishlistItems.length - 1) {
                        currentIndex++;
                      }
                    });
                  },
                  child: Text('Next Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


