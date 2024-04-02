// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
//
// import 'package:flutter/material.dart';
//
// class SpeakerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speakers'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           SpeakerCard(
//             speaker: Speaker(
//               name: 'JBL Flip 4',
//               description: 'Portable Bluetooth Speaker',
//               price: 99.99,
//               imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/mobiles%2Fiphone-15-finish-select-202309-6-1inch-blue.jpeg?alt=media&token=c49170c1-e9ca-4ac8-953d-7d7e6a836fa1',
//             ),
//           ),
//           // Add more SpeakerCard widgets with different speakers here
//         ],
//       ),
//     );
//   }
// }
//
// class Speaker {
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;
//
//   Speaker({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });
// }
//
// class SpeakerCard extends StatelessWidget {
//   final Speaker speaker;
//
//   SpeakerCard({required this.speaker});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Image.network(
//             speaker.imageUrl,
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           ListTile(
//             title: Text(speaker.name),
//             subtitle: Text(speaker.description),
//             trailing: Text('\$${speaker.price.toStringAsFixed(2)}'),
//           ),
//           // Add more information as needed (e.g., ratings, reviews, etc.)
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class SpeakerPage extends StatefulWidget {
  @override
  _SpeakerPageState createState() => _SpeakerPageState();
}

class _SpeakerPageState extends State<SpeakerPage> {
  double? _selectedPrice;
  List<Speaker> _speakers = [];
  List<Speaker> _wishlist = [];

  @override
  void initState() {
    super.initState();
    _initializeSpeakers();
  }

  void _initializeSpeakers() {
    setState(() {
      _speakers = [
        Speaker(
          name: 'JBL Flip 4',
          description: 'Portable Bluetooth Speaker',
          price: 99.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs1.webp?alt=media&token=67ccc1bc-b3ad-4c4d-97b4-d4d2e5109a92',
        ),
        Speaker(
          name: 'Sony SRS-XB12',
          description: 'Extra Bass Portable Bluetooth Speaker',
          price: 59.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs2.webp?alt=media&token=ef734896-83c2-4838-9fdc-5353dd0258af',
        ),
        Speaker(
          name: 'Bose SoundLink Color II',
          description: 'Bluetooth Speaker',
          price: 129.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs3.webp?alt=media&token=70c78d07-9870-4c2d-a52f-5820fc97c248',
        ),
        Speaker(
          name: 'JBL Charge 4',
          description: 'Waterproof Portable Bluetooth Speaker',
          price: 179.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs6.webp?alt=media&token=bad887f5-62af-4576-b6ca-7ca4c490c08c',
        ),
        Speaker(
          name: 'UE Boom 3',
          description: 'Portable Bluetooth Speaker',
          price: 149.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs7.webp?alt=media&token=7d46c528-2fec-45f7-9b13-bbd1b186b49e',
        ),
        Speaker(
          name: 'Sonos Move',
          description: 'Battery-powered Smart Speaker',
          price: 399.99,
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/croma-techs.appspot.com/o/Speakers%2Fs8.webp?alt=media&token=c50c901b-2afc-4fd9-98e8-fe2cb8e9fd9a',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speakers'),
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
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _speakers.length,
        itemBuilder: (context, index) {
          return SpeakerCard(
            speaker: _speakers[index],
            onWishlistChanged: (bool newValue) {
              setState(() {
                if (newValue) {
                  _wishlist.add(_speakers[index]);
                } else {
                  _wishlist.remove(_speakers[index]);
                }
              });
            },
          );
        },
      ),
    );
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
                value: 30.0,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              RadioListTile<double>(
                title: Text('\$0 - \$100'),
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
                title: Text('\$100 - \$200'),
                value: 200.0,
                groupValue: _selectedPrice,
                onChanged: (double? value) {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              RadioListTile<double>(
                title: Text('\$200+'),
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
            children: _wishlist.map((speaker) {
              return ListTile(
                title: Text(speaker.name),
                subtitle: Text(speaker.description),
                trailing: Text('\$${speaker.price.toStringAsFixed(2)}'),
                leading: Image.network(speaker.imageUrl),
                onTap: () {
                  setState(() {
                    _wishlist.remove(speaker);
                  });
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class Speaker {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Speaker({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;
  final Function(bool) onWishlistChanged;

  SpeakerCard({required this.speaker, required this.onWishlistChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onWishlistChanged(true);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                speaker.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    speaker.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(speaker.description),
                  Text(
                    '\$${speaker.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SpeakerPage(),
  ));
}