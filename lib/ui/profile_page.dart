import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:church_system/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../services/navigation_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<ProfilePage> {

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text("Profile", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
            ],),
            SizedBox(height: 30,),
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
                    Text(
                      'Adam',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text('adam@gmail.com'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_PROFILE,
              title: 'Account',
              subtitle: 'Change account and personal information',
              onTap: () {},
            ),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_CERT,
              title: 'Download E-Member Cert',
              subtitle: 'Download E-Member certificate as PDF',
              onTap: () {},
            ),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_CERT,
              title: 'Download E-Baptism Cert',
              subtitle: 'Download E-Baptism certificate as PDF',
              onTap: () {},
            ),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_TRANSLATE,
              title: 'Language',
              subtitle: 'Change your preference language',
              onTap: () {},
            ),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_TRANSLATE,
              title: 'Mode',
              subtitle: 'Change your preference light or dark mode',
              onTap: () {},
            ),
            SizedBox(height: 10),
            buildProfileOption(
              icon: Constants.PATH_ICON_PROFILE_EXIT,
              title: 'Leave Church',
              subtitle: 'Leave the current church',
              isDestructive: true,
              onTap: () {},
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Routes.router.navigateTo(locator<NavigationService>().context(), Routes.login,replace: true);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption({
    required String icon,
    required String title,
    required String subtitle,
    bool isDestructive = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading:
      // Icon(icon, color: isDestructive ? Colors.red : Colors.black),
      Image.asset(
        icon,
        color: isDestructive ? Colors.red : Colors.black,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDestructive ? Colors.red : Colors.black,
        ),
      ),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}