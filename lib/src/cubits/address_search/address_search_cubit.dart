import 'dart:async';

import 'package:dev_test_2degrees/src/data/address_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_test_2degrees/src/models/address_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'address_search_state.dart';

@Singleton()
class AddressSearchCubit extends Cubit<AddressSearchState> {
  final AddressServices _addressService;
  final StreamController<String> _searchQueryController =
      StreamController<String>.broadcast();
  static const Duration debounceDuration = Duration(milliseconds: 500);

  AddressSearchCubit({
    required AddressServices addressServices,
  })  : _addressService = addressServices,
        super(SearchStateEmpty()) {
    _searchQueryController.stream
        .distinct()
        .debounce(debounceDuration)
        .listen((query) => performSearch(query));
  }

  void onTextChange(String query) async {
    _searchQueryController.add(query);
  }

  Future<void> performSearch(String query) async {
    if (query.isEmpty) {
      emit(SearchStateEmpty());
      return;
    }

    emit(SearchStateLoading());

    try {
      final addresses = await _addressService.searchAddress(query);

      emit(SearchStateSuccess(addresses: addresses));
    } catch (e) {
      emit(SearchStateError(error: e.toString()));
    }
  }

  Future<void> clearSearch() async {
    emit(SearchStateEmpty());
  }

  @override
  Future<void> close() {
    _searchQueryController.close();
    return super.close();
  }
}
