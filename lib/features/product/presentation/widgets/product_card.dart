import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/resource_images.dart';
import '../../../../core/theme/sizes.dart';
import '../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: product.images.isNotEmpty
                ? Image.network(
                    product.images[0],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                        fileCorrupted,
                        fit: BoxFit.fitHeight,
                      );
                    },
                  )
                : SvgPicture.asset(
                    fileCorrupted,
                    fit: BoxFit.fitHeight,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: mediumTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: smallTextSize,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(product.description,
                    style: const TextStyle(fontSize: smallTextSize),
                    maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
