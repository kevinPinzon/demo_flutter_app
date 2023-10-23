import 'dart:developer';

import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Function() onTap;
  const CustomAppbarWidget({super.key, required this.onTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Sport App'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: onTap,
        ),
      ],
      leading: IconButton(icon: const Icon(Icons.person), onPressed: () {}),
    );
  }
}
