// import 'package:flutter/material.dart';
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
//         title: Text('Product Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(imagePath), // Display the product image
//             SizedBox(height: 20),
//             Text(
//               'Product Name', // Replace with the name of the product
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Price: \$XXX', // Replace with the price of the product
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Description:', // Replace with the description of the product
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit....', // Replace with the actual description of the product
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ProductDetails {
//   final String imagePath;
//   final String name;
//   final double price;
//   final String description;
//
//   ProductDetails({
//     required this.imagePath,
//     required this.name,
//     required this.price,
//     required this.description,
//   });
// }
//
// class MobileDetailsPage extends StatelessWidget {
//   final ProductDetails productDetails;
//
//   MobileDetailsPage({required this.productDetails});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(productDetails.imagePath), // Display the product image
//             SizedBox(height: 20),
//             Text(
//               productDetails.name, // Display the product name
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Price: \$${productDetails.price}', // Display the product price
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Description:', // Display the product description label
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               productDetails.description, // Display the product description
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
