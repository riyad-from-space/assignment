import 'package:flutter/material.dart';



class ListGridScreen extends StatefulWidget {
  @override
  _ListGridScreenState createState() => _ListGridScreenState();
}

class _ListGridScreenState extends State<ListGridScreen> {
  bool _isGridView = false;
  final List<String> _items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView & GridView Example'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: _isGridView
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: Center(
              child: Text(
                _items[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      )
          : ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(
                _items[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
