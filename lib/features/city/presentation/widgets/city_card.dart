import 'package:demo_flutter_app/features/city/data/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';

import '../../../../core/routes/resource_images.dart';
import '../../../../core/theme/sizes.dart';

class CityCard extends StatelessWidget {
  final City city;
  final Function() onTap;

  const CityCard({Key? key, required this.city, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: cityImage(city.image, fileCorrupted),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.name,
                    style: const TextStyle(
                      fontSize: mediumTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(),
                  Text(city.location,
                      style: const TextStyle(fontSize: smallTextSize),
                      maxLines: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cityImage(String base64Image, String fileCorrupted) {
    try {
      final imageData = base64Decode(base64Image);
      return Image.memory(
        height: 100,
        imageData,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return SvgPicture.asset(
            fileCorrupted,
            fit: BoxFit.fitHeight,
          );
        },
      );
    } catch (e) {
      return SvgPicture.asset(
        fileCorrupted,
        fit: BoxFit.fitHeight,
      );
    }
  }
}
