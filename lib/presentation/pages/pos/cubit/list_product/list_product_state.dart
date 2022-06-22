part of 'list_product_cubit.dart';

@freezed
class ListProductState with _$ListProductState {
  const factory ListProductState.initial() = _Initial;
  const factory ListProductState.loading() = _Loading;
  const factory ListProductState.loaded(List<ProductModel> data) = _Loaded;
  const factory ListProductState.notFound() = _NotFound;
}
