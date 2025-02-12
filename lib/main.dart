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

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Unlimited Broadband from\n\$50 a month",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "When you join us on a 12-month plan.",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: const Text(
                  "SAY WHAAAAAAAAAT?!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text("😜", style: TextStyle(fontSize: 32)),
            ],
          ),
        ],
      ),
    );
  }
}
