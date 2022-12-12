class VerifyOtpModel {
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? emailId;
  final String? mobile;
  final String? password;

  VerifyOtpModel(
      { this.firstName,
       this.lastName,
       this.userName,
       this.emailId,
       this.mobile,
       this.password});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        userName: json["userName"] ?? '',
        emailId: json["emailId"] ?? '',
        mobile: json["mobile"] ?? '',
        password: json["password"] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userName": userName,
      "emailId": emailId,
      "mobile": mobile,
      "password": password,
    };
  }
}
