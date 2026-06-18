import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'program_listing_screen.dart';
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
    final userData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final userName = userData?['name'] ?? 'Learner';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "E-Training App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Powered by Excelerate",
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
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

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProgramListingScreen()),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(userData: userData ?? {}),
              ),
            );
          }
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, color: Color(0xFF1BA7A6)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, $userName 👋",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
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
                hintText: "Search Excelerate Programs...",
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

            const Text(
              "Learning Categories",
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
                  title: "Mobile Dev",
                  icon: Icons.phone_android,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "AI & Data",
                  icon: Icons.analytics,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "Research",
                  icon: Icons.psychology,
                  onTap: () {},
                ),
                CategoryCard(
                  title: "Career Prep",
                  icon: Icons.work,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Excelerate Opportunities",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ProgramCard(
              title: "Flutter App Development Internship",
              duration: "12 Weeks",
              level: "Beginner",
              icon: Icons.phone_android,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            ProgramCard(
              title: "AI-Powered Data Analysis Internship",
              duration: "10 Weeks",
              level: "Intermediate",
              icon: Icons.analytics,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            ProgramCard(
              title: "Prompt Engineering Research Program",
              duration: "8 Weeks",
              level: "Intermediate",
              icon: Icons.psychology,
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Excelerate Updates",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            _announcementCard(
              "Applications Open for Flutter Internship Cohort",
            ),

            _announcementCard("New AI & Data Analysis Programs Added"),

            _announcementCard(
              "Upcoming Excelerate Career Development Workshop",
            ),
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
