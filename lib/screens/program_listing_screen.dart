import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  String selectedFilter = "All";

  List<dynamic> programs = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadPrograms();
  }

  Future<void> loadPrograms() async {
    await Future.delayed(const Duration(seconds: 1));
    final String response = await rootBundle.loadString(
      'assets/data/programs.json',
    );

    final data = json.decode(response);

    setState(() {
      programs = data;
      isLoading = false;
    });
  }

  IconData getProgramIcon(String iconName) {
    switch (iconName) {
      case "phone_android":
        return Icons.phone_android;

      case "analytics":
        return Icons.analytics;

      case "psychology":
        return Icons.psychology;

      case "bar_chart":
        return Icons.bar_chart;

      case "web":
        return Icons.web;

      default:
        return Icons.school;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
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
                          shortDescription: program["shortDescription"],
                          fullDescription: program["description"],
                          icon: getProgramIcon(program["icon"]),
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
    required String shortDescription,
    required String fullDescription,
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

            Text(
              shortDescription,
              style: TextStyle(color: Colors.grey.shade700),
            ),

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
                      "description": fullDescription,
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
