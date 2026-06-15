import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final String duration;
  final String level;
  final IconData icon;
  final VoidCallback onTap;

  const ProgramCard({
    super.key,
    required this.title,
    required this.duration,
    required this.level,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFF1BA7A6),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text("$duration • $level"),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
