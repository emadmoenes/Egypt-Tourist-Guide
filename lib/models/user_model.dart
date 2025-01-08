class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String pass;
  final String? num;
  final String address;
  final String profilePic;
  final bool isDark;
  final bool isAdmin;

  const UserModel({required this.firstName, required this.lastName, required this.email, required this.pass, required this.num, required this.address, required this.profilePic, required this.isDark, required this.isAdmin});
}