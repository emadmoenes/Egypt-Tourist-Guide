import 'package:egypt_tourist_guide/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true;
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  void togglePasswordVisibility() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();

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
        Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(75),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, //tells main axis to take min amount of space to fit its children
                children: [
                  TextFormField(
                    //Email field
                    controller: emailController,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Email Cannot be empty';
                      }
                      if (!emailRegex.hasMatch(value!)) {
                        //if no match found it evaluates to true
                        return 'Please Enter a valid Email.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    //Password field
                    controller: passwordController,
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        onPressed: () {
                          togglePasswordVisibility();
                        },
                        icon: Icon(hiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Password Cannot be empty';
                      }
                      if (value!.length < 6) {
                        // Check if the password is less than 6 characters
                        return 'Password should contain at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    //Login button
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.handleLogin(context,
                            emailController.text, passwordController.text);
                      }
                    },
                    child: Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
