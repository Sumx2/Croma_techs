import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, List<String>>> categoriesData = [
    {
      'Brand': [
        'Apple',
        'Samsung',
        'Google',
        'OnePlus',
        'Huawei',
        'Xiaomi',
        'Oppo',
        'Vivo',
        'Sony',
        'Nokia',
        'Motorola',
      ],
    },
    {
      'Operating System': [
        'iOS',
        'Android',
        'Windows',
      ],
    },
    {
      'Price Range': [
        'Budget Phones',
        'Mid-Range Phones',
        'Premium Phones',
        'Luxury Phones',
      ],
    },
    // Add more categories and subcategories here.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categoriesData.length,
        itemBuilder: (context, index) {
          final category = categoriesData[index];
          final categoryName = category.keys.first;
          final subcategories = category.values.first;

          return ExpansionTile(
            title: Text(categoryName),
            children: subcategories.map((subcategory) {
              return ListTile(
                title: Text(subcategory),
                // Add navigation logic for subcategory here.
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
