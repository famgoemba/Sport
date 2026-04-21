import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D0D0D), Color(0xFF1A1A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "JOIN THE CLUB",
                style: TextStyle(
                  fontSize: 14, 
                  color: Colors.blueAccent, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 2
                ),
              ),
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 36, 
                  fontWeight: FontWeight.w900, 
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField("Full Name", Icons.person_outline),
              const SizedBox(height: 20),
              _buildTextField("Email Address", Icons.email_outlined),
              const SizedBox(height: 20),
              _buildTextField("Password", Icons.lock_outline, isObscure: true),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 10,
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                onPressed: () {
                  // Kembali ke Sign In setelah pendaftaran
                  Navigator.pop(context);
                },
                child: const Text(
                  "REGISTER NOW", 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isObscure = false}) {
    return TextField(
      obscureText: isObscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), 
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), 
          borderSide: const BorderSide(color: Colors.blueAccent)
        ),
      ),
    );
  }
}