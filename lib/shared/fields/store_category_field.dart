import 'package:ala_pos/feature/store/domain/models/store_category/store_category_model.dart';
import 'package:formz/formz.dart';

import 'validator_error.dart';

class StoreCategoryField extends FormzInput<StoreCategoryModel?, ValidationError> {
  // Call super.pure to represent an unmodified form input.
  const StoreCategoryField.pure() : super.pure(null);

  // Call super.dirty to represent a modified form input.
  const StoreCategoryField.dirty([StoreCategoryModel? value]) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  ValidationError? validator(value) {
    return value == null ? ValidationError.emptyStoreCategory : null;
  }
}
