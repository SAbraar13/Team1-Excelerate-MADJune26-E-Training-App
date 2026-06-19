import 'package:flutter/material.dart';
import 'feedback_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF1BA7A6),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Name"),
                subtitle: Text(
                  userData['name'] ?? 'Unknown User',
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: Text(
                  userData['email'] ?? '',
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.workspace_premium,
                  color: Color(0xFF1BA7A6),
                ),
                title: const Text("Program Status"),
                subtitle: const Text("Active Learner"),
              ),
            ),

            const SizedBox(height: 40),

            // Feedback Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.feedback),
                label: const Text("Give Feedback"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1BA7A6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const FeedbackScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text(
                        "Are you sure you want to logout?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}