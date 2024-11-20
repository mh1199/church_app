import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../configs/locator.dart';
import '../services/navigation_service.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  State<EventDetailPage> createState() => EventDetailPageState();
}

final String eventImagePath = 'assets/images/event_placeholder.png';
final String locationImagePath = 'assets/images/placeholder.png';
final String profileImagePath = 'assets/images/placeholder.png';
final String locationIconPath = 'assets/images/placeholder.png';

void _openGoogleMaps() async {
  // const url = 'https://www.google.com/maps/search/?api=1&query=East+Los+Angeles';
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not open the map.';
  // }
}

class EventDetailPageState extends State<EventDetailPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<EventDetailPage> {

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                Image.asset(
                  eventImagePath,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.cover,
                ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Community Service Day: Sharing God’s Love",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Saturday, December 23, 2024 | 9:00 AM – 2:00 PM"
                                      "\nNeighborhood Park Pavilion, 654 Kindness Way, Oakdale",
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                ),
                                SizedBox(height: 4),
                                GestureDetector(
                                  onTap: _openGoogleMaps,
                                  child: Text(
                                    "RSVP NOW!",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: _openGoogleMaps,
                            child: Image.asset(
                              locationIconPath,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic of the Day",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\"Truly I tell you, whatever you did for one of the least of these brothers and sisters of mine, you did for me.\" – Matthew 25:40"
                        "\n\nJoin hands in making a difference in our local community. Participate in various service projects, from food drives to neighborhood clean-ups, as we live out the love of Christ through action.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(profileImagePath), // Replace with actual image URL
                            radius: 12,
                          ),
                          Positioned(
                            left: -3,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(profileImagePath),
                              radius: 16,
                            ),
                          ),
                          Positioned(
                            left: 16,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(profileImagePath),
                              radius: 16,
                            ),
                          ),
                          Positioned(
                            left: 32,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(profileImagePath),
                              radius: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '2345+',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Going",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          // Add share functionality here
                        },
                        icon: Icon(Icons.share, color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add booking functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "BOOK NOW",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}