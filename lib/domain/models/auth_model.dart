import 'user_model.dart';

class AuthModel {
  bool loggedStatus;
  String? personalAccessToken;
  UserModel? userModel;

  AuthModel({required this.loggedStatus, this.personalAccessToken, this.userModel});
}
