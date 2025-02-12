import 'package:dev_test_2degrees/src/models/core_product_model.dart';
import 'package:flutter/material.dart';

class CoreProductCard extends StatelessWidget {
  final CoreProduct product;

  const CoreProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.coreProductDescription,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoChip(
                    "Speed: ${product.coreProductBroadbandAverageSpeeds?.averageSpeedDownMbps}/${product.coreProductBroadbandAverageSpeeds?.averageSpeedUpMbps} Mbps"),
                _buildInfoChip(
                    "Provider: ${product.coreProductBroadbandSupplyProvider}"),
              ],
            ),
            const SizedBox(height: 12),
            _buildPricingSection(product),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Chip(
      label: Text(text, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.blue.shade100,
    );
  }

  Widget _buildPricingSection(CoreProduct product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pricing:", style: TextStyle(fontWeight: FontWeight.bold)),
        Column(
          children: product.coreProductComponents
              .expand((component) => component.coreProductComponentPlans)
              .expand((plan) => plan.charges)
              .map((charge) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                        "${charge.billFrequency}: \$${charge.chargeIncludingGst.toStringAsFixed(2)}"),
                    leading:
                        const Icon(Icons.attach_money, color: Colors.green),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
