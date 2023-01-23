class TokenModel {
  final String refreshToken;
  final String accessToken;
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}
