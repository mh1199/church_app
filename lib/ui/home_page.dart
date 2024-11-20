import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../services/navigation_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<HomePage> {

  final List<Map<String, dynamic>> events = [
    {
      "title": 'Worship Night: A Heart of Gratitude',
      'time': '7:00 PM',
      'location': 'City Park',
      'image': 'assets/images/event_1.jpg',
  'onRSVP': () {
    Routes.router.navigateTo(
        locator<NavigationService>().context(), Routes.eventOne);
  }
    },
    {
      'title': 'Family Fun and Faith Festival',
      'time': '5:30 PM',
      'location': 'Art Gallery',
      'image': 'assets/images/event_2.jpeg',
      'onRSVP': ()  {
        Routes.router.navigateTo(
            locator<NavigationService>().context(), Routes.eventTwo);
      }
    },
    {
      'title': 'Prayer Breakfast: Strengthening Our Faith',
      'time': '3:00 PM',
      'location': 'Tech Hub',
      'image': 'assets/images/event_three.jpg',
      'onRSVP': ()  {
        Routes.router.navigateTo(
            locator<NavigationService>().context(), Routes.eventThree);
      }
    },
    {
      'title': 'Youth Empowerment Retreat: Shine Your Light',
      'time': '12:00 PM',
      'location': 'Main Street',
      'image': 'assets/images/event_four.jpg',
      'onRSVP': () {
        Routes.router.navigateTo(
            locator<NavigationService>().context(), Routes.eventFour);
      }
    },
    {
      'title': 'Community Outreach: Serve with Love',
      'time': '8:00 AM',
      'location': 'Riverside Park',
      'image': 'assets/images/event_five.jpg',
      'onRSVP': ()  {
        Routes.router.navigateTo(
            locator<NavigationService>().context(), Routes.eventFive);
      }
    },
  ];

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Adam,',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Welcome to FaithConnect',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Coming Events',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                // EventCard(
                //   imageUrl: 'assets/images/placeholder.png', // replace with your image asset
                //   title: 'Title',
                //   time: '10:30 PM, Location',
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: events.map((event) => _buildEventCard(event)).toList(),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'My RSVP',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: RSVPCard(
                        imageUrl: 'assets/images/placeholder.png', // replace with your image asset
                        title: 'Title',
                        time: '10:30 PM, Location',
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: RSVPCard(
                        imageUrl: 'assets/images/placeholder.png', // replace with your image asset
                        title: 'Title',
                        time: '10:30 PM, Location',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;

  EventCard({
    required this.imageUrl,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Routes.router.navigateTo(
                        locator<NavigationService>().context(), Routes.eventDetail);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('RSVP Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RSVPCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;

  RSVPCard({
    required this.imageUrl,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildEventCard(Map<String, dynamic> event) {
  return Container(
    margin: EdgeInsets.only(right: 16),
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 6,
          spreadRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.asset(
            event['image']!,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event['title']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                '${event['time']!}, ${event['location']!}',
                style: TextStyle(color: Colors.grey),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: event['onRSVP'],
                  child: Text(
                    'RSVP Now',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


