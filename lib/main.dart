import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 16, 128),
        title: const Center(
          child: Text(
            "Assignment 6",
            style: TextStyle(
                fontFamily: 'Helvetica',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with Circle Image and Text
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 40, // Size of the circle image
                    backgroundImage: AssetImage(
                        'lib/image/profile4.jpg'), // Add your image path here
                  ),
                  SizedBox(width: 20), // Space between image and text

                  // Text Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nice to meet you,",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "I'm Gem Win Canete!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 84, 16, 128),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                  height: 30), // Space between the intro and next section

              // Bio Section
              const Text(
                "My Bibliography",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 16, 128),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "A passionate Computer Science student specializing in Artificial Intelligence. "
                "I have a keen interest in developing solutions using modern technologies and improving my skills in programming and software development.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Carousel Section
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  aspectRatio: 2.0,
                ),
                items: [
                  'lib/image/profile.png',
                  'lib/image/profile2.jpg',
                  'lib/image/profile3.jpg',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // "What else?" Section
              const Text(
                "What else?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 16, 128),
                ),
              ),
              const SizedBox(height: 10),

              // Information Section
              const InfoRow(
                icon: Icons.email,
                label: 'Email',
                data: 'Canetegemwin@gmail.com',
                iconColor: Color.fromARGB(255, 84, 16, 128),
              ),
              const InfoRow(
                icon: Icons.school,
                label: 'School',
                data: 'West Visayas State University',
                iconColor: Color.fromARGB(255, 84, 16, 128),
              ),
              const InfoRow(
                icon: Icons.phone,
                label: 'Number',
                data: '09390290214',
                iconColor: Color.fromARGB(255, 84, 16, 128),
              ),
              const InfoRow(
                icon: Icons.location_pin,
                label: 'Location',
                data: 'Iloilo City',
                iconColor: Color.fromARGB(255, 84, 16, 128),
              ),
              const InfoRow(
                icon: Icons.favorite,
                label: 'Loves',
                data: 'Exploring',
                iconColor: Color.fromARGB(255, 84, 16, 128),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget to display icon, label, and data with custom icon color
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;
  final Color iconColor;

  const InfoRow({
    super.key, // Using super parameters for key
    required this.icon,
    required this.label,
    required this.data,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 10),
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            data,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
