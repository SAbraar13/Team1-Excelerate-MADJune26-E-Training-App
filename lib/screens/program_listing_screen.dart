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
  String? selectedCategory;
  List<dynamic> programs = [];

  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  bool isLoading = true;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    loadPrograms();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      selectedCategory = args?["category"];

      searchText = (args?["search"] ?? "").toString().toLowerCase();

      searchController.text = searchText;

      _initialized = true;
    }
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

  void clearSearch() {
    searchController.clear();

    setState(() {
      searchText = "";
      selectedCategory = null;
      selectedFilter = "All";
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
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF1BA7A6).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  color: Color(0xFF1BA7A6),
                  strokeWidth: 3,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Loading Programs...",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Please wait while we fetch the latest opportunities.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    List<dynamic> filteredPrograms = programs;

    // Filter by Category
    if (selectedCategory != null) {
      filteredPrograms = filteredPrograms.where((program) {
        return program["category"] == selectedCategory;
      }).toList();
    }

    // Filter by Level
    if (selectedFilter != "All") {
      filteredPrograms = filteredPrograms.where((program) {
        return program["level"] == selectedFilter;
      }).toList();
    }

    // Filter by Search

    // Filter by Search
    if (searchText.isNotEmpty) {
      filteredPrograms = filteredPrograms.where((program) {
        final title = program["title"].toString().toLowerCase();

        final description = program["shortDescription"]
            .toString()
            .toLowerCase();

        final level = program["level"].toString().toLowerCase();

        final category = program["category"].toString().toLowerCase();

        final duration = program["duration"].toString().toLowerCase();

        return title.contains(searchText) ||
            description.contains(searchText) ||
            category.contains(searchText) ||
            level.contains(searchText) ||
            duration.contains(searchText);
      }).toList();
    }

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
          if (selectedCategory != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Showing $selectedCategory Programs",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value.trim().toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search programs...",
                      prefixIcon: const Icon(Icons.search),

                      suffixIcon: searchText.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: clearSearch,
                            )
                          : null,

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
                    child: filteredPrograms.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 70,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "No Programs Found",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Try another keyword or filter.",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredPrograms.length,
                            itemBuilder: (context, index) {
                              final program = filteredPrograms[index];

                              return TweenAnimationBuilder<double>(
                                duration: Duration(
                                  milliseconds: 300 + (index * 100),
                                ),
                                tween: Tween(begin: 0, end: 1),
                                builder: (context, value, child) {
                                  return Opacity(
                                    opacity: value,
                                    child: Transform.translate(
                                      offset: Offset(0, 30 * (1 - value)),
                                      child: child,
                                    ),
                                  );
                                },
                                child: programCard(
                                  context,
                                  title: program["title"],
                                  duration: program["duration"],
                                  level: program["level"],
                                  shortDescription: program["shortDescription"],
                                  fullDescription: program["description"],
                                  icon: getProgramIcon(program["icon"]),
                                ),
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
