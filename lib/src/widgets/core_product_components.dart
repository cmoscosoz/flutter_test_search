import 'package:dev_test_2degrees/src/models/core_product_component_model.dart';
import 'package:flutter/material.dart';

class CoreProductComponents extends StatelessWidget {
  final List<CoreProductComponent> components;

  const CoreProductComponents({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: components
          .map((component) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  component.coreProductComponentPlans.isEmpty
                      ? const SizedBox()
                      : Text(
                          component.coreProductComponentService,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                  const SizedBox(height: 8),
                  Column(
                    children: component.coreProductComponentPlans
                        .map(
                          (plan) => ListTile(
                            title: Text(plan.planDescription),
                            trailing: PricingDetails(
                              price: plan.charges.first.chargeIncludingGst,
                              billFrequency: plan.charges.first.billFrequency,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ))
          .toList(),
    );
  }
}

class PricingDetails extends StatelessWidget {
  final double price;
  final String billFrequency;

  const PricingDetails({
    super.key,
    required this.price,
    required this.billFrequency,
  });

  static const double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    if (price == 0) {
      return const Text(
        "Free",
        style: TextStyle(fontSize: fontSize, color: Colors.lightBlue),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\$${price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: fontSize,
              color: Colors.lightBlue,
            ),
          ),
          TextSpan(
            text: " / $billFrequency",
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
