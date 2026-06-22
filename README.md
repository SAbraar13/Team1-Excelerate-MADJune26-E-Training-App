# 🚀 E-Training App

> A Flutter-based learning and internship management platform developed as part of the Excelerate Mobile Application Development Internship.

---

## 📱 Project Overview

The E-Training App is designed to provide learners with a centralized platform to explore training programs, internships, announcements, and learning opportunities.

The application integrates Flutter, Firebase Firestore, JSON-based data management, and form validation to create a dynamic and interactive learning experience.

---

## ✨ Features

### 🔐 Authentication System

* User Registration
* User Login
* Duplicate Email Validation
* Logout Functionality
* Firebase Firestore Integration

### 📚 Program Management

* Dynamic Program Listing
* JSON-Based Data Integration
* Program Filtering
* Program Details Screen
* Dynamic Content Loading

### 💬 Feedback System

* Feedback Submission Form
* Form Validation
* Firebase Storage
* Success/Error Notifications

### 👤 User Profile

* Profile Information Display
* Program Status
* Navigation to Feedback Screen
* Logout Confirmation Dialog

### ⚡ User Experience

* Loading Indicators
* Responsive UI
* Modern Material Design
* Smooth Navigation

---

## 🛠️ Technologies Used

| Technology         | Purpose                |
| ------------------ | ---------------------- |
| Flutter            | Mobile App Development |
| Dart               | Programming Language   |
| Firebase Firestore | Database               |
| JSON               | Dynamic Program Data   |
| Git & GitHub       | Version Control        |
| Material Design 3  | UI Framework           |

---

## 📂 Project Structure

```text
lib/
├── screens/
│   ├── login_screen.dart
│   ├── registration_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── program_listing_screen.dart
│   ├── program_details_screen.dart
│   └── feedback_screen.dart

assets/
└── data/
    └── programs.json
```

---

## 📌 Week 3 Enhancements

### JSON Integration

* Program Listing loads data from `programs.json`
* Program Details display dynamic content

### Form Validation

* Registration Validation
* Email Validation
* Password Validation
* Feedback Validation

### Firebase Integration

* User Data Storage
* Feedback Storage
* Firestore Collections

### Loading Indicators

* Login Loading
* Registration Loading
* Program Loading
* Feedback Submission Loading

---

## 🔥 Firebase Collections

### Users Collection

```json
{
  "name": "User Name",
  "email": "user@email.com",
  "password": "******"
}
```

### Feedback Collection

```json
{
  "name": "User Name",
  "email": "user@email.com",
  "feedback": "Great App!",
  "createdAt": "Timestamp"
}
```

---

## 📈 Improvements Based on Evaluation Feedback

✅ Repository naming corrected

✅ Application aligned with Excelerate programs and internships

✅ Documentation improved

✅ Increased team participation in demonstrations

✅ Enhanced project presentation and testing

---


## 🎯 Learning Outcomes

Through this project, the team gained experience in:

* Flutter Application Development
* Firebase Firestore Integration
* JSON Data Handling
* Form Validation
* Loading States & Error Handling
* GitHub Collaboration
* Team-Based Software Development

---

## 🏆 Conclusion

The E-Training App successfully demonstrates a complete Flutter application featuring authentication, dynamic content management, Firebase integration, user feedback collection, and responsive user experience design.

The project reflects collaborative teamwork, continuous improvement, and practical implementation of modern mobile application development concepts.
