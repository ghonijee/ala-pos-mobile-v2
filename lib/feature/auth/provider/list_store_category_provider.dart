import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:ala_pos/feature/store/domain/repository/store_category_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listStoreCategoryProvider = FutureProvider<List<StoreCategoryModel>>(
  (ref) async {
    StoreCategoryRepository repository = ref.read(storeCategoryRepositoryProvider);
    var result = await repository.getRemoteList();
    if (result.isFailure) {
      return <StoreCategoryModel>[];
    }
    return result.success;
  },
);
