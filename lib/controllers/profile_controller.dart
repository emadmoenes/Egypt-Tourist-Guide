import 'package:egypt_tourist_guide/core/services/shared_prefs_service.dart';
import 'package:egypt_tourist_guide/models/user_model.dart';

class ProfileController {
  Future<User> loadUserData() async {
    final userData = await SharedPrefsService.getUserData();
    return User.fromMap(userData);
  }

  Future<void> updateUserData(User user) async {
    await SharedPrefsService.saveUserData(
      fullName: user.fullName,
      email: user.email,
      password: user.password,
      phoneNumber: user.phoneNumber,
      address: user.address,
    );
  }
}
