import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'program_listing_screen.dart';
import '../widgets/category_card.dart';
import '../widgets/program_card.dart';
import '../widgets/page_transition.dart';
import '../data/notifications_data.dart';
import '../models/notification_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final TextEditingController searchController = TextEditingController();
  int get unreadCount {
    return notifications.where((n) => !n.isRead).length;
  }

  @override
  Widget build(BuildContext context) {
    final userData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final userName = userData?['name'] ?? 'Learner';
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: showNotifications,
                ),

                if (unreadCount > 0)
                  Positioned(
                    right: 10,
                    top: 10,

                    child: Container(
                      padding: const EdgeInsets.all(4),

                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),

                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),

                      child: Text(
                        unreadCount.toString(),

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
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

            switch (index) {
              case 0:
                // Already on Home
                break;

              case 1:
                Navigator.push(
                  context,
                  FadeRoute(page: const ProgramListingScreen()),
                );
                break;

              case 2:
                Navigator.push(
                  context,
                  FadeRoute(page: ProfileScreen(userData: userData ?? {})),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Programs",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D1B2A), Color(0xFF1BA7A6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'app_logo',
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.school,
                          color: Color(0xFF1BA7A6),
                        ),
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome, $userName 👋",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Continue your learning journey with Excelerate.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 18),

                          Row(
                            children: [
                              _infoChip(Icons.school, "5 Programs"),

                              const SizedBox(width: 10),

                              _infoChip(Icons.workspace_premium, "Certified"),
                            ],
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
                controller: searchController,
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      '/programs',
                      arguments: {"category": null, "search": value.trim()},
                    ).then((_) {
                      searchController.clear();
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search Excelerate Programs...",
                  prefixIcon: const Icon(Icons.search),

                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (searchController.text.trim().isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          '/programs',
                          arguments: {
                            "category": null,
                            "search": searchController.text.trim(),
                          },
                        ).then((_) {
                          searchController.clear();
                        });
                      }
                    },
                  ),

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

              const SizedBox(height: 10),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  CategoryCard(
                    title: "Mobile Dev",
                    icon: Icons.phone_android,
                    programCount: "1 Program",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/programs',
                        arguments: {"category": "Mobile Dev", "search": ""},
                      );
                    },
                  ),

                  CategoryCard(
                    title: "AI & Data",
                    icon: Icons.analytics,
                    programCount: "1 Program",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/programs',
                        arguments: {"category": "AI & Data", "search": ""},
                      );
                    },
                  ),

                  CategoryCard(
                    title: "Research",
                    icon: Icons.psychology,
                    programCount: "1 Program",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/programs',
                        arguments: {"category": "Research", "search": ""},
                      );
                    },
                  ),

                  CategoryCard(
                    title: "Career Prep",
                    programCount: "1 Program",
                    icon: Icons.work,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/programs',
                        arguments: {"category": "Career Prep", "search": ""},
                      );
                    },
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
      ),
    );
  }

  void showNotifications() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,

          child: Column(
            children: [
              const SizedBox(height: 15),

              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Notifications",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: unreadCount == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.notifications_off,
                              size: 80,
                              color: Colors.grey,
                            ),

                            SizedBox(height: 20),

                            Text(
                              "You're all caught up!",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "No new notifications.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: notifications.length,

                        itemBuilder: (context, index) {
                          NotificationModel notification = notifications[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),

                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: notification.color.withValues(
                                  alpha: 0.15,
                                ),

                                child: Icon(
                                  notification.icon,
                                  color: notification.color,
                                ),
                              ),

                              title: Text(
                                notification.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),

                                  Text(notification.message),

                                  const SizedBox(height: 5),

                                  Text(
                                    notification.time,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),

                              trailing: notification.isRead
                                  ? const Icon(Icons.done, color: Colors.green)
                                  : const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: unreadCount == 0 ? null : markAllAsRead,
                    icon: const Icon(Icons.done_all),
                    label: const Text("Mark all as read"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.isRead = true;
      }
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications marked as read"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white),

          const SizedBox(width: 5),

          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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
