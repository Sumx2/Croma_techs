// import 'package:flutter/material.dart';
//
// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   String searchTerm = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search', style: TextStyle(color: Colors.teal),),
//
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   searchTerm = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search for products...',
//               ),
//             ),
//           ),
//           Expanded(
//             child: buildSearchResults(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSearchResults() {
//     // Implement your search logic here and return a dynamic list of results
//     // based on the 'searchTerm'. You can use ListView.builder or GridView.builder
//     // to display search results.
//     return ListView.builder(
//       itemCount: 10, // Replace with the actual number of search results
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('Search Result $index'),
//           // Add other widgets and information related to the search results here.
//         );
//       },
//     );
//   }
// }
