import 'package:egypt_tourist_guide/controllers/auth_controller.dart';
import 'package:egypt_tourist_guide/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();

  /*--------------- Methods -----------------*/
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'email should contain "@"';
    }
    if (!value.contains('.')) {
      return 'email should contain "."';
    }
    return null;
  }

  void togglePasswordVisibility() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Get input values
      final email = emailController.text;
      final password = passwordController.text;

      // Retrieve user data from SharedPreferences
      final userData = await SharedPrefsService.getUserData();

      // Validate credentials
      if (userData['email'] == email && userData['password'] == password) {
        // Navigate to the Home Screen
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  /*-------------- End of Methods ----------------*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            // image stretches to fill entire space of stack.
            child: Image.asset(
              'assets/images/pyramids.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.language, color: Colors.white, size: 30),
              onPressed: () {
                print('Change language');
              },
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        // Email field
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'name@domain.com',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        // Password field
                        controller: passwordController,
                        obscureText: hiddenPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: togglePasswordVisibility,
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Password Cannot be empty';
                          }
                          if (value!.length < 6) {
                            return 'Password should contain at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        // Login button
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromARGB(255, 4, 4, 4).withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupRoute);
                        },
                        child: const Text(
                          'Don\'t have an account? Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}