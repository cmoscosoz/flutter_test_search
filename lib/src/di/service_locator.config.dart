// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network.dart' as _i335;
import '../cubits/address_qualification/address_qualification_cubit.dart'
    as _i202;
import '../cubits/address_search/address_search_cubit.dart' as _i735;
import '../data/address_services.dart' as _i864;
import '../data/qualifications_services.dart' as _i933;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i864.AddressServices>(
        () => _i864.AddressServices(dio: gh<_i361.Dio>()));
    gh.factory<_i933.QualificationsServices>(
        () => _i933.QualificationsServices(dio: gh<_i361.Dio>()));
    gh.singleton<_i202.AddressQualificationCubit>(() =>
        _i202.AddressQualificationCubit(
            qualificationService: gh<_i933.QualificationsServices>()));
    gh.singleton<_i735.AddressSearchCubit>(() =>
        _i735.AddressSearchCubit(addressServices: gh<_i864.AddressServices>()));
    return this;
  }
}

class _$NetworkModule extends _i335.NetworkModule {}
