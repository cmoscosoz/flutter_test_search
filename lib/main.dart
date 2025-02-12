import 'package:dev_test_2degrees/banner_section.dart';
import 'package:dev_test_2degrees/src/cubits/address_qualification/address_qualification_cubit.dart';
import 'package:dev_test_2degrees/src/cubits/address_search/address_search_cubit.dart';
import 'package:dev_test_2degrees/src/di/service_locator.dart';
import 'package:dev_test_2degrees/src/widgets/qualification_result.dart';
import 'package:dev_test_2degrees/src/widgets/search_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(Providers(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Broadband Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Broadband search'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BannerSection(),
          AutocompleteAddressSearch(),
          Expanded(child: QualificationResult()),
        ],
      ),
    );
  }
}

class Providers extends StatelessWidget {
  final Widget child;
  const Providers({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddressSearchCubit>(
          create: (_) => serviceLocator<AddressSearchCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AddressQualificationCubit>(),
        ),
      ],
      child: child,
    );
  }
}
