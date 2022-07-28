part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState.initial() = _Initial;
  factory UserProfileState.loading() = _Loading;
  factory UserProfileState.success(UserModel userModel, StoreModel storeModel) = _Success;
  factory UserProfileState.failed(String message) = _Failed;
}
