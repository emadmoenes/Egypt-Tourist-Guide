class User {
  String fullName;
  String email;
  String password;
  String? phoneNumber;
  String? profilePicUrl;
  String? address;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.profilePicUrl,
    this.address,
  });

  void updateProfilePicUrl(String url) {
    profilePicUrl = url;
  }

  void updateAddress(String address) {
    this.address = address;
  }

  void updatePhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void updatePassword(String password) {
    this.password = password;
  }
}
