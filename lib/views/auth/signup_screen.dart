import 'package:egypt_tourist_guide/controllers/auth_controller.dart';
import 'package:egypt_tourist_guide/core/app_images.dart';
import 'package:egypt_tourist_guide/views/auth/widgets/auth_button.dart';
import 'package:egypt_tourist_guide/views/auth/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/app_routes.dart';
import '../../../core/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneController;
  late final AuthController _authController;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _signUpLoading = false;

  //-- Signup function --//
  void _signUp() async {
    setState(() {
      _signUpLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      final fullName = _fullNameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final phoneNumber = _phoneController.text;
      await _authController.signup(
        fullName: fullName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.loginRoute,
        (route) => false,
      );
    } else {
      setState(() {
        _signUpLoading = false;
      });
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
    _authController = AuthController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*----------- Methods -----------*/
    // validation
    String? validateFullName(String? value) {
      if (value == null || value.isEmpty) {
        return 'validation_full_name'.tr();
      }
      return null;
    }

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'validation_email'.tr();
      }
      if (!value.contains('@')) {
        return 'validation_email_at'.tr();
      }
      if (!value.contains('.')) {
        return 'validation_email_dot'.tr();
      }
      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'validation_password_empty'.tr();
      }
      if (value.length < 8) {
        return 'validation_password_length'.tr();
      }
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'validation_password_uppercase'.tr();
      }
      if (!value.contains(RegExp(r'[a-z]'))) {
        return 'validation_password_lowercase'.tr();
      }
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'validation_password_digit'.tr();
      }
      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return 'validation_password_special'.tr();
      }
      return null;
    }

    String? validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'validation_confirm_password'.tr();
      }
      if (value != _passwordController.text) {
        return 'validation_confirm_password_match'.tr();
      }
      return null;
    }
    /*----------- End of Methods -----------*/

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.signupBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //-- Change language icon --//
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.language, color: Colors.white, size: 30),
              onPressed: () {
                // Toggle between English and Arabic
                final newLocale = context.locale.languageCode == 'en'
                    ? Locale('ar')
                    : Locale('en');
                context.setLocale(newLocale);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Sign up text
                        Text(
                          'signup'.tr(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black87Color,
                          ),
                        ),
                        const SizedBox(height: 35),
                        //---- Full Name Form Field ----//
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          controller: _fullNameController,
                          labelText: 'full_name',
                          hintText: 'enter_full_name',
                          validator: validateFullName,
                        ),
                        const SizedBox(height: 16),
                        //---- Email Form Field ----//
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          labelText: 'email',
                          hintText: 'email_hint',
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 16),
                        //---- Password Form Field ----//
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          labelText: 'password',
                          hintText: 'password_hint',
                          obscureText: !_isPasswordVisible,
                          validator: validatePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        //---- Confirm password Form Field ----//
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _confirmPasswordController,
                          labelText: 'confirm_password',
                          hintText: 'confirm_password_hint',
                          obscureText: !_isConfirmPasswordVisible,
                          validator: validateConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        //---- Phone Form Field ----//
                        CustomTextFormField(
                          controller: _phoneController,
                          labelText: 'phone_number',
                          hintText: 'phone_number_hint',
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 35),
                        //---- Sign Up Button ----//
                        AuthButton(
                          isLoading: _signUpLoading,
                          buttonText: 'signup'.tr(),
                          onPressed: _signUp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
