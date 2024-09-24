import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondAssignment extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SecondAssignment> {
  bool _isChecked = false;
  String _selectedRadio = 'Option 1';
  double _rating = 3.0;
  double _sliderValue = 50;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 2',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,


          ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox Card
              _buildCard(
                title: 'Checkbox',
                backgroundColor: Colors.tealAccent,
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: Colors.purple,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Select this option',
                      style: TextStyle(fontSize: 16, color: Colors.purple),
                    ),
                  ],
                ),
              ),

              // Radio Buttons Card
              _buildCard(
                title: 'Radio Buttons',
                backgroundColor: Colors.lightBlueAccent,
                child: Column(
                  children: [
                    _buildRadioOption('Option 1', Colors.pink),
                    _buildRadioOption('Option 2', Colors.pink),
                  ],
                ),
              ),

              // Rating Bar Card
              _buildCard(
                title: 'Rating Bar',
                backgroundColor: Colors.amberAccent,
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.redAccent,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),

              // Slider (SeekBar) Card
              _buildCard(
                title: 'Slider (SeekBar)',
                backgroundColor: Colors.orangeAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume: ${_sliderValue.round()}',
                      style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                    ),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.orange[200],
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Switch Card
              _buildCard(
                title: 'Switch',
                backgroundColor: Colors.greenAccent,
                child: Row(
                  children: [
                    Switch(
                      value: _switchValue,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                    Text(
                      _switchValue ? 'On' : 'Off',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCard({required String title, required Widget child, required Color backgroundColor}) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }


  Widget _buildRadioOption(String option, Color color) {
    return Row(
      children: [
        Radio<String>(
          value: option,
          groupValue: _selectedRadio,
          activeColor: Colors.deepPurple,
          onChanged: (String? value) {
            setState(() {
              _selectedRadio = value!;
            });
          },
        ),
        Text(option, style: TextStyle(fontSize: 16, color: color)),
      ],
    );
  }
}
