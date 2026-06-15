import 'package:flutter/material.dart';

import '../widgets/category_card.dart';
import '../widgets/program_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Training App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF1BA7A6),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Programs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1B2A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFF1BA7A6)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Future Developer 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search Programs...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Categories
            const Text(
              "Categories",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                CategoryCard(
                  title: "Development",
                  icon: Icons.code,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "Design",
                  icon: Icons.design_services,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "Business",
                  icon: Icons.business_center,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "Data Science",
                  icon: Icons.analytics,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Popular Programs
            const Text(
              "Popular Programs",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ProgramCard(
              title: "Flutter Development",
              duration: "12 Weeks",
              level: "Beginner",
              icon: Icons.phone_android,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            ProgramCard(
              title: "UI/UX Design",
              duration: "10 Weeks",
              level: "Intermediate",
              icon: Icons.brush,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            ProgramCard(
              title: "Data Science",
              duration: "14 Weeks",
              level: "Advanced",
              icon: Icons.analytics,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            const SizedBox(height: 20),

            // Announcements
            const Text(
              "Announcements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            _announcementCard("Flutter Bootcamp Registration Open"),

            _announcementCard("New Programs Available"),

            _announcementCard("Workshop Starts Next Week"),
          ],
        ),
      ),
    );
  }

  Widget _announcementCard(String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.campaign, color: Color(0xFF1BA7A6)),
        title: Text(title),
      ),
    );
  }
}
