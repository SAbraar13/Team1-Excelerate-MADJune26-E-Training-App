# 🚀 E-Training App

> **A Flutter-based Learning & Internship Management Platform developed as part of the Excelerate Mobile Application Development Internship.**

<p align="center">
A modern mobile application that empowers learners to discover internship opportunities, training programs, career resources, and educational content through an intuitive and interactive user experience powered by Flutter and Firebase.
</p>

---

# 🏆 Project Badges

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart\&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Firestore-FFCA28?logo=firebase\&logoColor=black)
![Material Design](https://img.shields.io/badge/Material%203-UI-6200EE)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-success)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
![Internship](https://img.shields.io/badge/Excelerate-Mobile%20Application%20Development-blue)

---

# 📑 Table of Contents

* [📱 Project Overview](#-project-overview)
* [🎯 Purpose of the App](#-purpose-of-the-app)
* [✨ Features](#-features)
* [🛠 Technology Stack](#-technology-stack)
* [🏗 System Architecture](#-system-architecture)
* [📂 Project Structure](#-project-structure)
* [📈 Week 4 Enhancements](#-week-4-enhancements)
* [🔥 Firebase Collections](#-firebase-collections)
* [📸 Screenshots](#-screenshots)
* [👥 Team Contributions](#-team-contributions)
* [📊 Improvements Based on Evaluation Feedback](#-improvements-based-on-evaluation-feedback)
* [🎯 Learning Outcomes](#-learning-outcomes)
* [🚀 Future Enhancements](#-future-enhancements)
* [🏆 Conclusion](#-conclusion)

---

# 📱 Project Overview

The **E-Training App** is a cross-platform mobile application developed using **Flutter** as part of the **Excelerate Mobile Application Development Internship**. The application serves as a centralized digital learning platform where users can discover internships, explore training programs, search learning opportunities, receive important notifications, and manage their learning journey through a clean, responsive, and user-friendly interface.

The project demonstrates the practical implementation of modern mobile application development concepts including Firebase integration, dynamic data management, responsive UI design, state-driven interfaces, reusable widgets, and intuitive navigation.

Unlike traditional static applications, the E-Training App emphasizes usability, scalability, and maintainability through modular architecture and modern Flutter development practices.

---

# 🎯 Purpose of the App

Many learners struggle to find internships, training programs, and career opportunities because information is scattered across multiple platforms. The purpose of the **E-Training App** is to provide a centralized solution that brings these opportunities together into one intuitive platform.

The application enables users to:

* Securely register and log in.
* Discover internship and training opportunities.
* Search and filter programs efficiently.
* View detailed information about each program.
* Stay updated through a dedicated notification center.
* Submit valuable feedback.
* Experience a modern and responsive mobile application.

The project focuses on delivering both an excellent user experience and a practical demonstration of Flutter application development.

---

# ✨ Features

## 🔐 Authentication System

* Secure User Registration
* Secure User Login
* Firebase Firestore Integration
* Duplicate Email Validation
* Form Validation
* Success & Error Dialogs
* Logout Functionality

---

## 🏠 Home Dashboard

* Personalized Welcome Section
* Search Bar
* Learning Categories
* Featured Excelerate Opportunities
* Notification Center
* Responsive Bottom Navigation
* Hero Animation
* Fade Page Transition

---

## 📚 Program Management

* Dynamic Program Listing
* JSON-Based Program Data
* Category Filtering
* Difficulty Level Filtering
* Real-Time Search
* Empty Search Result State
* Program Details Screen
* Dynamic Content Loading
* Loading Animation

---

## 🔔 Notification Center

* Notification Badge
* Notification Bottom Sheet
* Read / Unread Status
* Mark All as Read
* Empty Notification State
* Categorized Notifications
* Time Labels

---

## 💬 Feedback Module

* Feedback Submission Form
* Form Validation
* Firebase Firestore Storage
* Success & Error Messages

---

## 👤 User Profile

* User Information Display
* Profile Navigation
* Feedback Screen Access
* Logout Confirmation

---

## 🎨 User Experience Enhancements

* Responsive User Interface
* Material Design 3
* Custom Dialog Components
* Animated Cards
* Hero Animations
* Fade Screen Transitions
* Improved Loading Indicators
* Modern Color Theme

---

# 🛠 Technology Stack

| Category             | Technology               |
| -------------------- | ------------------------ |
| Framework            | Flutter                  |
| Programming Language | Dart                     |
| Backend              | Firebase Core            |
| Cloud Database       | Cloud Firestore          |
| Local Data           | JSON Assets              |
| UI Framework         | Material Design 3        |
| IDE                  | Android Studio / VS Code |
| Version Control      | Git & GitHub             |

---

# 🏗 System Architecture

```text
                        ┌──────────────────────┐
                        │  Firebase Firestore  │
                        └──────────┬───────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │ Authentication & User Data  │
                    └──────────────┬──────────────┘
                                   │
                          Login / Registration
                                   │
                                   ▼
                        ┌──────────────────────┐
                        │    Home Dashboard    │
                        └───────┬───────┬──────┘
                                │       │
                 ┌──────────────┘       └──────────────┐
                 ▼                                     ▼
        Learning Categories                  Notification Center
                 │                                     │
                 ▼                                     ▼
          Program Listing                     Read / Unread Updates
                 │
                 ▼
          Program Details
                 │
                 ▼
             Feedback Module
```

---

# 📂 Project Structure

```text
lib/
│
├── data/
│   └── notifications_data.dart
│
├── models/
│   └── notification_model.dart
│
├── screens/
│   ├── login_screen.dart
│   ├── registration_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── program_listing_screen.dart
│   ├── program_details_screen.dart
│   └── feedback_screen.dart
│
├── widgets/
│   ├── category_card.dart
│   ├── program_card.dart
│   ├── custom_dialog.dart
│   └── page_transition.dart
│
├── firebase_options.dart
│
└── main.dart

assets/
└── data/
    └── programs.json
```

---

# 📈 Week 4 Enhancements

### 🔍 Smart Search System

* Home Screen Search
* Program Listing Search
* Dynamic Search Filtering
* Instant Search Results
* Empty Search Result Screen

---

### 🔔 Notification Center

* Notification Badge
* Bottom Sheet Notification Panel
* Read / Unread Notifications
* Mark All as Read
* Empty Notification State

---

### 🎨 UI & UX Improvements

* Hero Animation
* Fade Page Transitions
* Improved Welcome Dashboard
* Enhanced Category Cards
* Better Loading Screens
* Responsive Design Improvements

---

### 📚 Program Module Improvements

* Category-Based Navigation
* Advanced Program Filtering
* Improved Program Cards
* Better Program Details
* Dynamic JSON Integration

---

### 🔥 Firebase Improvements

* Firebase Android Configuration
* Firebase Web Configuration
* Firestore Integration
* Improved Authentication Flow
* Better Error Handling

---

### 🧪 Testing & Debugging

* Authentication Testing
* Search Functionality Testing
* Navigation Testing
* Notification System Testing
* Firebase Connectivity Testing
* Responsive UI Testing
* Bug Fixes & Performance Optimization

---

# 🔥 Firebase Collections

## Users Collection

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "********"
}
```

---

## Feedback Collection

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "feedback": "Excellent application with a great user experience.",
  "createdAt": "Timestamp"
}
```

---

# 📸 Screenshots

> **Add screenshots before final submission.**

### 🔐 Authentication

* Login Screen
* Registration Screen

### 🏠 Dashboard

* Home Screen
* Notification Center

### 📚 Programs

* Program Listing
* Search Results
* Program Details

### 👤 User

* Profile Screen
* Feedback Screen

---

# 👥 Team Contributions

| Module         | Contribution                              |
| -------------- | ----------------------------------------- |
| Authentication | Firebase Login, Registration & Validation |
| Home Dashboard | UI Development, Categories & Search       |
| Program Module | Program Listing, Search & Filtering       |
| Notifications  | Badge, Bottom Sheet & Read Status         |
| Feedback       | Firebase Firestore Integration            |
| UI/UX          | Animations, Dialogs & Responsive Design   |
| Testing        | Functional Testing & Bug Fixes            |

---

# 📊 Improvements Based on Evaluation Feedback

✅ Integrated Firebase Authentication & Firestore

✅ Implemented Dynamic JSON-Based Program Management

✅ Added Smart Search Functionality

✅ Introduced Notification Center with Badge & Read Status

✅ Improved UI using Hero Animations & Fade Transitions

✅ Enhanced Navigation Flow & User Experience

✅ Optimized Loading States and Error Handling

✅ Improved Project Documentation & Code Organization

✅ Performed Comprehensive Testing & Bug Fixing

---

# 🎯 Learning Outcomes

This project provided practical experience in:

* Flutter Application Development
* Firebase Firestore Integration
* FlutterFire Configuration
* JSON Data Parsing
* Search & Filtering Techniques
* State Management
* Responsive UI Design
* Hero Animations & Page Transitions
* Form Validation
* Error Handling & Debugging
* Git & GitHub Collaboration
* Team-Based Software Development

---

# 🚀 Future Enhancements

* Firebase Cloud Messaging (Push Notifications)
* Dark Mode
* Program Enrollment System
* Certificate Downloads
* Bookmark Favorite Programs
* AI-Based Program Recommendations
* User Progress Tracking
* Admin Dashboard
* Offline Support
* Multi-language Support

---

# 🏆 Conclusion

The **E-Training App** demonstrates the successful development of a modern Flutter application that combines **Firebase Authentication**, **Cloud Firestore**, **dynamic JSON-based program management**, **real-time search**, **notification management**, and a **responsive user interface**.

The project reflects collaborative teamwork, continuous learning, and the practical implementation of modern mobile application development concepts. It establishes a scalable foundation for future enhancements while delivering an intuitive and engaging learning platform for users.


# ⚙️ Part 2 – Complete Setup & Installation Guide

This guide provides step-by-step instructions to set up, configure, and run the **E-Training App** on both Android and Web platforms.

---

# 💻 Required Software

Before setting up the project, ensure the following software is installed on your system.

| Software | Recommended Version | Purpose |
|----------|----------------------|---------|
| Flutter SDK | Latest Stable | Flutter Framework |
| Dart SDK | Included with Flutter | Programming Language |
| Android Studio | Latest | Android Development |
| VS Code *(Optional)* | Latest | Code Editor |
| Git | Latest | Version Control |
| Node.js | LTS Version | Firebase CLI |
| Firebase CLI | Latest | Firebase Configuration |
| FlutterFire CLI | Latest | Firebase Integration |
| Google Chrome | Latest | Web Testing |

---

# 📦 Flutter Installation

## Step 1 – Download Flutter SDK

Download the latest stable version of Flutter from the official website:

https://flutter.dev/docs/get-started/install

---

## Step 2 – Extract Flutter

Extract Flutter to a preferred directory.

Example:

```text
C:\src\flutter
```

---

## Step 3 – Add Flutter to System PATH

Add the following directory to your system environment variables:

```text
C:\src\flutter\bin
```

---

## Step 4 – Verify Installation

Open Command Prompt and run:

```bash
flutter doctor
```

Resolve any reported issues before proceeding.

---

# 🤖 Android Studio Setup

## Install Android Studio

Download Android Studio:

https://developer.android.com/studio

---

## Install Required Components

During installation, ensure the following are selected:

- Android SDK
- Android SDK Platform Tools
- Android Emulator
- Android SDK Command-line Tools

---

## Install Flutter Plugin

Android Studio

↓

Settings

↓

Plugins

↓

Search **Flutter**

↓

Install

*(The Dart plugin will be installed automatically.)*

---

## Verify Setup

Run:

```bash
flutter doctor
```

Expected Output:

```text
✓ Flutter
✓ Android Toolchain
✓ Chrome
✓ Android Studio
✓ Connected Device
```

---

# 📥 Repository Cloning

Clone the project repository:

```bash
https://github.com/SAbraar13/Team1-Excelerate-MADJune26-E-Training-App/edit/main/README.md
```

Navigate into the project folder:

```bash
cd Team1-Excelerate-MADJune26-E-Training-App
```

---

# 📚 Dependency Installation

Install all required Flutter packages:

```bash
flutter pub get
```

To verify package versions:

```bash
flutter pub outdated
```

---

# 🔥 Firebase Configuration (Android & Web)

## Step 1 – Install Firebase CLI

Install using Node.js:

```bash
npm install -g firebase-tools
```

Verify installation:

```bash
firebase --version
```

---

## Step 2 – Login to Firebase

```bash
firebase login
```

Login using your Google account associated with Firebase.

---

## Step 3 – Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

If the command is not recognized, add the following directory to your PATH:

```text
C:\Users\<YourUsername>\AppData\Local\Pub\Cache\bin
```

---

## Step 4 – Configure Firebase

Inside the project folder, execute:

```bash
flutterfire configure
```

Select:

- Android
- Web

This command generates:

```text
lib/firebase_options.dart
```

---

## Step 5 – Android Configuration

Ensure the following file exists:

```text
android/app/google-services.json
```

---

## Step 6 – Verify Firebase Packages

Confirm that `pubspec.yaml` contains:

```yaml
dependencies:
  firebase_core:
  cloud_firestore:
```

---

# ▶️ Running the Application

## Android Emulator

Start an emulator and run:

```bash
flutter run
```

---

## Physical Android Device

Enable Developer Options and USB Debugging.

Run:

```bash
flutter devices
```

Then:

```bash
flutter run
```

---

## Google Chrome

```bash
flutter run -d chrome
```

---

## Microsoft Edge

```bash
flutter run -d edge
```

---

# 🧪 Testing Guide

Before submitting the project, perform the following verification tests.

---

## Authentication Testing

- ✅ User Registration
- ✅ Duplicate Email Validation
- ✅ Login Authentication
- ✅ Invalid Login Handling
- ✅ Logout Functionality

---

## Home Screen Testing

- ✅ Welcome Section
- ✅ Search Bar
- ✅ Learning Categories
- ✅ Notification Badge
- ✅ Bottom Navigation
- ✅ Hero Animation

---

## Program Module Testing

- ✅ Program Listing
- ✅ Category Filtering
- ✅ Level Filtering
- ✅ Search Functionality
- ✅ Program Details

---

## Notification Testing

- ✅ Notification Panel Opens
- ✅ Badge Count Updates
- ✅ Read/Unread Status
- ✅ Mark All as Read
- ✅ Empty Notification State

---

## Feedback Testing

- ✅ Form Validation
- ✅ Firebase Storage
- ✅ Success Dialog
- ✅ Error Handling

---

## UI Testing

- ✅ Responsive Layout
- ✅ Animations
- ✅ Page Transitions
- ✅ Loading Indicators
- ✅ No Layout Overflow

---

## Performance Testing

- ✅ Fast Screen Navigation
- ✅ Smooth Animations
- ✅ No Runtime Exceptions
- ✅ Stable Firebase Connection

---

# 🛠 Troubleshooting Common Errors

## Flutter Command Not Found

### Error

```text
flutter : command not found
```

### Solution

Verify Flutter is added to the system PATH.

---

## Firebase CLI Not Found

### Error

```text
firebase : command not found
```

### Solution

Install Firebase CLI:

```bash
npm install -g firebase-tools
```

---

## FlutterFire CLI Not Found

### Error

```text
flutterfire : command not found
```

### Solution

```bash
dart pub global activate flutterfire_cli
```

Then add:

```text
C:\Users\<YourUsername>\AppData\Local\Pub\Cache\bin
```

to your PATH.

---

## Missing firebase_options.dart

### Error

```text
No Firebase App '[DEFAULT]' has been created.
```

### Solution

Run:

```bash
flutterfire configure
```

This generates:

```text
lib/firebase_options.dart
```

---

## Google Services Plugin Conflict

### Error

```text
Plugin already on classpath with different version
```

### Solution

Ensure the Google Services plugin is declared only once and uses the same version across Gradle configuration files.

---

## Firestore Permission Denied

### Error

```text
PERMISSION_DENIED
```

### Solution

Verify:

- Firestore Security Rules
- Firebase Project Configuration
- Internet Connectivity

---

## Dependency Issues

Run:

```bash
flutter clean
```

Then:

```bash
flutter pub get
```

---

## Build Failure

Run:

```bash
flutter clean
```

```bash
flutter pub get
```

```bash
flutter run
```

---

## Check Project Health

```bash
flutter doctor
```

```bash
flutter analyze
```

```bash
dart format .
```

Resolve all reported issues before deployment.

---

# 📞 Support

For project-related issues or improvements:

- Review the project documentation.
- Verify Firebase configuration.
- Check Flutter and Dart SDK versions.
- Ensure all dependencies are installed correctly.
- Consult the official Flutter and Firebase documentation for advanced troubleshooting.

### Official Resources

- Flutter Documentation: https://docs.flutter.dev/
- Firebase Documentation: https://firebase.google.com/docs
- Dart Documentation: https://dart.dev/guides

---

# 📄 License

This project was developed as part of the **Excelerate Mobile Application Development Internship** for educational and learning purposes.

© 2026 Team 1 – Excelerate Mobile Application Development Internship

All rights reserved. Unauthorized commercial distribution or reproduction without permission is prohibited.
