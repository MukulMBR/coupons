import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCouponPage extends StatefulWidget {
  @override
  _AddCouponPageState createState() => _AddCouponPageState();
}

class _AddCouponPageState extends State<AddCouponPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _saveCoupon() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference couponsCollection = firestore.collection('coupons');

    // Get the values from the text fields
    String couponTitle = titleController.text;
    String couponDescription = descriptionController.text;

    // Check if both title and description are not empty
    if (couponTitle.isNotEmpty && couponDescription.isNotEmpty) {
      // Create a new document in the "coupons" collection
      couponsCollection.add({
        'title': couponTitle,
        'description': couponDescription,
        // Add other fields as needed (e.g., image URL)
      }).then((value) {
        // Coupon successfully added to Firestore
        // You can show a success message or navigate back to the previous page
        Navigator.of(context).pop(); // Navigate back to the previous page (home page)
      }).catchError((error) {
        // Handle errors here (e.g., show an error message)
        print('Error adding coupon: $error');
      });
    } else {
      // Show an error message because both title and description are required
      // You can implement your own error handling here (e.g., show a snackbar)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Coupon Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            // Add widget to handle image upload (e.g., ImagePicker or FilePicker)
            // You can use a RaisedButton or any other suitable widget
            ElevatedButton(
              onPressed: () {
                // Add logic to handle image upload here
              },
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveCoupon, // Call the _saveCoupon function
        child: Icon(Icons.save),
      ),
    );
  }
}
