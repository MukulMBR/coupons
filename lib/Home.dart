import 'package:coupons/AddCoupons.dart';
import 'package:coupons/Settings.dart';
import 'package:flutter/material.dart'; // Import the SettingsPage

class HomePage extends StatelessWidget {
  final List<Coupon> coupons = [
    Coupon(
      title: '50% off at Restaurant XYZ',
      description: 'Enjoy a delicious meal at half price!',
      imageUrl: 'assets/zomato.jpg',
    ),
    // Add more coupons here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupon App'),
        leading: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'add_coupons') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddCouponPage(),
                ),
              );
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'add_coupons',
              child: Text('Add Coupons'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // Settings Icon
            onPressed: () {
              // Navigate to the SettingsPage
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return CouponCard(coupon: coupons[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to create and share coupons here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Coupon {
  final String title;
  final String description;
  final String imageUrl;

  Coupon({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  CouponCard({required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 2.0,
      child: Column(
        children: [
          Image.asset(
            coupon.imageUrl,
            fit: BoxFit.cover,
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coupon.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  coupon.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
