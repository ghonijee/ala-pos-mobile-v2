part of 'master_product_cubit.dart';

@freezed
class MasterProductState with _$MasterProductState {
  const factory MasterProductState.initial() = _Initial;
  const factory MasterProductState.loading() = _Loading;
  const factory MasterProductState.loaded(List<ProductModel> data, bool nextPage) = _Loaded;
  const factory MasterProductState.notFound() = _NotFound;
  const factory MasterProductState.empty() = _Empty;
  const factory MasterProductState.fetchError() = _FetchError;
}
