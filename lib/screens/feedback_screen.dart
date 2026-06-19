import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _feedbackController =
      TextEditingController();

  bool _isLoading = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('feedback')
          .add({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'feedback': _feedbackController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Feedback Submitted Successfully 🎉',
          ),
          backgroundColor: Colors.green,
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _feedbackController.clear();

      await Future.delayed(
        const Duration(seconds: 1),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to submit feedback',
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType =
        TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white70,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha:0.08),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF1BA7A6),
            width: 2,
          ),
        ),
      ),
      validator: (value) {
        if (value == null ||
            value.trim().isEmpty) {
          if (label == "Name") {
            return "Please enter your name";
          }

          if (label == "Email") {
            return "Please enter your email";
          }

          if (label == "Feedback") {
            return "Please enter feedback";
          }
        }

        if (label == "Email" &&
            !_isValidEmail(
              value!.trim(),
            )) {
          return "Please enter a valid email";
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF0D1B2A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Feedback Form",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(
                  -1 +
                      (_animationController
                              .value *
                          2),
                  -1,
                ),
                end: Alignment(
                  1,
                  1 -
                      (_animationController
                              .value *
                          2),
                ),
                colors: const [
                  Color(0xFF0D1B2A),
                  Color(0xFF1BA7A6),
                  Color(0xFF0D1B2A),
                ],
              ),
            ),
            child: child,
          );
        },
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                Container(
                  padding:
                      const EdgeInsets.all(
                    20,
                  ),
                  decoration:
                      BoxDecoration(
                    shape:
                        BoxShape.circle,
                    color: Colors.white
                        .withValues(alpha: 0.15),
                  ),
                  child: const Icon(
                    Icons.feedback,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "We Value Your Feedback",
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Colors.white,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                const Text(
                  "Help us improve your learning experience with Excelerate",
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Container(
                  padding:
                      const EdgeInsets.all(
                    20,
                  ),
                  decoration:
                      BoxDecoration(
                    color: Colors.white
                        .withValues(alpha: 0.12),
                    borderRadius:
                        BorderRadius
                            .circular(
                      25,
                    ),
                    border: Border.all(
                      color: Colors
                          .white24,
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller:
                            _nameController,
                        label: "Name",
                        icon:
                            Icons.person,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      _buildTextField(
                        controller:
                            _emailController,
                        label: "Email",
                        icon:
                            Icons.email,
                        keyboardType:
                            TextInputType
                                .emailAddress,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      _buildTextField(
                        controller:
                            _feedbackController,
                        label:
                            "Feedback",
                        icon: Icons
                            .edit_note,
                        maxLines: 5,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      SizedBox(
                        width: double
                            .infinity,
                        height: 55,
                        child:
                            ElevatedButton(
                          onPressed:
                              _isLoading
                                  ? null
                                  : _submitFeedback,
                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                const Color(
                              0xFF1BA7A6,
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color:
                                      Colors.white,
                                )
                              : const Text(
                                  "Submit Feedback",
                                  style:
                                      TextStyle(
                                    fontSize:
                                        18,
                                    fontWeight:
                                        FontWeight.bold,
                                    color:
                                        Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}