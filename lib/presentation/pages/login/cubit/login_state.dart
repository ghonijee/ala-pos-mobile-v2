part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.onSuccess() = _OnSuccess;
  const factory LoginState.onFailure({message}) = _OnFailure;
}
