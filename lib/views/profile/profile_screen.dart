import 'package:flutter/material.dart';
import 'package:egypt_tourist_guide/models/user_model.dart';
import 'package:egypt_tourist_guide/controllers/profile_controller.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = ProfileController();
  bool _isEditing = false;
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  User _user = User(
    fullName: 'User Name',
    email: 'user@example.com',
    password: 'Password123@',
    phoneNumber: '01###-###-####',
    address: '123 Main Street',
  );

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await _profileController.loadUserData();
    setState(() {
      _user = user;
    });
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      await _profileController.updateUserData(_user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('profile_updated_successfully'.tr()),
          backgroundColor: Colors.green,
        ),
      );

      setState(() {
        _isEditing = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('fix_form_errors'.tr()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 222, 148, 235),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'profile_details'.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              _isEditing ? Icons.save : Icons.edit_note_rounded,
                              color: Color.fromARGB(255, 222, 148, 235),
                              size: 30,
                            ),
                            onPressed: () {
                              if (_isEditing) {
                                _updateProfile();
                              } else {
                                setState(() {
                                  _isEditing = true;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: const Color.fromARGB(255, 222, 148, 235),
                      ),
                      Card(
                        color: const Color.fromARGB(255, 226, 166, 241)
                            .withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildEditableField(
                                label: 'full_name'.tr(),
                                value: _user.fullName,
                                onChanged: (value) => _user.fullName = value,
                                isEditing: _isEditing,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'validation_full_name'.tr();
                                  }
                                  return null;
                                },
                              ),
                              const Divider(height: 20),
                              _buildEditableField(
                                label: 'email'.tr(),
                                value: _user.email,
                                onChanged: (value) => _user.email = value,
                                isEditing: _isEditing,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'validation_email'.tr();
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.')) {
                                    return 'validation_email_invalid'.tr();
                                  }
                                  return null;
                                },
                              ),
                              const Divider(height: 20),
                              _buildEditableField(
                                label: 'password'.tr(),
                                value: _user.password,
                                onChanged: (value) => _user.password = value,
                                isEditing: _isEditing,
                                isPassword: true,
                                validator: (value) {
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
                                  if (!value.contains(
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                    return 'validation_password_special'.tr();
                                  }
                                  return null;
                                },
                              ),
                              const Divider(height: 20),
                              _buildEditableField(
                                label: 'phone_number'.tr(),
                                value: _user.phoneNumber ?? '',
                                onChanged: (value) => _user.phoneNumber = value,
                                isEditing: _isEditing,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'validation_phone_number_empty'.tr();
                                  }
                                  if (value.length < 10) {
                                    return 'validation_phone_number_invalid'
                                        .tr();
                                  }
                                  return null;
                                },
                              ),
                              const Divider(height: 20),
                              _buildEditableField(
                                label: 'address'.tr(),
                                value: _user.address ?? '',
                                onChanged: (value) => _user.address = value,
                                isEditing: _isEditing,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'validation_address_empty'.tr();
                                  }
                                  return null;
                                },
                              ),
                            ],
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

  Widget _buildEditableField({
    required String label,
    required String value,
    required Function(String) onChanged,
    required bool isEditing,
    bool isPassword = false,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        isEditing
            ? TextFormField(
                initialValue: value,
                obscureText: isPassword && !_isPasswordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )
                      : null,
                ),
                onChanged: onChanged,
                validator: validator,
              )
            : Text(
                isPassword ? '••••••••' : value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
      ],
    );
  }
}
