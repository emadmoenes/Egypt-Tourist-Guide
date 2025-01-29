import 'package:egypt_tourist_guide/core/app_strings_en.dart';
import 'package:egypt_tourist_guide/core/services/shared_prefs_service.dart';
import 'package:egypt_tourist_guide/models/user_model.dart';

class AuthController {
  //-- sign up method --//
  Future<void> signup({
    required User user,
  }) async {
    await SharedPrefsService.saveUserData(
      fullName: user.fullName,
      email: user.email,
      password: user.password,
      phoneNumber: user.phoneNumber,
      profilePicUrl: user.profilePicUrl,
      address: user.address,
    );
  }

  //-- login method --//
  Future<bool> login(String email, String password) async {
    final userData = await SharedPrefsService.getUserData();
    User user = User.fromMap(userData);
    if (user.email == email && user.password == password) {
      // save dummy token
      await SharedPrefsService.saveStringData(
        key: AppStringEn.tokenKey,
        value: 'dummy_token',
      );
      return true;
    }
    return false;
  }

  //-- logout method --//
  Future<void> logout() async {
    await SharedPrefsService.clearStringData(key: AppStringEn.tokenKey);
  }
}
