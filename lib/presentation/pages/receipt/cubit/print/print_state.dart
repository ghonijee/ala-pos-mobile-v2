part of 'print_cubit.dart';

@freezed
class PrintState with _$PrintState {
  const factory PrintState.initial() = _Initial;
  const factory PrintState.loaded(List devices) = _Loaded;
  const factory PrintState.notFound() = _NotFound;
  const factory PrintState.loading(List devices) = _Loading;
}
