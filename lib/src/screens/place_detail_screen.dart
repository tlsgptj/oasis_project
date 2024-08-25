import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final dynamic place;

  const PlaceDetailScreen({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['place_name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place['place_name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(place['address_name']),
            SizedBox(height: 16),
            Text('Category: ${place['category_name']}'),
            SizedBox(height: 16),
            Text('Phone: ${place['phone']}'),
            SizedBox(height: 16),
            Text('URL: ${place['place_url']}'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
