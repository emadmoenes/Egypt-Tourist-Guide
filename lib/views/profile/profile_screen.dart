import 'package:egypt_tourist_guide/controllers/auth_controller.dart';
import 'package:egypt_tourist_guide/core/app_colors.dart';
import 'package:egypt_tourist_guide/core/app_images.dart';
import 'package:egypt_tourist_guide/views/profile/widgets/log_out_button.dart';
import 'package:egypt_tourist_guide/views/profile/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:egypt_tourist_guide/models/user_model.dart';
import 'package:egypt_tourist_guide/controllers/profile_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController _profileController;
  late final AuthController _authController;
  bool _isEditing = false;
  bool _isPasswordVisible = false;
  late final GlobalKey<FormState> _formKey;

  // initialize user object with dummy data
  User _user = User(
    fullName: 'User Name',
    email: 'user@example.com',
    password: 'Password123@',
    phoneNumber: '01###-###-####',
    address: '123 Main Street',
  );

  //-- Load user data method --//
  Future<void> _loadUserData() async {
    final user = await _profileController.loadUserData();
    setState(() {
      _user = user;
    });
  }

  //-- Update user data method --//
  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      await _profileController.updateUserData(_user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('profile_updated_successfully'.tr()),
          backgroundColor: AppColors.green,
        ),
      );

      setState(() {
        _isEditing = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('fix_form_errors'.tr()),
          backgroundColor: AppColors.red,
        ),
      );
    }
  }

  //-- Log out method --//
  Future<void> _logOut() async {
    await _authController.logout();
  }

  @override
  void initState() {
    _profileController = ProfileController();
    _authController = AuthController();
    _formKey = GlobalKey<FormState>();
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppImages.userImage),
                ),
                const SizedBox(height: 10),
                const MyDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'profile_details'.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //-- Save Button --//
                    IconButton(
                      icon: Icon(
                        _isEditing ? Icons.save : Icons.edit_note_rounded,
                        color: AppColors.lightPurple,
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
                const MyDivider(),
                //---- Profile Card with user data ------//
                ProfileCard(
                  user: _user,
                  isEditing: _isEditing,
                  isPasswordVisible: _isPasswordVisible,
                  onTogglePasswordVisibility: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 20),
                //---- Logout Button ------//
                LogOutButton(
                  logOutFunction: () {
                    _logOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginRoute,
                      (_) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////
// My Divider widget
class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.lightPurple,
    );
  }
}
