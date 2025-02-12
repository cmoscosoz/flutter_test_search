part of 'address_search_cubit.dart';

sealed class AddressSearchState extends Equatable {
  const AddressSearchState();

  @override
  List<Object> get props => [];
}

final class SearchStateEmpty extends AddressSearchState {}

final class SearchStateLoading extends AddressSearchState {}

final class SearchStateSuccess extends AddressSearchState {
  final List<Address> addresses;

  const SearchStateSuccess({required this.addresses});

  @override
  List<Object> get props => [addresses];

  @override
  String toString() => 'SearchStateSuccess { addresses: $addresses.length }';
}

final class SearchStateError extends AddressSearchState {
  final String error;

  const SearchStateError({required this.error});

  @override
  List<Object> get props => [error];
}
