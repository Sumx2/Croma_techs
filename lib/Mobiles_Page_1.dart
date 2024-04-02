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
//             child: FutureBuilder<List<Map<String, dynamic>>>(
//               future: _fetchProductDetails(), // Fetch product details
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   // If product details are fetched successfully, display them in a grid
//                   List<Map<String, dynamic>> productDetails = snapshot.data!;
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of images per row
//                     ),
//                     itemCount: productDetails.length,
//                     itemBuilder: (context, index) {
//                       String imageUrl = productDetails[index]['imageUrl'];
//                       String productName = productDetails[index]['productName'];
//                       double productPrice = productDetails[index]['productPrice'];
//                       return GestureDetector(
//                         onTap: () {
//                           // Navigate to the product details page when an image is tapped
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => MobileDetailsPage(
//                               imageUrl: imageUrl,
//                               productName: productName,
//                               productPrice: productPrice,
//                             ),
//                           ));
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Image.network(imageUrl),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 productName,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 '\$$productPrice',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                 ),
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
//   // Method to fetch the product details from Firebase Storage
//   Future<List<Map<String, dynamic>>> _fetchProductDetails() async {
//     try {
//       // List of product details including image paths, names, and prices
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       // Get download URLs for all images
//       List<Map<String, dynamic>> productData = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         productData.add({
//           'imageUrl': url,
//           'productName': product['productName'],
//           'productPrice': product['productPrice'],
//         });
//       }
//
//       return productData;
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       // Handle the error here, for example, display a snackbar
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//       return []; // Return an empty list or handle the error as per your requirement
//     } catch (e) {
//       print('Error: $e');
//       // Handle other types of errors here
//       return []; // Return an empty list or handle the error as per your requirement
//     }
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//
//   MobileDetailsPage({required this.imageUrl, required this.productName, required this.productPrice});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName), // Display product name in the app bar
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$$productPrice',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to cart functionality here
//                 },
//                 icon: Icon(Icons.add_shopping_cart),
//                 label: Text('Add to Cart'),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to wishlist functionality here
//                 },
//                 icon: Icon(Icons.favorite),
//                 label: Text('Add to Wishlist'),
//               ),
//             ],
//           ),
//         ],
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
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
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {}); // Trigger rebuild to update the product list based on search query
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Map<String, dynamic>>>(
//               future: _fetchProductDetails(), // Fetch product details
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   // If product details are fetched successfully, display them in a grid
//                   List<Map<String, dynamic>> productDetails = snapshot.data!;
//                   // Filter product details based on search query
//                   if (_searchController.text.isNotEmpty) {
//                     productDetails = productDetails.where((product) {
//                       return product['productName'].toLowerCase().contains(_searchController.text.toLowerCase());
//                     }).toList();
//                   }
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of images per row
//                     ),
//                     itemCount: productDetails.length,
//                     itemBuilder: (context, index) {
//                       String imageUrl = productDetails[index]['imageUrl'];
//                       String productName = productDetails[index]['productName'];
//                       double productPrice = productDetails[index]['productPrice'];
//                       return GestureDetector(
//                         onTap: () {
//                           // Navigate to the product details page when an image is tapped
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => MobileDetailsPage(
//                               imageUrl: imageUrl,
//                               productName: productName,
//                               productPrice: productPrice,
//                             ),
//                           ));
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Image.network(imageUrl),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 productName,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 '\$$productPrice',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                 ),
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
//   // Method to fetch the product details from Firebase Storage
//   Future<List<Map<String, dynamic>>> _fetchProductDetails() async {
//     try {
//       // List of product details including image paths, names, and prices
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       // Get download URLs for all images
//       List<Map<String, dynamic>> productData = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         productData.add({
//           'imageUrl': url,
//           'productName': product['productName'],
//           'productPrice': product['productPrice'],
//         });
//       }
//
//       return productData;
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       // Handle the error here, for example, display a snackbar
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//       return []; // Return an empty list or handle the error as per your requirement
//     } catch (e) {
//       print('Error: $e');
//       // Handle other types of errors here
//       return []; // Return an empty list or handle the error as per your requirement
//     }
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//
//   MobileDetailsPage({required this.imageUrl, required this.productName, required this.productPrice});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName), // Display product name in the app bar
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$$productPrice',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to cart functionality here
//                 },
//                 icon: Icon(Icons.add_shopping_cart),
//                 label: Text('Add to Cart'),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to wishlist functionality here
//                 },
//                 icon: Icon(Icons.favorite),
//                 label: Text('Add to Wishlist'),
//               ),
//             ],
//           ),
//         ],
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {}); // Trigger rebuild to update the product list based on search query
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Map<String, dynamic>>>(
//               future: _fetchProductDetails(), // Fetch product details
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   // If product details are fetched successfully, display them in a grid
//                   List<Map<String, dynamic>> productDetails = snapshot.data!;
//                   // Filter product details based on search query
//                   if (_searchController.text.isNotEmpty) {
//                     productDetails = productDetails.where((product) {
//                       return product['productName'].toLowerCase().contains(_searchController.text.toLowerCase());
//                     }).toList();
//                   }
//                   // Filter product details based on price
//                   if (_selectedPrice != null) {
//                     productDetails = productDetails.where((product) {
//                       double productPrice = product['productPrice'];
//                       if (_selectedPrice! == double.infinity) {
//                         return productPrice > 100.0;
//                       } else {
//                         return productPrice <= _selectedPrice!;
//                       }
//                     }).toList();
//                   }
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of images per row
//                     ),
//                     itemCount: productDetails.length,
//                     itemBuilder: (context, index) {
//                       String imageUrl = productDetails[index]['imageUrl'];
//                       String productName = productDetails[index]['productName'];
//                       double productPrice = productDetails[index]['productPrice'];
//                       return GestureDetector(
//                         onTap: () {
//                           // Navigate to the product details page when an image is tapped
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => MobileDetailsPage(
//                               imageUrl: imageUrl,
//                               productName: productName,
//                               productPrice: productPrice,
//                             ),
//                           ));
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Image.network(imageUrl),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 productName,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 '\$$productPrice',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                 ),
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
//   // Method to fetch the product details from Firebase Storage
//   Future<List<Map<String, dynamic>>> _fetchProductDetails() async {
//     try {
//       // List of product details including image paths, names, and prices
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       // Get download URLs for all images
//       List<Map<String, dynamic>> productData = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         productData.add({
//           'imageUrl': url,
//           'productName': product['productName'],
//           'productPrice': product['productPrice'],
//         });
//       }
//
//       return productData;
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       // Handle the error here, for example, display a snackbar
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//       return []; // Return an empty list or handle the error as per your requirement
//     } catch (e) {
//       print('Error: $e');
//       // Handle other types of errors here
//       return []; // Return an empty list or handle the error as per your requirement
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     double selectedPrice = await showDialog<double>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Filter by Price'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RadioListTile<double>(
//                 title: Text('All'),
//                 value: 0.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop(value);
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$0 - \$50'),
//                 value: 50.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop(value);
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$50 - \$100'),
//                 value: 100.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop(value);
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$100+'),
//                 value: double.infinity,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop(value);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     ) ?? 0.0; // Default value when dialog is dismissed is 0.0
//     setState(() {
//       _selectedPrice = selectedPrice;
//     });
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//
//   MobileDetailsPage({required this.imageUrl, required this.productName, required this.productPrice});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName), // Display product name in the app bar
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$$productPrice',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to cart functionality here
//                 },
//                 icon: Icon(Icons.add_shopping_cart),
//                 label: Text('Add to Cart'),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Add to wishlist functionality here
//                 },
//                 icon: Icon(Icons.favorite),
//                 label: Text('Add to Wishlist'),
//               ),
//             ],
//           ),
//         ],
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



//
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = []; // List to store products
//   List<Product> _wishlist = []; // List to store wishlist items
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {}); // Trigger rebuild to update the product list based on search query
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Number of images per row
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to the product details page when an image is tapped
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             isWishlisted ? Icons.favorite : Icons.favorite_border,
//                             color: isWishlisted ? Colors.red : null,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _products[index].isWishlisted = !isWishlisted;
//                               if (isWishlisted) {
//                                 _wishlist.remove(_products[index]);
//                               } else {
//                                 _wishlist.add(_products[index]);
//                               }
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       // Fetch product details from Firebase Storage
//       // Replace this with your actual fetching mechanism
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         _products = products;
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     // Implement the price filter dialog
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }

// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//         ],
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





//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = [];
//   List<Product> _wishlist = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 _fetchProductDetails(); // Fetch products based on the search query
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             isWishlisted ? Icons.favorite : Icons.favorite_border,
//                             color: isWishlisted ? Colors.red : null,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _products[index].isWishlisted = !isWishlisted;
//                               if (isWishlisted) {
//                                 _wishlist.remove(_products[index]);
//                               } else {
//                                 _wishlist.add(_products[index]);
//                               }
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         if (_searchController.text.isNotEmpty) {
//           _products = products.where((product) =>
//               product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
//         } else {
//           _products = products;
//         }
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     // Implement the price filter dialog
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//         ],
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







// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = [];
//   List<Product> _wishlist = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 _fetchProductDetails(); // Fetch products based on the search query
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             isWishlisted ? Icons.favorite : Icons.favorite_border,
//                             color: isWishlisted ? Colors.red : null,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _products[index].isWishlisted = !isWishlisted;
//                               if (isWishlisted) {
//                                 _wishlist.remove(_products[index]);
//                               } else {
//                                 _wishlist.add(_products[index]);
//                               }
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         if (_searchController.text.isNotEmpty) {
//           products = products.where((product) =>
//               product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
//         }
//         if (_selectedPrice != null) {
//           products = products.where((product) =>
//           _selectedPrice == null || (_selectedPrice == double.infinity
//               ? product.productPrice > 100
//               : product.productPrice <= _selectedPrice!)).toList();
//         }
//         _products = products;
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Filter by Price'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RadioListTile<double>(
//                 title: Text('All'),
//                 value: 0.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$0 - \$50'),
//                 value: 50.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$50 - \$100'),
//                 value: 100.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$100+'),
//                 value: double.infinity,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//         ],
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




// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//   bool isInCart;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//     this.isInCart = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = [];
//   List<Product> _wishlist = [];
//   List<Product> _cart = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               _showCart(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 _fetchProductDetails();
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 bool isInCart = _products[index].isInCart;
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                         onCartChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isInCart = newValue;
//                             if (newValue) {
//                               _cart.add(_products[index]);
//                             } else {
//                               _cart.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 isWishlisted ? Icons.favorite : Icons.favorite_border,
//                                 color: isWishlisted ? Colors.red : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isWishlisted = !isWishlisted;
//                                   if (isWishlisted) {
//                                     _wishlist.remove(_products[index]);
//                                   } else {
//                                     _wishlist.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//                                 color: isInCart ? Colors.blue : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isInCart = !isInCart;
//                                   if (isInCart) {
//                                     _cart.remove(_products[index]);
//                                   } else {
//                                     _cart.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         if (_searchController.text.isNotEmpty) {
//           products = products.where((product) =>
//               product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
//         }
//         if (_selectedPrice != null) {
//           products = products.where((product) =>
//           _selectedPrice == null || (_selectedPrice == double.infinity
//               ? product.productPrice > 100
//               : product.productPrice <= _selectedPrice!)).toList();
//         }
//         _products = products;
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Filter by Price'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RadioListTile<double>(
//                 title: Text('All'),
//                 value: 0.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$0 - \$50'),
//                 value: 50.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$50 - \$100'),
//                 value: 100.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$100+'),
//                 value: double.infinity,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCart(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Cart'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _cart.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isInCart = false;
//                       _cart.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//   final Function(bool) onCartChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged, required this.onCartChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               onCartChanged(!product.isInCart);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//               color: product.isInCart ? Colors.blue : null,
//             ),
//             label: Text(product.isInCart ? 'Remove from Cart' : 'Add to Cart'),
//           ),
//         ],
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

//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//   bool isInCart;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//     this.isInCart = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = [];
//   List<Product> _wishlist = [];
//   List<Product> _cart = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               _showCart(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 _fetchProductDetails();
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search Mobiles',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 bool isInCart = _products[index].isInCart;
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                         onCartChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isInCart = newValue;
//                             if (newValue) {
//                               _cart.add(_products[index]);
//                             } else {
//                               _cart.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 isWishlisted ? Icons.favorite : Icons.favorite_border,
//                                 color: isWishlisted ? Colors.red : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isWishlisted = !isWishlisted;
//                                   if (isWishlisted) {
//                                     _wishlist.remove(_products[index]);
//                                   } else {
//                                     _wishlist.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//                                 color: isInCart ? Colors.blue : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isInCart = !isInCart;
//                                   if (isInCart) {
//                                     _cart.remove(_products[index]);
//                                   } else {
//                                     _cart.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         if (_searchController.text.isNotEmpty) {
//           products = products.where((product) =>
//               product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
//         }
//         if (_selectedPrice != null) {
//           products = products.where((product) =>
//           _selectedPrice == null || (_selectedPrice == double.infinity
//               ? product.productPrice > 100
//               : product.productPrice <= _selectedPrice!)).toList();
//         }
//         _products = products;
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Filter by Price'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RadioListTile<double>(
//                 title: Text('All'),
//                 value: 0.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$0 - \$50'),
//                 value: 50.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$50 - \$100'),
//                 value: 100.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$100+'),
//                 value: double.infinity,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCart(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Cart'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ..._cart.map((product) {
//                 return ListTile(
//                   title: Text(product.productName),
//                   subtitle: Text('\$${product.productPrice}'),
//                   leading: Image.network(product.imageUrl),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       setState(() {
//                         product.isInCart = false;
//                         _cart.remove(product);
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the payment section page here
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PaymentSectionPage(),
//                     ),
//                   );
//                 },
//                 child: Text('Buy Now'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//   final Function(bool) onCartChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged, required this.onCartChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               onCartChanged(!product.isInCart);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//               color: product.isInCart ? Colors.blue : null,
//             ),
//             label: Text(product.isInCart ? 'Remove from Cart' : 'Add to Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PaymentSectionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Section'),
//       ),
//       body: Center(
//         child: Text('Payment Section Page'),
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





// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
//
// class Product {
//   final String imageUrl;
//   final String productName;
//   final double productPrice;
//   bool isWishlisted;
//   bool isInCart;
//
//   Product({
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     this.isWishlisted = false,
//     this.isInCart = false,
//   });
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
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _searchController = TextEditingController();
//   double? _selectedPrice;
//   List<Product> _products = [];
//   List<Product> _wishlist = [];
//   List<Product> _cart = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProductDetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Phones'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {
//               _showPriceFilterDialog(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               _showWishlist(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               _showCart(context);
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   _fetchProductDetails();
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Search Mobiles',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 String imageUrl = _products[index].imageUrl;
//                 String productName = _products[index].productName;
//                 double productPrice = _products[index].productPrice;
//                 bool isWishlisted = _products[index].isWishlisted;
//                 bool isInCart = _products[index].isInCart;
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MobileDetailsPage(
//                         product: _products[index],
//                         onWishlistChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isWishlisted = newValue;
//                             if (newValue) {
//                               _wishlist.add(_products[index]);
//                             } else {
//                               _wishlist.remove(_products[index]);
//                             }
//                           });
//                         },
//                         onCartChanged: (bool newValue) {
//                           setState(() {
//                             _products[index].isInCart = newValue;
//                             if (newValue) {
//                               _cart.add(_products[index]);
//                             } else {
//                               _cart.remove(_products[index]);
//                             }
//                           });
//                         },
//                       ),
//                     ));
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Image.network(imageUrl),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '\$$productPrice',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 isWishlisted ? Icons.favorite : Icons.favorite_border,
//                                 color: isWishlisted ? Colors.red : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isWishlisted = !isWishlisted;
//                                   if (isWishlisted) {
//                                     _wishlist.remove(_products[index]);
//                                   } else {
//                                     _wishlist.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//                                 color: isInCart ? Colors.blue : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _products[index].isInCart = !isInCart;
//                                   if (isInCart) {
//                                     _cart.remove(_products[index]);
//                                   } else {
//                                     _cart.add(_products[index]);
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _fetchProductDetails() async {
//     try {
//       List<Map<String, dynamic>> productDetails = [
//         {
//           'imagePath': 'mobiles/mobile1.webp',
//           'productName': 'iphone 14',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile2.webp',
//           'productName': 'Samsung Galaxy S24 ',
//           'productPrice': 50.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile3.webp',
//           'productName': 'One Plus 12T',
//           'productPrice': 70.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile4.webp',
//           'productName': 'Nothing Phone 2a',
//           'productPrice': 40.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile5.webp',
//           'productName': 'Oppo Reno Ultra',
//           'productPrice': 45.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile6.webp',
//           'productName': 'Redmi Note 13 Pro',
//           'productPrice': 65.0,
//         },
//         {
//           'imagePath': 'mobiles/mobile1.jpg',
//           'productName': 'iphone 15 Plus',
//           'productPrice': 85.0,
//         },
//         {
//           'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
//           'productName': 'iPhone 15',
//           'productPrice': 100.0,
//         },
//         // Add more product details here
//       ];
//
//       List<Product> products = [];
//       for (var product in productDetails) {
//         Reference reference = _storage.ref(product['imagePath']);
//         String url = await reference.getDownloadURL();
//         products.add(Product(
//           imageUrl: url,
//           productName: product['productName'],
//           productPrice: product['productPrice'],
//         ));
//       }
//
//       setState(() {
//         if (_searchController.text.isNotEmpty) {
//           products = products.where((product) =>
//               product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
//         }
//         if (_selectedPrice != null) {
//           products = products.where((product) =>
//           _selectedPrice == null || (_selectedPrice == double.infinity
//               ? product.productPrice > 100
//               : product.productPrice <= _selectedPrice!)).toList();
//         }
//         _products = products;
//       });
//     } on PlatformException catch (e) {
//       print('Platform Exception: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to fetch product details. Please try again later.'),
//       ));
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _showPriceFilterDialog(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Filter by Price'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RadioListTile<double>(
//                 title: Text('All'),
//                 value: 0.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$0 - \$50'),
//                 value: 50.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$50 - \$100'),
//                 value: 100.0,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//               RadioListTile<double>(
//                 title: Text('\$100+'),
//                 value: double.infinity,
//                 groupValue: _selectedPrice,
//                 onChanged: (double? value) {
//                   Navigator.of(context).pop();
//                   setState(() {
//                     _selectedPrice = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showWishlist(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Wishlist'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _wishlist.map((product) {
//               return ListTile(
//                 title: Text(product.productName),
//                 subtitle: Text('\$${product.productPrice}'),
//                 leading: Image.network(product.imageUrl),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       product.isWishlisted = false;
//                       _wishlist.remove(product);
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCart(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Cart'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ..._cart.map((product) {
//                 return ListTile(
//                   title: Text(product.productName),
//                   subtitle: Text('\$${product.productPrice}'),
//                   leading: Image.network(product.imageUrl),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       setState(() {
//                         product.isInCart = false;
//                         _cart.remove(product);
//                       });
//                     },
//                   ),
//                 );
//               }).toList(),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the payment section page here
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PaymentSectionPage(product: _products[0]), // Pass any product for demonstration
//                     ),
//                   );
//                 },
//                 child: Text('Buy Now'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final Product product;
//   final Function(bool) onWishlistChanged;
//   final Function(bool) onCartChanged;
//
//   MobileDetailsPage({required this.product, required this.onWishlistChanged, required this.onCartChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.productName),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.network(product.imageUrl),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '\$${product.productPrice}',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(!product.isWishlisted);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isWishlisted ? Icons.favorite : Icons.favorite_border,
//               color: product.isWishlisted ? Colors.red : null,
//             ),
//             label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               onCartChanged(!product.isInCart);
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               product.isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
//               color: product.isInCart ? Colors.blue : null,
//             ),
//             label: Text(product.isInCart ? 'Remove from Cart' : 'Add to Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PaymentSectionPage extends StatefulWidget {
//   final Product product;
//
//   PaymentSectionPage({required this.product});
//
//   @override
//   _PaymentSectionPageState createState() => _PaymentSectionPageState();
// }
//
// class _PaymentSectionPageState extends State<PaymentSectionPage> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _addressController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   String _selectedPaymentMethod = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Section'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background_image.jpg'), // Change to your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Product Price: \$${widget.product.productPrice}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Payment Method:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               ListTile(
//                 title: Text('UPI Payment'),
//                 leading: Radio(
//                   value: 'UPI Payment',
//                   groupValue: _selectedPaymentMethod,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedPaymentMethod = value!;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('Credit Card'),
//                 leading: Radio(
//                   value: 'Credit Card',
//                   groupValue: _selectedPaymentMethod,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedPaymentMethod = value!;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform payment here
//                   _confirmPayment();
//                 },
//                 child: Text('Confirm Payment'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _confirmPayment() {
//     // Perform payment confirmation logic here
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Payment Confirmation'),
//           content: Text('Payment Successful!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MobilesPage(),
//   ));
// }




import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class Product {
  final String imageUrl;
  final String productName;
  final double productPrice;
  bool isWishlisted;
  bool isInCart;

  Product({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    this.isWishlisted = false,
    this.isInCart = false,
  });
}

class MobilesPage extends StatefulWidget {
  const MobilesPage({Key? key}) : super(key: key);

  @override
  _MobilesPageState createState() => _MobilesPageState();
}

class _MobilesPageState extends State<MobilesPage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  TextEditingController _searchController = TextEditingController();
  double? _selectedPrice;
  List<Product> _products = [];
  List<Product> _wishlist = [];
  List<Product> _cart = [];

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Phones'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              _showPriceFilterDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _showWishlist(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _showCart(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _fetchProductDetails();
              },
              decoration: InputDecoration(
                hintText: 'Search Mobiles',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                String imageUrl = _products[index].imageUrl;
                String productName = _products[index].productName;
                double productPrice = _products[index].productPrice;
                bool isWishlisted = _products[index].isWishlisted;
                bool isInCart = _products[index].isInCart;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MobileDetailsPage(
                        product: _products[index],
                        onWishlistChanged: (bool newValue) {
                          setState(() {
                            _products[index].isWishlisted = newValue;
                            if (newValue) {
                              _wishlist.add(_products[index]);
                            } else {
                              _wishlist.remove(_products[index]);
                            }
                          });
                        },
                        onCartChanged: (bool newValue) {
                          setState(() {
                            _products[index].isInCart = newValue;
                            if (newValue) {
                              _cart.add(_products[index]);
                            } else {
                              _cart.remove(_products[index]);
                            }
                          });
                        },
                      ),
                    ));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(imageUrl),
                        ),
                        SizedBox(height: 10),
                        Text(
                          productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$$productPrice',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                isWishlisted ? Icons.favorite : Icons.favorite_border,
                                color: isWishlisted ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  _products[index].isWishlisted = !isWishlisted;
                                  if (isWishlisted) {
                                    _wishlist.remove(_products[index]);
                                  } else {
                                    _wishlist.add(_products[index]);
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                                color: isInCart ? Colors.blue : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  _products[index].isInCart = !isInCart;
                                  if (isInCart) {
                                    _cart.remove(_products[index]);
                                  } else {
                                    _cart.add(_products[index]);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchProductDetails() async {
    try {
      List<Map<String, dynamic>> productDetails = [
        {
          'imagePath': 'mobiles/mobile1.webp',
          'productName': 'iphone 14',
          'productPrice': 70.0,
        },
        {
          'imagePath': 'mobiles/mobile2.webp',
          'productName': 'Samsung Galaxy S24 ',
          'productPrice': 50.0,
        },
        {
          'imagePath': 'mobiles/mobile3.webp',
          'productName': 'One Plus 12T',
          'productPrice': 70.0,
        },
        {
          'imagePath': 'mobiles/mobile4.webp',
          'productName': 'Nothing Phone 2a',
          'productPrice': 40.0,
        },
        {
          'imagePath': 'mobiles/mobile5.webp',
          'productName': 'Oppo Reno Ultra',
          'productPrice': 45.0,
        },
        {
          'imagePath': 'mobiles/mobile6.webp',
          'productName': 'Redmi Note 13 Pro',
          'productPrice': 65.0,
        },
        {
          'imagePath': 'mobiles/mobile1.jpg',
          'productName': 'iphone 15 Plus',
          'productPrice': 85.0,
        },
        {
          'imagePath': 'mobiles/iphone-15-finish-select-202309-6-1inch-blue.jpeg',
          'productName': 'iPhone 15',
          'productPrice': 100.0,
        },
        // Add more product details here
      ];

      List<Product> products = [];
      for (var product in productDetails) {
        Reference reference = _storage.ref(product['imagePath']);
        String url = await reference.getDownloadURL();
        products.add(Product(
          imageUrl: url,
          productName: product['productName'],
          productPrice: product['productPrice'],
        ));
      }

      setState(() {
        if (_searchController.text.isNotEmpty) {
          products = products.where((product) =>
              product.productName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
        }
        if (_selectedPrice != null) {
          products = products.where((product) =>
          _selectedPrice == null || (_selectedPrice == double.infinity
              ? product.productPrice > 100
              : product.productPrice <= _selectedPrice!)).toList();
        }
        _products = products;
      });
    } on PlatformException catch (e) {
      print('Platform Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to fetch product details. Please try again later.'),
      ));
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _showPriceFilterDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter by Price'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<double>(
                title: Text('All'),
                value: 0.0,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              RadioListTile<double>(
                title: Text('\$0 - \$50'),
                value: 50.0,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              RadioListTile<double>(
                title: Text('\$50 - \$100'),
                value: 100.0,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              RadioListTile<double>(
                title: Text('\$100+'),
                value: double.infinity,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showWishlist(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wishlist'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _wishlist.map((product) {
              return ListTile(
                title: Text(product.productName),
                subtitle: Text('\$${product.productPrice}'),
                leading: Image.network(product.imageUrl),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      product.isWishlisted = false;
                      _wishlist.remove(product);
                    });
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cart'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ..._cart.map((product) {
                return ListTile(
                  title: Text(product.productName),
                  subtitle: Text('\$${product.productPrice}'),
                  leading: Image.network(product.imageUrl),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        product.isInCart = false;
                        _cart.remove(product);
                      });
                    },
                  ),
                );
              }).toList(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the payment section page here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSectionPage(product: _products[0]), // Pass any product for demonstration
                    ),
                  );
                },
                child: Text('Buy Now'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MobileDetailsPage extends StatelessWidget {
  final Product product;
  final Function(bool) onWishlistChanged;
  final Function(bool) onCartChanged;

  MobileDetailsPage({required this.product, required this.onWishlistChanged, required this.onCartChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.network(product.imageUrl),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '\$${product.productPrice}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              onWishlistChanged(!product.isWishlisted);
              Navigator.pop(context);
            },
            icon: Icon(
              product.isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: product.isWishlisted ? Colors.red : null,
            ),
            label: Text(product.isWishlisted ? 'Remove from Wishlist' : 'Add to Wishlist'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              onCartChanged(!product.isInCart);
              Navigator.pop(context);
            },
            icon: Icon(
              product.isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
              color: product.isInCart ? Colors.blue : null,
            ),
            label: Text(product.isInCart ? 'Remove from Cart' : 'Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class PaymentSectionPage extends StatefulWidget {
  final Product product;

  PaymentSectionPage({required this.product});

  @override
  _PaymentSectionPageState createState() => _PaymentSectionPageState();
}

class _PaymentSectionPageState extends State<PaymentSectionPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Section'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wave.png'), // Change to your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 20),
              Text(
                'Product Price: \$${widget.product.productPrice}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Method:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('UPI Payment'),
                leading: Radio(
                  value: 'UPI Payment',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Netbanking'),
                leading: Radio(
                  value: 'Netbanking',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Cash on Delivery'),
                leading: Radio(
                  value: 'Cash on Delivery',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _proceedToPayment();
                },
                child: Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _proceedToPayment() {
    // Validate if all fields are filled
    if (_nameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _selectedPaymentMethod.isNotEmpty) {
      // You can proceed to the confirm order page here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmOrderPage(
            product: widget.product,
            name: _nameController.text,
            address: _addressController.text,
            phone: _phoneController.text,
            paymentMethod: _selectedPaymentMethod,
          ),
        ),
      );
    } else {
      // If any field is empty, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill all fields and select a payment method.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class ConfirmOrderPage extends StatelessWidget {
  final Product product;
  final String name;
  final String address;
  final String phone;
  final String paymentMethod;

  ConfirmOrderPage({
    required this.product,
    required this.name,
    required this.address,
    required this.phone,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    // Generate a random estimated delivery date
    DateTime now = DateTime.now();
    Random random = Random();
    int daysToAdd = random.nextInt(5) + 1; // Random number between 1 to 5
    DateTime estimatedDeliveryDate = now.add(Duration(days: daysToAdd));

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  Image.network(product.imageUrl),
                  ListTile(
                    title: Text(product.productName),
                    subtitle: Text('\$${product.productPrice}'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Delivery Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Name: $name'),
            Text('Address: $address'),
            Text('Phone: $phone'),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(paymentMethod),
            SizedBox(height: 20),
            Text(
              'Estimated Delivery Date:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(estimatedDeliveryDate.toString().substring(0, 10)), // Display only the date part
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your payment was successful.'),
              Text('Order placed successfully.'),
              // You can add more messages or details here
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MobilesPage(),
  ));
}
