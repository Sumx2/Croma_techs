import 'package:flutter/material.dart';

class TelevisionPage extends StatefulWidget {
  const TelevisionPage({Key? key});

  @override
  _TelevisionPageState createState() => _TelevisionPageState();
}

class _TelevisionPageState extends State<TelevisionPage> {
  List<bool> isLiked = List.filled(12, false); // Initialize a list to track like status for each item

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
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(0.5),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.1,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      List<String> imagePaths = [
                        'assets/t1.jpg',
                        'assets/t2.jpg',
                        'assets/t3.jpg',
                        'assets/t4.jpg',
                        'assets/t5.jpg',
                        'assets/t6.jpg',
                        'assets/t7.jpg',
                        'assets/t8.jpg',
                        'assets/t9.jpg',
                        'assets/t10.jpg',
                        'assets/t11.jpg',
                        'assets/t12.jpg',
                      ];
                      return Card(
                        child: InkWell(
                          onTap: () {
                            // Navigate to a new detail page when a container is clicked
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsPage(imagePath: imagePaths[index]),
                            ));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(imagePaths[index]),
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
        child: Image.asset(imagePath),
      ),
    );
  }
}