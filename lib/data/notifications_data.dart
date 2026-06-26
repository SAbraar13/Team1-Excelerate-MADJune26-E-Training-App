import 'package:flutter/material.dart';
import '../models/notification_model.dart';

List<NotificationModel> notifications = [
  NotificationModel(
    title: "Announcement",
    message: "Flutter Internship Applications are now open.",
    time: "Today",
    icon: Icons.campaign,
    color: Colors.blue,
  ),

  NotificationModel(
    title: "New Program",
    message: "AI & Data Analysis Program has been added.",
    time: "Yesterday",
    icon: Icons.school,
    color: Colors.green,
  ),

  NotificationModel(
    title: "Workshop",
    message: "Career Development Workshop starts this Friday.",
    time: "2 Days Ago",
    icon: Icons.event,
    color: Colors.orange,
  ),
];
