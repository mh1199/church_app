import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class DownloadCertPage extends StatefulWidget {
  const DownloadCertPage({Key? key}) : super(key: key);

  @override
  State<DownloadCertPage> createState() => DownloadCertPageState();
}

class DownloadCertPageState extends State<DownloadCertPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<DownloadCertPage> {

  void _download() {
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(locator<NavigationService>().context()).pop();
        },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Text("My Certificate", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
              ],),
              SizedBox(height: 30,),
              Image.asset(
                'assets/images/cert_download.png', // Use the asset image
                width: screenWidth, // Set width to screen width
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.25,// Fit the image width
              ),
              SizedBox(height: 20), // Space between image and text
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _download ,
                  child: Text('Download E-Baptism', style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/images/cert_download.png', // Use the asset image
                width: screenWidth, // Set width to screen width
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              SizedBox(height: 20), // Space between image and text
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _download ,
                  child: Text('Download E-Member', style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}