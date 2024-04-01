// import 'package:flutter/material.dart';
//
// class TelevisionPage extends StatefulWidget {
//   const TelevisionPage({Key? key});
//
//   @override
//   _TelevisionPageState createState() => _TelevisionPageState();
// }
//
// class _TelevisionPageState extends State<TelevisionPage> {
//   List<bool> isLiked = List.filled(12, false); // Initialize a list to track like status for each item
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Television'),
//       ),
//
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Televisions',
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
//                         'assets/t1.jpg',
//                         'assets/t2.jpg',
//                         'assets/t3.jpg',
//                         'assets/t4.jpg',
//                         'assets/t5.jpg',
//                         'assets/t6.jpg',
//                         'assets/t7.jpg',
//                         'assets/t8.jpg',
//                         'assets/t9.jpg',
//                         'assets/t10.jpg',
//                         'assets/t11.jpg',
//                         'assets/t12.jpg',
//                       ];
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             // Navigate to a new detail page when a container is clicked
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => DetailsPage(imagePath: imagePaths[index]),
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
//                                       setState(() {
//                                         if (isLiked[index]) {
//                                           // Item is already liked, so remove it from the wishlist
//                                           isLiked[index] = false;
//                                           ScaffoldMessenger.of(context).showSnackBar(
//                                             SnackBar(content: Text('Removed from Wishlist')),
//                                           );
//                                         } else {
//                                           // Item is not liked, so add it to the wishlist
//                                           isLiked[index] = true;
//                                           ScaffoldMessenger.of(context).showSnackBar(
//                                             SnackBar(content: Text('Added to Wishlist!')),
//                                           );
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
// class DetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   DetailsPage({required this.imagePath});
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



// import 'package:flutter/material.dart';
//
// class TelevisionPage extends StatefulWidget {
//   const TelevisionPage({Key? key});
//
//   @override
//   _TelevisionPageState createState() => _TelevisionPageState();
// }
//
// class _TelevisionPageState extends State<TelevisionPage> {
//   List<bool> isLiked = List.filled(12, false); // Initialize a list to track like status for each item
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Television'),
//       ),
//
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Televisions',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 0.1,
//                 mainAxisSpacing: 4.0,
//               ),
//               itemCount: 12,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to a new detail page when a container is clicked
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => DetailsPage(imagePath: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv1.webp?alt=media&token=91c011d2-07ac-4cd7-a6b6-4977f5f26656'),
//                       ));
//                     },
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Image.network('https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv1.webp?alt=media&token=91c011d2-07ac-4cd7-a6b6-4977f5f26656'),
//                         ),
//                         ButtonBar(
//                           alignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                 color: isLiked[index] ? Colors.red : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   if (isLiked[index]) {
//                                     // Item is already liked, so remove it from the wishlist
//                                     isLiked[index] = false;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('Removed from Wishlist')),
//                                     );
//                                   } else {
//                                     // Item is not liked, so add it to the wishlist
//                                     isLiked[index] = true;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('Added to Wishlist!')),
//                                     );
//                                   }
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.shopping_cart),
//                               onPressed: () {
//                                 // Handle add to cart button press
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
// }
//
// class DetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   DetailsPage({required this.imagePath});
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











// import 'package:flutter/material.dart';
//
// class TelevisionPage extends StatefulWidget {
//   const TelevisionPage({Key? key});
//
//   @override
//   _TelevisionPageState createState() => _TelevisionPageState();
// }
//
// class _TelevisionPageState extends State<TelevisionPage> {
//   List<bool> isLiked = List.filled(12, false); // Initialize a list to track like status for each item
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Television'),
//       ),
//
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Televisions',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 0.1,
//                 mainAxisSpacing: 4.0,
//               ),
//               itemCount: 12,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to a new detail page when a container is clicked
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => DetailsPage(imagePath: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv1.webp?alt=media&token=91c011d2-07ac-4cd7-a6b6-4977f5f26656'),
//                       ));
//                     },
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Image.network('https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv1.webp?alt=media&token=91c011d2-07ac-4cd7-a6b6-4977f5f26656'),
//                         ),
//                         ButtonBar(
//                           alignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 isLiked[index] ? Icons.favorite : Icons.favorite_border,
//                                 color: isLiked[index] ? Colors.red : null,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   if (isLiked[index]) {
//                                     // Item is already liked, so remove it from the wishlist
//                                     isLiked[index] = false;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('Removed from Wishlist')),
//                                     );
//                                   } else {
//                                     // Item is not liked, so add it to the wishlist
//                                     isLiked[index] = true;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('Added to Wishlist!')),
//                                     );
//                                   }
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.shopping_cart),
//                               onPressed: () {
//                                 // Handle add to cart button press
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
// }
//
// class DetailsPage extends StatelessWidget {
//   final String imagePath;
//
//   DetailsPage({required this.imagePath});
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



import 'package:flutter/material.dart';

class TelevisionPage extends StatefulWidget {
  const TelevisionPage({Key? key});

  @override
  _TelevisionPageState createState() => _TelevisionPageState();
}

class _TelevisionPageState extends State<TelevisionPage> {
  List<bool> isLiked = List.filled(18, false); // Initialize a list to track like status for each item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Television'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Televisions',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.1,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 18, // Update the itemCount to accommodate additional images
              itemBuilder: (context, index) {
                List<String> imageUrls = [
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv1.webp?alt=media&token=91c011d2-07ac-4cd7-a6b6-4977f5f26656',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv2.webp?alt=media&token=2f79ec0a-5431-479d-a859-248dfb3aa1e2',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv3.webp?alt=media&token=9948986b-5719-4320-b02f-8fcdd4367e96',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv4.webp?alt=media&token=b051f47f-92b3-4f0d-95c9-0eeb963a6db6',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv5.webp?alt=media&token=b51c434f-c9df-4021-9dd5-18088e1b41d3',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv6.webp?alt=media&token=72241348-6166-4613-9667-90a729624329',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv7.webp?alt=media&token=7b578a16-4f1a-44cb-8883-79a64fe402bd',
                  'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/TVs%2Ftv8.webp?alt=media&token=493cd8d2-4c24-45bc-8e23-d5738342ac72',
                ];

                return Card(
                  child: InkWell(
                    onTap: () {
                      // Navigate to a new detail page when a container is clicked
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(imagePath: imageUrls[index]),
                      ));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(imageUrls[index]),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                isLiked[index] ? Icons.favorite : Icons.favorite_border,
                                color: isLiked[index] ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isLiked[index]) {
                                    // Item is already liked, so remove it from the wishlist
                                    isLiked[index] = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Removed from Wishlist')),
                                    );
                                  } else {
                                    // Item is not liked, so add it to the wishlist
                                    isLiked[index] = true;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Added to Wishlist!')),
                                    );
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String imagePath;

  DetailsPage({required this.imagePath});

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


