import 'package:dev_test_2degrees/src/core/constants.dart';
import 'package:dev_test_2degrees/src/data/qualifications_services.dart';
import 'package:dev_test_2degrees/src/models/core_service_model.dart';
import 'package:dev_test_2degrees/src/models/qualification_result_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'address_qualification_state.dart';

@Singleton()
class AddressQualificationCubit extends Cubit<AddressQualificationState> {
  final QualificationsServices _qualificationService;

  AddressQualificationCubit({
    required QualificationsServices qualificationService,
  })  : _qualificationService = qualificationService,
        super(AddressQualificationStateEmpty());

  Future<void> getQualification({required String locationId}) async {
    emit(AddressQualificationStateLoading());
    try {
      final qualification =
          await _qualificationService.getQualification(locationId: locationId);

      final filteredCoreServices = _filterFibre1000Services(qualification);

      emit(
        AddressQualificationStateSuccess(
          qualification: qualification,
          hasFibre1000: filteredCoreServices.isNotEmpty,
          coreServices: filteredCoreServices,
        ),
      );
    } catch (e) {
      emit(AddressQualificationStateError(error: e.toString()));
    }
  }

  List<CoreService> _filterFibre1000Services(
      QualificationResult qualification) {
    return qualification.coreServices.where((coreService) {
      return coreService.coreProducts.any((coreProduct) {
        return coreProduct.coreProductBroadbandCategory ==
            AppConstants.preferredCoreProductBroadbandCategory;
      });
    }).toList();
  }
}
