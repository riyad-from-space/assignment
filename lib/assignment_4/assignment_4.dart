import 'package:flutter/material.dart';

class CustomAndExpandableListView extends StatelessWidget {
  const CustomAndExpandableListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Custom & Expandable ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text(
              'Custom ListView',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildCustomListView(),
            const SizedBox(height: 20),
            const Text(
              'Expandable ListView',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildExpandableListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListView() {
    final List<Map<String, String>> products = [
      {'title': 'iPhone 13', 'price': '\$999'},
      {'title': 'Samsung Galaxy S21', 'price': '\$899'},
      {'title': 'MacBook Air', 'price': '\$1099'},
      {'title': 'Apple Watch', 'price': '\$399'},
      {'title': 'Sony Headphones', 'price': '\$299'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal.shade50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    products[index]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    products[index]['price']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.teal.shade700,
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

  Widget _buildExpandableListView() {
    final List<Map<String, dynamic>> categories = [
      {
        'header': 'Fruits',
        'items': ['Apple', 'Banana', 'Mango', 'Grapes', 'Orange']
      },
      {
        'header': 'Vehicles',
        'items': ['Car', 'Motorbike', 'Bicycle', 'Truck']
      },
      {
        'header': 'Programming Languages',
        'items': ['Dart', 'Python', 'JavaScript', 'Java', 'C++']
      },
      {
        'header': 'Cities',
        'items': ['New York', 'Paris', 'Tokyo', 'Dhaka', 'Sydney']
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            backgroundColor: Colors.teal.shade50,
            collapsedBackgroundColor: Colors.teal.shade100,
            iconColor: Colors.teal,
            collapsedIconColor: Colors.teal.shade700,
            title: Text(
              categories[index]['header'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: (categories[index]['items'] as List<String>)
                .map(
                  (item) => ListTile(
                leading: Icon(
                  Icons.label,
                  color: Colors.teal.shade400,
                ),
                title: Text(item),
              ),
            )
                .toList(),
          ),
        );
      },
    );
  }
}
