// part of 'list_product_cubit.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/models/product/product_model.dart';

part 'list_product_state.freezed.dart';

@freezed
class ListProductState with _$ListProductState {
  const factory ListProductState.initial() = InitialList;
  const factory ListProductState.loading() = LoadingList;
  const factory ListProductState.loaded(List<ProductModel> data, bool nextPage, String count) = LoadedList;
  const factory ListProductState.notFound() = NotFoundList;
  const factory ListProductState.fetchError() = FetchError;
}
