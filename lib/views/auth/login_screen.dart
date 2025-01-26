import 'package:egypt_tourist_guide/controllers/auth_controller.dart';
import 'package:egypt_tourist_guide/views/auth/widgets/auth_button.dart';
import 'package:egypt_tourist_guide/views/auth/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/app_images.dart';
import '../../core/app_routes.dart';
import '../../../core/app_colors.dart';

// this is the login screen widget
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hiddenPassword = true;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late AuthController _authController;

  /*-------------- Methods ----------------*/
  String? _validateEmail(String? value) {
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

  void _togglePasswordVisibility() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  bool _loginLoading = false;

  void _login() async {
    setState(() {
      _loginLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      bool isLogin = await _authController.login(email, password);

      if (isLogin) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeRoute,
          (route) => false,
        );
      } else {
        setState(() {
          _loginLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('invalid_credentials'.tr())),
        );
      }
    } else {
      setState(() {
        _loginLoading = false;
      });
    }
  }

  /*------------ End of Methods --------------*/

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _authController = AuthController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.pyramids,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.language,
                color: AppColors.white,
                size: 30,
              ),
              onPressed: () {
                // Toggle between English and Arabic
                final newLocale = context.locale.languageCode == 'en'
                    ? Locale('ar')
                    : Locale('en');
                context.setLocale(newLocale);
              },
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'login'.tr(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black87Color,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        //---- Email Form Field ----//
                        CustomTextFormField(
                          controller: _emailController,
                          labelText: 'email',
                          hintText: 'email_hint',
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 16.0),
                        //---- Password Form Field ----//
                        CustomTextFormField(
                          controller: _passwordController,
                          labelText: 'password',
                          hintText: 'password_hint',
                          obscureText: hiddenPassword,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'validation_password_empty'.tr();
                            }
                            if (value!.length < 6) {
                              return 'validation_password_length'.tr();
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        //---- Login button ----//
                        AuthButton(
                          isLoading: _loginLoading,
                          onPressed: _login,
                          buttonText: 'login'.tr(),
                        ),
                        const SizedBox(height: 16.0),
                        // Sign up prompt
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signupRoute);
                          },
                          child: Text(
                            'signup_prompt'.tr(),
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
