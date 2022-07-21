part of 'scan_product_cubit.dart';

@freezed
class ScanProductState with _$ScanProductState {
  const factory ScanProductState.initial() = _Initial;
  const factory ScanProductState.loading() = _Loading;
  const factory ScanProductState.success(ProductModel model) = _Success;
  const factory ScanProductState.failed(String message) = _Failed;
}
