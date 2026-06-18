import 'package:flutter/material.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> programs = [
    {
      "title": "Flutter App Development Internship",
      "duration": "12 Weeks",
      "level": "Beginner",
      "description": "Learn Flutter and build modern mobile applications.",
      "icon": Icons.phone_android,
    },
    {
      "title": "AI-Powered Data Analysis Internship",
      "duration": "10 Weeks",
      "level": "Intermediate",
      "description": "Learn data analysis, visualization, and AI tools.",
      "icon": Icons.analytics,
    },
    {
      "title": "Prompt Engineering Research Program",
      "duration": "8 Weeks",
      "level": "Intermediate",
      "description":
          "Research and develop advanced prompt engineering techniques.",
      "icon": Icons.psychology,
    },
    {
      "title": "Data Visualization Training Program",
      "duration": "8 Weeks",
      "level": "Beginner",
      "description":
          "Learn data storytelling, dashboards, charts, and visualization tools.",
      "icon": Icons.bar_chart,
    },
    {
      "title": "Full Stack Web Development Internship",
      "duration": "16 Weeks",
      "level": "Advanced",
      "description":
          "Build responsive web applications using frontend and backend technologies.",
      "icon": Icons.web,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPrograms = selectedFilter == "All"
        ? programs
        : programs
              .where((program) => program["level"] == selectedFilter)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Programs"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Header Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF0D1B2A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore Programs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Find the perfect course for your career growth.",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search programs...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildChip("All"),
                        buildChip("Beginner"),
                        buildChip("Intermediate"),
                        buildChip("Advanced"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Program List
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredPrograms.length,
                      itemBuilder: (context, index) {
                        final program = filteredPrograms[index];

                        return programCard(
                          context,
                          title: program["title"],
                          duration: program["duration"],
                          level: program["level"],
                          description: program["description"],
                          icon: program["icon"],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(label),
        selected: selectedFilter == label,
        selectedColor: const Color(0xFF1BA7A6),
        labelStyle: TextStyle(
          color: selectedFilter == label ? Colors.white : Colors.black,
        ),
        onSelected: (_) {
          setState(() {
            selectedFilter = label;
          });
        },
      ),
    );
  }

  Widget programCard(
    BuildContext context, {
    required String title,
    required String duration,
    required String level,
    required String description,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF1BA7A6),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "$duration • $level",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(description, style: TextStyle(color: Colors.grey.shade700)),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: {
                      "title": title,
                      "duration": duration,
                      "level": level,
                    },
                  );
                },
                child: const Text("View Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
