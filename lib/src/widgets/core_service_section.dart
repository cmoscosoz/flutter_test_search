import 'package:dev_test_2degrees/src/models/core_service_model.dart';
import 'package:dev_test_2degrees/src/widgets/core_product_card.dart';
import 'package:flutter/material.dart';

class CoreServiceSection extends StatelessWidget {
  final CoreService service;

  const CoreServiceSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Text(
              "${service.coreServiceKey} Plans",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Column(
              children: service.coreProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CoreProductCard(product: product),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
