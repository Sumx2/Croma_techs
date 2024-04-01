// import 'package:flutter/material.dart';
//
// class ACPage extends StatelessWidget {
//   const ACPage({super.key});
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
//         itemBuilder: (context, index) {
//           return Image.network('Image URL for AC $index');
//         },
//       ),
//     );
//   }
// }




//
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class ACPage extends StatefulWidget {
//   const ACPage({Key? key}) : super(key: key);
//
//   @override
//   _ACPageState createState() => _ACPageState();
// }
//
// class _ACPageState extends State<ACPage> {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Conditioners'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: _fetchACImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<String> imageUrls = snapshot.data!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: imageUrls.length,
//               itemBuilder: (context, index) {
//                 return Image.network(imageUrls[index]);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   // Method to fetch the URLs of AC images from Firebase Storage
//   Future<List<String>> _fetchACImages() async {
//     try {
//       // Define image paths for ACs
//       List<String> imagePaths = [
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736.jpg',
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725.jpg',
//       ];
//
//       List<String> imageUrls = [];
//
//       // Loop through each image path and fetch its URL
//       for (String path in imagePaths) {
//         Reference reference = _storage.ref(path);
//         String downloadURL = await reference.getDownloadURL();
//         imageUrls.add(downloadURL);
//       }
//
//       return imageUrls;
//     } catch (e) {
//       print('Error fetching AC images: $e');
//       throw e;
//     }
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class ACPage extends StatefulWidget {
//   const ACPage({Key? key}) : super(key: key);
//
//   @override
//   _ACPageState createState() => _ACPageState();
// }
//
// class _ACPageState extends State<ACPage> {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Conditioners'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: _fetchACImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<String> imageUrls = snapshot.data!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: imageUrls.length,
//               itemBuilder: (context, index) {
//                 return Image.network(imageUrls[index]);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   // Method to fetch the URLs of AC images from Firebase Storage
//   Future<List<String>> _fetchACImages() async {
//     try {
//       List<String> imageUrls = [
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736.jpg',
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725.jpg',
//       ];
//
//       return imageUrls;
//     } catch (e) {
//       print('Error fetching AC images: $e');
//       throw e;
//     }
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ACPage extends StatelessWidget {
//   const ACPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Conditioners'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: _fetchACImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<String> imageUrls = snapshot.data!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: imageUrls.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => ACProductDetailPage(imageUrl: imageUrls[index], productId: index.toString()),
//                     ));
//                   },
//                   child: Image.network(imageUrls[index]),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<List<String>> _fetchACImages() async {
//     try {
//       List<String> imageUrls = [
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736.jpg',
//         'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725.jpg',
//       ];
//       return imageUrls;
//     } catch (e) {
//       print('Error fetching AC images: $e');
//       throw e;
//     }
//   }
// }
//
// class ACProductDetailPage extends StatelessWidget {
//   final String imageUrl;
//   final String productId;
//
//   const ACProductDetailPage({Key? key, required this.imageUrl, required this.productId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: _fetchProductDetails(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             var productData = snapshot.data!.data() as Map<String, dynamic>;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Image.network(imageUrl),
//                 ListTile(
//                   title: Text(productData['name']),
//                   subtitle: Text('Price: \$${productData['price']}'),
//                 ),
//                 SizedBox(height: 20),
//                 Text('Specifications', style: Theme.of(context).textTheme.headline6),
//                 SizedBox(height: 10),
//                 Text(productData['specifications']),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(Icons.favorite_border),
//                   onPressed: () {
//                     // Add to wishlist functionality
//                   },
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<DocumentSnapshot> _fetchProductDetails() async {
//     try {
//       // Assuming 'ac_products' is the collection name in Firestore
//       DocumentSnapshot productSnapshot = await FirebaseFirestore.instance.collection('ac_products').doc(productId).get();
//       return productSnapshot;
//     } catch (e) {
//       print('Error fetching product details: $e');
//       throw e;
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ACPage(),
//   ));
// }



import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ACPage extends StatelessWidget {
  const ACPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Conditioners'),
      ),
      body: FutureBuilder<List<String>>(
        future: _fetchACImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<String> imageUrls = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ACProductDetailPage(
                        imageUrl: imageUrls[index],
                        productId: index == 0 ? 'QONOZ3YVzAlJMXaJImue' : 'mPgxhmWDzZzhclr4B9JW',
                      ),
                    ));
                  },
                  child: Image.network(imageUrls[index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<String>> _fetchACImages() async {
    try {
      List<String> imageUrls = [
        'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac1.jpg?alt=media&token=4290ffd6-87aa-451b-b164-06cd5f3f0736.jpg',
        'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/ACs%2Fac2.jpg?alt=media&token=6115e48e-8347-4467-b42d-6c2d77b1d725.jpg',
      ];
      return imageUrls;
    } catch (e) {
      print('Error fetching AC images: $e');
      throw e;
    }
  }
}

class ACProductDetailPage extends StatelessWidget {
  final String imageUrl;
  final String productId;

  const ACProductDetailPage({
    Key? key,
    required this.imageUrl,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _fetchProductDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var productData = snapshot.data!.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(imageUrl),
                  ListTile(
                    title: Text(productData['name']),
                    subtitle: Text('Price: \$${productData['price']}'),
                  ),
                  SizedBox(height: 20),
                  Text('Specifications', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 10),
                  Text(productData['specifications']),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<DocumentSnapshot> _fetchProductDetails() async {
    try {
      // Fetch product details from Firestore using the provided document ID
      DocumentSnapshot productSnapshot =
      await FirebaseFirestore.instance.collection('Products').doc(productId).get();
      return productSnapshot;
    } catch (e) {
      print('Error fetching product details: $e');
      throw e;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ACPage(),
  ));
}



