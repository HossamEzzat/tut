import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tut/core/base_view_model/base_view_model.dart';
import 'package:tut/features/store_details/domain/entities/store_details.dart';
import 'package:tut/features/store_details/domain/use_cases/store_details_usecase.dart';

class StoreDetailsViewModel extends BaseViewModel
    implements StoreDetailsViewModelInputs, StoreDetailsViewModelOutputs {
  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  final StoreDetailsUseCase _storeDetailsUseCase;

  StoreDetailsViewModel(this._storeDetailsUseCase);

  @override
  void start() {
    _getStoreDetails();
  }

  void _getStoreDetails() async {
    (await _storeDetailsUseCase.execute(null)).fold(
      (failure) {
        // left -> failure
      },
      (storeDetails) {
        // right -> data
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  @override
  Stream<StoreDetails> get outputStoreDetails =>
      _storeDetailsStreamController.stream;
}

abstract class StoreDetailsViewModelInputs {
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutputs {
  Stream<StoreDetails> get outputStoreDetails;
}
