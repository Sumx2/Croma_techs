// import 'package:flutter/material.dart';
//
// class ACPage extends StatefulWidget {
//   const ACPage({Key? key}) : super(key: key);
//
//   @override
//   _ACPageState createState() => _ACPageState();
// }
//
// class _ACPageState extends State<ACPage> {
//   final List<String> acImageUrls = [
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac3.jpg?alt=media&token=40fbdf7e-5a90-454d-acb0-cb4d59da25e3',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac4.jpg?alt=media&token=f5a0cfb5-7806-4ad8-afd0-b822d8f6b709',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac5.jpg?alt=media&token=f1f82357-d4d7-463b-bbc2-887bf0fa7f38',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac6.jpg?alt=media&token=fc904ca5-25f4-4187-8873-4124a3e6ca08',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Conditioners'),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: acImageUrls.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigate to the product details page when an image is tapped
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ACDetailsPage(imageUrl: acImageUrls[index]),
//               ));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Image.network(acImageUrls[index]),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Godrej', // Replace with product name from Firebase
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     '90,000', // Replace with product price from Firebase
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ACDetailsPage extends StatelessWidget {
//   final String imageUrl;
//
//   ACDetailsPage({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AC Details'),
//       ),
//       body: Center(
//         child: Image.network(imageUrl),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ACPage(),
//   ));
// }







// import 'package:flutter/material.dart';
// import 'wishlist_page.dart'; // Import the WishlistPage
// import 'cart_page.dart'; // Import the CartPage
//
// class ACPage extends StatefulWidget {
//   const ACPage({Key? key}) : super(key: key);
//
//   @override
//   _ACPageState createState() => _ACPageState();
// }
//
// class _ACPageState extends State<ACPage> {
//   final List<String> acImageUrls = [
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac3.jpg?alt=media&token=40fbdf7e-5a90-454d-acb0-cb4d59da25e3',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac4.jpg?alt=media&token=f5a0cfb5-7806-4ad8-afd0-b822d8f6b709',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac5.jpg?alt=media&token=f1f82357-d4d7-463b-bbc2-887bf0fa7f38',
//     'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac6.jpg?alt=media&token=fc904ca5-25f4-4187-8873-4124a3e6ca08',
//   ];
//
//   List<bool> isAddedToWishlist = List.filled(6, false); // Track whether each item is added to wishlist
//   List<bool> isAddedToCart = List.filled(6, false); // Track whether each item is added to cart
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Conditioners'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartPage()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => WishlistPage(wishlistItems: [],)),
//               );
//             },
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: acImageUrls.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ACDetailsPage(
//                   imageUrl: acImageUrls[index],
//                   onWishlistChanged: (bool newValue) {
//                     setState(() {
//                       isAddedToWishlist[index] = newValue;
//                     });
//                   },
//                   onCartChanged: (bool newValue) {
//                     setState(() {
//                       isAddedToCart[index] = newValue;
//                     });
//                   },
//                 ),
//               ));
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Image.network(acImageUrls[index]),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Godrej', // Replace with product name from Firebase
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     '90,000', // Replace with product price from Firebase
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           isAddedToWishlist[index] ? Icons.favorite : Icons.favorite_border,
//                           color: isAddedToWishlist[index] ? Colors.red : null,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isAddedToWishlist[index] = !isAddedToWishlist[index];
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           isAddedToCart[index] ? Icons.shopping_cart : Icons.add_shopping_cart,
//                           color: isAddedToCart[index] ? Colors.blue : null,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isAddedToCart[index] = !isAddedToCart[index];
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ACDetailsPage extends StatelessWidget {
//   final String imageUrl;
//   final Function(bool) onWishlistChanged;
//   final Function(bool) onCartChanged;
//
//   ACDetailsPage({required this.imageUrl, required this.onWishlistChanged, required this.onCartChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AC Details'),
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
//           ElevatedButton.icon(
//             onPressed: () {
//               onWishlistChanged(true);
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('Added to Wishlist'),
//               ));
//             },
//             icon: Icon(Icons.favorite),
//             label: Text('Add to Wishlist'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               onCartChanged(true);
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('Added to Cart'),
//               ));
//             },
//             icon: Icon(Icons.shopping_cart),
//             label: Text('Add to Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ACPage(),
//   ));
// }





import 'package:flutter/material.dart';
import 'wishlist_page.dart'; // Import the WishlistPage
import 'cart_page.dart'; // Import the CartPage

class ACPage extends StatefulWidget {
  const ACPage({Key? key}) : super(key: key);

  @override
  _ACPageState createState() => _ACPageState();
}

class _ACPageState extends State<ACPage> {
  final List<String> acImageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736',
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725',
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac3.jpg?alt=media&token=40fbdf7e-5a90-454d-acb0-cb4d59da25e3',
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac4.jpg?alt=media&token=f5a0cfb5-7806-4ad8-afd0-b822d8f6b709',
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac5.jpg?alt=media&token=f1f82357-d4d7-463b-bbc2-887bf0fa7f38',
    'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac6.jpg?alt=media&token=fc904ca5-25f4-4187-8873-4124a3e6ca08',
  ];

  List<bool> isAddedToWishlist = List.filled(6, false); // Track whether each item is added to wishlist
  List<bool> isAddedToCart = List.filled(6, false); // Track whether each item is added to cart

  void addToWishlist(int index) {
    setState(() {
      isAddedToWishlist[index] = true;
    });
  }

  void addToCart(int index) {
    setState(() {
      isAddedToCart[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Conditioners'),
        actions: [
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
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistPage(wishlistItems: [],)),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: acImageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ACDetailsPage(
                  imageUrl: acImageUrls[index],
                  onWishlistChanged: () => addToWishlist(index),
                  onCartChanged: () => addToCart(index),
                ),
              ));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(acImageUrls[index]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Godrej', // Replace with product name from Firebase
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '90,000', // Replace with product price from Firebase
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ACDetailsPage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onWishlistChanged;
  final VoidCallback? onCartChanged;

  ACDetailsPage({required this.imageUrl, this.onWishlistChanged, this.onCartChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.network(imageUrl),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              if (onWishlistChanged != null) {
                onWishlistChanged!();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to Wishlist'),
                ));
              }
            },
            icon: Icon(Icons.favorite),
            label: Text('Add to Wishlist'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (onCartChanged != null) {
                onCartChanged!();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to Cart'),
                ));
              }
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ACPage(),
  ));
}
