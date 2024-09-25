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
              fontWeight: FontWeight.bold,
            ),
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

                  // Adding Spacer to push content
                  Spacer(),
                ],
              ),

              const SizedBox(
                  height: 30), // Space between the intro and next section

              // Bio Section
              const Text(
                "Biography",
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
              const SizedBox(height: 30),

              // "What else?" Section
              const Text(
                "What else?",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 16, 128),
                ),
              ),
              const SizedBox(height: 10),

              //More about me
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(
                      icon: Icons.email,
                      label: 'Email',
                      data: 'Canetegemwin@gmail.com',
                      iconColor: Color.fromARGB(255, 84, 16, 128),
                    ),
                    InfoRow(
                      icon: Icons.school,
                      label: 'School',
                      data: 'West Visayas State University',
                      iconColor: Color.fromARGB(255, 84, 16, 128),
                    ),
                    InfoRow(
                      icon: Icons.phone,
                      label: 'Number',
                      data: '09390290214',
                      iconColor: Color.fromARGB(255, 84, 16, 128),
                    ),
                    InfoRow(
                      icon: Icons.location_pin,
                      label: 'Location',
                      data: 'Iloilo City',
                      iconColor: Color.fromARGB(255, 84, 16, 128),
                    ),
                    InfoRow(
                      icon: Icons.favorite,
                      label: 'Loves',
                      data: 'Exploring',
                      iconColor: Color.fromARGB(255, 84, 16, 128),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Gallery Section with GridView
              const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 16, 128),
                ),
              ),
              const SizedBox(height: 10),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(4, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage('lib/image/profile${index + 2}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
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
          Expanded(
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis, // Truncate text if too long
            ),
          ),
        ],
      ),
    );
  }
}
