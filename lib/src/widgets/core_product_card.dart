import 'package:dev_test_2degrees/src/models/core_product_model.dart';
import 'package:dev_test_2degrees/src/widgets/core_product_components.dart';
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
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.wifi,
                  color: Colors.lightBlueAccent,
                ),
                Text(
                  product.coreProductDescription,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoChip(
                    "Speed: ${product.coreProductBroadbandAverageSpeeds?.averageSpeedDownMbps}/${product.coreProductBroadbandAverageSpeeds?.averageSpeedUpMbps} Mbps - ${product.coreProductBroadbandAverageSpeeds?.averageSpeedSource}"),
                _buildInfoChip(
                    "Provider: ${product.coreProductBroadbandSupplyProvider}"),
              ],
            ),
            CoreProductComponents(components: product.coreProductComponents),
            const SizedBox(height: 12),
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
}
