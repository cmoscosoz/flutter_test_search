part of 'address_qualification_cubit.dart';

sealed class AddressQualificationState extends Equatable {
  const AddressQualificationState();

  @override
  List<Object> get props => [];
}

final class AddressQualificationStateEmpty extends AddressQualificationState {}

final class AddressQualificationStateLoading
    extends AddressQualificationState {}

final class AddressQualificationStateSuccess extends AddressQualificationState {
  final QualificationResult qualification;
  final List<CoreService> coreServices;
  final bool hasFibre1000;

  const AddressQualificationStateSuccess({
    required this.qualification,
    this.coreServices = const [],
    this.hasFibre1000 = false,
  });

  @override
  String toString() =>
      'AddressQualificationStateSuccess { qualifications: $qualification }';

  @override
  List<Object> get props => [qualification, hasFibre1000, coreServices];
}

final class AddressQualificationStateError extends AddressQualificationState {
  final String error;

  const AddressQualificationStateError({required this.error});

  @override
  List<Object> get props => [error];
}
