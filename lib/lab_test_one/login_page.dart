import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int _quantity = 0;
  double _sliderValue = 0;
  double _pricePerItem = 100;
  double _totalPrice = 0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _sliderValue = _quantity.toDouble();
      _updateTotalPrice();
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        _sliderValue = _quantity.toDouble();
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    _totalPrice = _quantity * _pricePerItem;
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
      _quantity = value.toInt();
      _updateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary', style: TextStyle(fontSize: 22)), // Increased font size
        backgroundColor: Colors.brown[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smartphone Application Development',
                  style: TextStyle(fontSize: 18, color: Colors.brown[300]),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
        
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/app_development.jpg",
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: 'Phone',
                  decoration: InputDecoration(
                    labelText: 'Divisions',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  items: ['Phone', 'Laptop', 'PC']
                      .map((item) => DropdownMenuItem(
                    child: Text(item, style: TextStyle(fontSize: 18)),
                    value: item,
                  ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 16),
                Text(
                  'Quantity',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.brown[400],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: IconButton(
                          onPressed: _decrementQuantity,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          color: Colors.brown[400],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '$_quantity',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 16),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.brown[400],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: IconButton(
                          onPressed: _incrementQuantity,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          color: Colors.brown[400],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100, // Set the max quantity limit
                  divisions: 10,
                  label: _sliderValue.round().toString(),
                  onChanged: _onSliderChanged,
                ),
                SizedBox(height: 16),
                Text(
                  'Price: BDT ${_totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18), // Increased font size
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the order
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Order Submitted')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 18), // Increased font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
