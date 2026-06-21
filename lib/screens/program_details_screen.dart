import 'package:flutter/material.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final title = args?['title'] ?? "Flutter App Development Internship";
    final duration = args?['duration'] ?? "12 Weeks";
    final level = args?['level'] ?? "Beginner";
    final description = args?['description'] ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text("Program Details"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D1B2A), Color(0xFF1BA7A6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.school, color: Colors.white, size: 70),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Learn • Grow • Succeed with Excelerate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Program Information",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),

                          infoTile(Icons.menu_book, "Program", title),

                          infoTile(Icons.schedule, "Duration", duration),

                          infoTile(Icons.star, "Level", level),

                          infoTile(
                            Icons.calendar_month,
                            "Start Date",
                            "1 September 2026",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            description,
                            style: const TextStyle(height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Learning Outcomes",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          outcomeItem(
                            Icons.check_circle,
                            "Practical Skills Development",
                          ),

                          outcomeItem(Icons.check_circle, "Industry Exposure"),

                          outcomeItem(
                            Icons.check_circle,
                            "Project Development",
                          ),

                          outcomeItem(
                            Icons.check_circle,
                            "Certification Preparation",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // =========================
                  // TRAINER INFO
                  // =========================
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xFF1BA7A6),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Trainer Information",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("Dr. Sarah Johnson"),
                                Text("Senior Industry Expert"),
                                Text("10+ Years Experience"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =========================
                  // REGISTER BUTTON
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1BA7A6),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.app_registration),
                      label: const Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration Successful 🎉"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xFF1BA7A6)),
      title: Text(title),
      subtitle: Text(value),
    );
  }

  Widget outcomeItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
