import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => EditAccountPageState();
}

class EditAccountPageState extends State<EditAccountPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<EditAccountPage> {

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(locator<NavigationService>().context()).pop();
        },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(children: [
              Text("Edit Account Information", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
            ],),
            SizedBox(height: 50,),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/placeholder.png'), // Replace with actual image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Edit Picture',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 50,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text('Edit', style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}