import 'package:dev_test_2degrees/src/cubits/address_qualification/address_qualification_cubit.dart';
import 'package:dev_test_2degrees/src/widgets/core_service_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QualificationResult extends StatelessWidget {
  const QualificationResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressQualificationCubit, AddressQualificationState>(
      builder: (context, state) {
        if (state is AddressQualificationStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddressQualificationStateSuccess) {
          final hasFibre = state.hasFibre1000;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  hasFibre
                      ? "Fibre 1000 is available at this address"
                      : "No Fibre 1000 service available at your address",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: state.coreServices
                          .map(
                              (service) => CoreServiceSection(service: service))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is AddressQualificationStateError) {
          return Center(child: Text(state.error));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
