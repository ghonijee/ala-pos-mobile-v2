import 'package:ala_pos/feature/auth/domain/repository/auth_repository.dart';
import 'package:ala_pos/feature/store/domain/repository/store_repository.dart';
import 'package:ala_pos/shared/fields/address_field.dart';
import 'package:ala_pos/shared/fields/phone_field.dart';
import 'package:ala_pos/shared/fields/store_category_field.dart';
import 'package:ala_pos/shared/fields/store_name_field.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/store/store_register_state.dart';

final storeRegisterProvider = StateNotifierProvider<StoreRegisterNotifier, StoreRegisterState>(
  (ref) => StoreRegisterNotifier(ref.read(authRepositoryProvider), ref.read(storeRepositoryProvider)),
);

class StoreRegisterNotifier extends StateNotifier<StoreRegisterState> {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  StoreRegisterNotifier(this.authRepository, this.storeRepository) : super(StoreRegisterState());

  changeName(value) {
    state = state.copyWith(statusSubmission: FormzStatus.pure, storeNameField: StoreNameField.dirty(value));
  }

  changePhone(value) {
    state = state.copyWith(statusSubmission: FormzStatus.pure, storePhoneField: PhoneField.dirty(value));
  }

  changeCategory(value) {
    state = state.copyWith(statusSubmission: FormzStatus.pure, storeCategoryField: StoreCategoryField.dirty(value));
  }

  changeAddress(value) {
    state = state.copyWith(statusSubmission: FormzStatus.pure, storeAddressField: AddressField.dirty(value));
  }

  submit() async {
    var data = state.toStoreModel();

    // Loading
    state = state.copyWith(
      statusSubmission: FormzStatus.submissionInProgress,
    );

    var result = await storeRepository.storeData(data);

    if (result.isSuccess) {
      state = state.copyWith(
        statusSubmission: FormzStatus.submissionSuccess,
      );
    } else {
      state = state.copyWith(
        statusSubmission: FormzStatus.submissionFailure,
      );
    }
  }
}
